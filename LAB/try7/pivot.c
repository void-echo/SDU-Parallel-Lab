#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#define WIN32
#include <time.h>
#ifdef WIN32
#include <windows.h>
#else
#include <sys/time.h>
#endif
#ifdef WIN32
int gettimeofday(struct timeval *tp, void *tzp) {
    time_t clock;
    struct tm tm;
    SYSTEMTIME wtm;
    GetLocalTime(&wtm);
    tm.tm_year = wtm.wYear - 1900;
    tm.tm_mon = wtm.wMonth - 1;
    tm.tm_mday = wtm.wDay;
    tm.tm_hour = wtm.wHour;
    tm.tm_min = wtm.wMinute;
    tm.tm_sec = wtm.wSecond;
    tm.tm_isdst = -1;
    clock = mktime(&tm);
    tp->tv_sec = clock;
    tp->tv_usec = wtm.wMilliseconds * 1000;
    return (0);
}
#endif
#include <omp.h>

#ifdef WIN32
// get logical cpu core num and store in cpu_num
int get_cpu_core_num() {
    SYSTEM_INFO sysinfo;
    GetSystemInfo(&sysinfo);
    return sysinfo.dwNumberOfProcessors;
}
#else
int get_cpu_core_num() { return sysconf(_SC_NPROCESSORS_ONLN); }
#endif

static const int thread_count = 6;
static double *points;
static int n, dim, nums_p, p_dot_id;
// n : number of points,

// dim : dimension of points,
// nums_p : number of pivots,
// p_dot_id : pivot dot id

static int m = 2;
static int count = 0;
static double *euclidean_distance;

typedef struct {
    int *values;
    double cost;
} combination;

static combination *object;

// return the original Euclidean coordinate of the point
static inline double get_point_coordinate_of_id_and_dimension(int id,
                                                             int dimension) {
    return points[id * dim + dimension];
}
// calculate the Euclidean distance between two points, in the original
// coordinate
static inline double get_distance(int id1, int id2) {
    double sum = 0;
    for (int i = 0; i < dim; i++) {
        double diff = get_point_coordinate_of_id_and_dimension(id1, i) -
                     get_point_coordinate_of_id_and_dimension(id2, i);
        sum += diff * diff;
    }
    return sqrt(sum);
}

static inline void calcEuclideanDistanceAndStoreInArray() {
    // when adding this pragma, the program can be really fast!
    // #pragma omp parallel for num_threads(thread_count)
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            euclidean_distance[i * n + j] = get_distance(i, j);
        }
        // printf("calcEuclideanDistanceAndStoreInArray: %d\n", i);
    }
}

static inline double calcOneChebyshevDistance(
    int dot_id1, int dot_id2, int *one_pivot_combination_container) {
    if (dot_id1 == dot_id2) {
        return 0;
    }
    // one_pivot_combination_container is a container to store the pivot
    // combination. each element in the container is a pivot id.
    double max = 0;
    for (int i = 0; i < nums_p; i++) {
        int pivot = one_pivot_combination_container[i];
        // printf("pivot: %d ", pivot);
        double diff = fabs(euclidean_distance[dot_id1 * n + pivot] -
                          euclidean_distance[dot_id2 * n + pivot]);
        if (diff > max) {
            max = diff;
        }
    }
    return max;
}

static inline void calcAllChebyshevDistanceAndStoreInArray(
    double **chebyshev_matrix, int *pivots_container) {
    for (int i = 0; i < n; i++) {
        // printf("calcAllChebyshevDistanceAndStoreInArray: %d\n", i);
        for (int j = 0; j < n; j++) {
            // printf("i = %d, j = %d\n", i, j);
            if (i <= j) {
                chebyshev_matrix[i][j] = 0;
            } else {
                chebyshev_matrix[i][j] =
                    calcOneChebyshevDistance(i, j, pivots_container);
            }
        }
    }
}

static double inline add_all_entries_of_matrix(double **matrix) {
    double sum = 0;
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            sum += matrix[i][j];
        }
    }
    return sum;
}

static void printEuclideanDistance() {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            printf("%e ", euclidean_distance[i * n + j]);
        }
        printf("\n");
    }
}

static int __c_n_m = 0;
static int inline c_n_m(int n, int m) {
    // C(n, m) = n! / (m! * (n - m)!)
    if (__c_n_m == 0) {
        int result = 1;
        for (int i = 1; i <= m; i++) {
            result = result * (n - i + 1) / i;
        }
        __c_n_m = result;
        return result;
    }
    return __c_n_m;
}

// work as static class method
static void inline __minus1(combination *c) { c->values[m - 1]--; }

// work as static class method
static void inline __plus1(combination *c) { c->values[m - 1]++; }
// work as static class method
static int inline __last2same(combination *c) {
    return c->values[m - 1] == c->values[m - 2];
}
// work as static class method
static void inline __print_combination(combination *c) {
    // format: (1, 2, 3, 4, 5, 6)
    printf("(%d", c->values[0]);
    for (int i = 1; i < m; i++) {
        printf(", %d", c->values[i]);
    }
    printf(")\n");
}

static int *comb, *tmp, *values;
static combination *next_combination(combination *com) {
    // printf("next_combination\n");
    int i = m - 1;
    while (i >= 0 && comb[i] == n + 1 - m + i) {
        i--;
    }
    if (i < 0) {
        // print red message
        printf("Warning: No more combinations!\n");
        return NULL;
    }

    comb[i]++;
    for (int j = i + 1; j < m; j++) {
        comb[j] = comb[j - 1] + 1;
    }
    // copy comb to tmp
    for (int i = 0; i < m; i++) {
        tmp[i] = comb[i];
    }
    // printf("count = %d\n", count);
    count++;
    for (int i = 0; i < m; i++) {
        values[i] = tmp[i];
    }
    // for __j in com.values:
    for (int __j = 0; __j < m; __j++) {
        com->values[__j] = values[__j];
    }
    com->cost = 0;
    // finished newing a combination struct
    __minus1(com);
    if (__last2same(com)) {
        count--;
        return next_combination(com);
    }
    return com;
}

static void inline init_comb_and_tmp_and_values() {
    // init comb and tmp
    comb = (int *)malloc(sizeof(int) * m);
    tmp = (int *)malloc(sizeof(int) * m);
    values = (int *)malloc(sizeof(int) * m);
    for (int i = 0; i < m; i++) {
        comb[i] = i;
        tmp[i] = i;
    }
}

static int res_index = 0;
// static inline void store

static inline void store_in_object(combination *com) {
    // object[res_index].values = (int *)malloc(sizeof(int) * m);

    for (int i = 0; i < m; i++) {
        object[res_index].values[i] = com->values[i];
    }
    object[res_index].cost = com->cost;
    res_index++;
}

// It seems this function is not used, and not correct. :-(
int compare_2_combinations(const void *a, const void *b) {
    combination *c1 = (combination *)a;
    combination *c2 = (combination *)b;
    // compare double type, but return int type
    if (c1->cost > c2->cost) {
        return 1;
    } else if (c1->cost < c2->cost) {
        return -1;
    } else {
        return 0;
    }
}

static void inline dmp_object_array_to_file() {
    FILE *fp = fopen("object.txt", "w");
    // write the last 1000 combinations to file, reverse order
    int len = c_n_m(n, m);
    for (int i = len - 1; i >= len - 1000; i--) {
        for (int j = 0; j < m; j++) {
            fprintf(fp, "%d", object[i].values[j]);
            if (j != m - 1) {
                fprintf(fp, " ");
            }
        }
        fprintf(fp, "\n");
    }
    // write the first 1000 combinations to file, normal order
    for (int i = 0; i < 1000; i++) {
        for (int j = 0; j < m; j++) {
            fprintf(fp, "%d", object[i].values[j]);
            if (j != m - 1) {
                fprintf(fp, " ");
            }
        }
        fprintf(fp, "\n");
    }
}

static void inline sort_object_array_by_cost(int DEBUG) {
    // This function is really quick. when n = 500 and m = 2,
    // it only takes 18 ms to sort 124750 combinations in object array.
    if (DEBUG) {
        // DEBUG mode do nothing more than print time cost of sorting.
        int len = c_n_m(n, m);
        struct timeval start, end;
        gettimeofday(&start, NULL);
        qsort(object, len, sizeof(combination), compare_2_combinations);
        gettimeofday(&end, NULL);
        printf("\n\nqsort() time: %ld ms\n",
               (end.tv_sec - start.tv_sec) * 1000 +
                   (end.tv_usec - start.tv_usec) / 1000);

    } else {
        int len = c_n_m(n, m);
        qsort(object, len, sizeof(combination), compare_2_combinations);
    }
}

static inline void sniff_object_array() {
    // This function provides a way to quickly check the object array.
    // it does not print all combinations, but only print the first 10 and the
    // last 10 pivot combinations. It is useful when n is large, and m is small.
    // print first 10 elements in the object array
    printf("first 10 elements in the object array:\n");
    for (int i = 0; i < 10; i++) {
        printf("cost = %lf, values = ", object[i].cost);
        for (int j = 0; j < m; j++) {
            printf("%d ", object[i].values[j]);
        }
        printf("\n");
    }
    // print the last 10 elements in the object array
    printf("last 10 elements in the object array:\n");
    for (int i = c_n_m(n, m) - 10; i < c_n_m(n, m); i++) {
        printf("cost = %lf, values = ", object[i].cost);
        for (int j = 0; j < m; j++) {
            printf("%d ", object[i].values[j]);
        }
        printf("\n");
    }
}

int main(int argc, char *argv[]) {
    int DEBUG = 0;  // 0: run the program normally, 1: run some unit tests
    if (!DEBUG) {
        printf("NOT DEBUG MODE!\n");
        char *filename = (char *)"uniformvector-2dim-5h.txt";
        if (argc == 2) {
            filename = argv[1];
        } else if (argc != 1) {
            printf("Usage: ./pivot <filename>\n");
            return -1;
        }
        // set omp thread count
        // omp_set_num_threads(thread_count);
        // set up timer
        struct timeval start, end;

        // M : number of combinations to store
        const int M = 1000;
        FILE *file = fopen(filename, "r");
        if (file == NULL) {
            printf("%s file not found.\n", filename);
            return -1;
        }
        fscanf(file, "%d", &dim);
        fscanf(file, "%d", &n);
        fscanf(file, "%d", &nums_p);
        m = nums_p;
        printf("dim = %d, point number = %d, pivot numver = %d\n", dim, n,
               nums_p);
        init_comb_and_tmp_and_values();
        // allocate memory for points
        points = (double *)malloc(sizeof(double) * n * dim);
        // read points
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < dim; j++) {
                fscanf(file, "%lf", &points[i * dim + j]);
            }
        }
        printf("points read finished.\n");
        fclose(file);
        gettimeofday(&start, NULL);

        euclidean_distance = (double *)malloc(sizeof(double) * n * n);
        struct timeval start1, end1;
        // gettimeofday(&start1, NULL);
        object = (combination *)malloc(sizeof(combination) * c_n_m(n, m));
        for (int i = 0; i < c_n_m(n, m); i++) {
            object[i].values = (int *)malloc(sizeof(int) * m);
            object[i].cost = 0;
        }
        // gettimeofday(&end1, NULL); time cost = 5ms

        // calculate the Euclidean distance between every two points, in the
        // original coordinate.
        calcEuclideanDistanceAndStoreInArray();
        printf("Euclidean distance calculated.\n");
        int each_thread_works = c_n_m(n, m) / thread_count + 1;
        printf("each_thread_works = %d\n", each_thread_works);
        omp_lock_t LOCK_1, LOCK_2;
        omp_init_lock(&LOCK_1);
        omp_init_lock(&LOCK_2);
#pragma omp parallel for num_threads(thread_count)
        for (int __thread__ = 0; __thread__ < thread_count; __thread__++) {
            // *********************************************************
            // int chebyshev_matrix_set = 0;
            double **chebyshev_matrix = (double **)malloc(sizeof(double *) * n);
            for (int j = 0; j < n; j++) {
                chebyshev_matrix[j] = (double *)malloc(sizeof(double) * n);
            };
            combination *com = (combination *)malloc(sizeof(combination));
            com->values = (int *)malloc(sizeof(int) * m);
            com->cost = 0;
            for (int i = 0; i < each_thread_works; i++) {
                // lock1
                omp_set_lock(&LOCK_1);
                com = next_combination(com);  // CRITICAL SECTION
                omp_unset_lock(&LOCK_1);
                if (com == NULL) {
                    printf("thread %d finished, breaking...\n", __thread__);
                    break;
                }
                int *values = com->values;
                // struct timeval start, end;
                // gettimeofday(&start, NULL);
                calcAllChebyshevDistanceAndStoreInArray(
                    chebyshev_matrix,
                    values);  // cost about 1 ms
                // gettimeofday(&end, NULL);
                // printf("calcAllChebyshevDistanceAndStoreInArray() time: %ld
                // ms\n",
                //        (end.tv_sec - start.tv_sec) * 1000 +
                //            (end.tv_usec - start.tv_usec) / 1000);
                double res = add_all_entries_of_matrix(chebyshev_matrix);
                // double res = 0;
                com->cost = res;
                // store the combination in object array
                // object had been fully allocated in the beginning.
                // lock2
                omp_set_lock(&LOCK_2);
                store_in_object(com);  // CRITICAL SECTION
                omp_unset_lock(&LOCK_2);
                if (res_index % 1000 == 0) {
                    printf("combination %d finished, i = %d, thread = %d \n\n",
                           res_index, i, __thread__);
                }
            }
            if (!com == NULL) {
                free(com->values);
                free(com);
            }
            for (int j = 0; j < n; j++) {
                free(chebyshev_matrix[j]);
            }
            free(chebyshev_matrix);

            // *********************************************************
        }

        // sort the object array by cost
        sort_object_array_by_cost(1);

        // end timer
        gettimeofday(&end, NULL);
        printf("time cost: %ld ms \n",
               (end.tv_sec - start.tv_sec) * 1000 +
                   (end.tv_usec - start.tv_usec) / 1000);
        dmp_object_array_to_file();
        // time cost: 35566 ms :-)
        // TODO HERE: NOT FINISHED
    } else {
        struct timeval start, end;
        gettimeofday(&start, NULL);
        n = 4;
        m = 2;
        init_comb_and_tmp_and_values();
        combination *com = (combination *)malloc(sizeof(combination));
        com->values = (int *)malloc(sizeof(int) * m);
        com->cost = 0;
        for (int i = 0; i < 100; i++) {
            com = next_combination(com);
        }
        com = next_combination(com);
        if (com == NULL) {
            printf("com == NULL\n");
        } else {
            for (int j = 0; j < m; j++) {
                printf("%d ", com->values[j]);
            }
            printf("\n");
        }
        free(com->values);
        free(com);

        gettimeofday(&end, NULL);
        printf("time cost: %ld ms \n",
               (end.tv_sec - start.tv_sec) * 1000 +
                   (end.tv_usec - start.tv_usec) / 1000);  // 291 ms
    }
    return 0;
}

// 这样频繁地使用信号量可能还是有点不太好. 可不可以继续分散?
// 还能继续怎么优化呢? 我觉得需要去除在 next_combination() 调用的时候的🔒,
// 改变获取下一个组合的方式. 改变为一开始就把所有的组合都算出来,
// 然后再一个一个地取出来. 这样就不需要在 next_combination() 中使用信号量了.
// 而且不同的线程需要的组合的范围也不一样.

// 甚至把 object 也拆解了, 最后合并不就行了!
// 这样的话, 根本不需要使用信号量了!
// 详见 try8 文件夹.
