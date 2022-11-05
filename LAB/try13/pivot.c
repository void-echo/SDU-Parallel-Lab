#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#ifdef _WIN32
#include <windows.h>
#else
#include <sys/time.h>
#endif
#ifdef _WIN32
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

#ifdef _WIN32
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
#define INLINE inline

// #define INLINE inline __attribute__((always_inline))
// for gcc, this is right, but VSCode cannot recognize it, and mark it as
// error! 😰

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
static int* cache_pivots;       // size: thread_count * m
static double* cache_eu_dist;      // size: thread_count * m * n

// return the original Euclidean coordinate of the point
static INLINE double get_point_coordinate_of_id_and_dimension(int id,
                                                              int dimension) {
    return points[id * dim + dimension];
}
// calculate the Euclidean distance between two points, in the original
// coordinate
static INLINE double calc_distance(int id1, int id2) {
    double sum = 0;
    for (int i = 0; i < dim; i++) {
        double diff = get_point_coordinate_of_id_and_dimension(id1, i) -
                      get_point_coordinate_of_id_and_dimension(id2, i);
        sum += diff * diff;
    }
    return sqrt(sum);
}

static INLINE double get_euclidean_distance(int id1, int id2) {
    return euclidean_distance[id1 * n + id2];
}

static INLINE void calcEuclideanDistanceAndStoreInArray() {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            if (i == j) {
                euclidean_distance[i * n + j] = 0;
            } else {
                euclidean_distance[i * n + j] = calc_distance(i, j);
            }
        }
        // printf("calcEuclideanDistanceAndStoreInArray: %d\n", i);
    }
}
static long long int run_times = 0;
static INLINE double calcOneChebyshevDistance(int dot_id1, int dot_id2,
                                              int *pivots) {
    double max = 0;
    for (int i = 0; i < m; i++) {
        int pivot_id = pivots[i];
        // THIS COST MOST TIME!!!
        double diff = fabs(get_euclidean_distance(dot_id1, pivot_id) -
                           get_euclidean_distance(dot_id2, pivot_id));
        // double diff = 0;
        if (diff > max) {
            max = diff;
        }
    }
    return max;
}

static int __c_n_m = 0;
static int INLINE c_n_m(int n, int m) {
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
static void INLINE __minus1(combination *c) { c->values[m - 1]--; }

// work as static class method
static void INLINE __plus1(combination *c) { c->values[m - 1]++; }
// work as static class method
static int INLINE __last2same(combination *c) {
    return c->values[m - 1] == c->values[m - 2];
}
// work as static class method
static void INLINE __print_combination(combination *c) {
    // format: (1, 2, 3, 4, 5, 6)
    printf("(%d", c->values[0]);
    for (int i = 1; i < m; i++) {
        printf(", %d", c->values[i]);
    }
    printf(")\n");
}

static void INLINE calc_all_combinations_and_store_in_object() {
    // printf("calc_all_combinations_and_store_in_object\n");
    int *combi_ = (int *)malloc(sizeof(int) * m);
    for (int i = 0; i < m; i++) {
        combi_[i] = i;
    }
    int count_ = 0;
    while (combi_[m - 1] < n) {
        for (int __i = 0; __i < m; __i++) {
            object[count_].values[__i] = combi_[__i];
        }
        count_++;
        int t = m - 1;
        while (t != 0 && combi_[t] == n - m + t) {
            t--;
        }
        combi_[t]++;
        for (int i = t + 1; i < m; i++) {
            combi_[i] = combi_[i - 1] + 1;
        }
    }
}

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

static void INLINE sort_object_array_by_cost(int DEBUG) {
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

static INLINE void sniff_object_array() {
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

static void INLINE dmp_object_array_to_file() {
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

int main(int argc, char *argv[]) {
    omp_set_num_threads(thread_count);
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

        // allocate memory for points
        points = (double *)malloc(sizeof(double) * n * dim);
        cache_pivots = (int*) malloc(sizeof(int) * thread_count * m);
        cache_eu_dist = (double*) malloc(sizeof(double) * thread_count * m * n);
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
        object = (combination *)malloc(sizeof(combination) * c_n_m(n, m));
        for (int i = 0; i < c_n_m(n, m); i++) {
            object[i].values = (int *)malloc(sizeof(int) * m);
            object[i].cost = 0;
        }
        // calculate the Euclidean distance between every two points, in the
        // original coordinate.
        calcEuclideanDistanceAndStoreInArray();
        printf("Euclidean distance calculated.\n");
        calc_all_combinations_and_store_in_object();

        // *********************************************************
        int len = c_n_m(n, m);
// set omp thread number
#pragma omp parallel for schedule(static, 100) num_threads(thread_count)
        for (int i = 0; i < len; i++) {
            for (int __i__ = 0; __i__ < n; __i__++) {
                int bound = __i__ + 1;
                for (int __j__ = bound; __j__ < n; __j__++) {
                    object[i].cost += calcOneChebyshevDistance(
                        __i__, __j__, object[i].values);
                }
            }
        }

        // sort the object array by cost
        sort_object_array_by_cost(1);

        // end timer
        gettimeofday(&end, NULL);
        printf("time cost: %ld ms \n",
               (end.tv_sec - start.tv_sec) * 1000 +
                   (end.tv_usec - start.tv_usec) / 1000);
        sniff_object_array();  // result seems to be correct :-)
        dmp_object_array_to_file();
        // time cost: 35566 ms :-)
        // TODO HERE: NOT FINISHED
    } else {
        struct timeval start, end;
        gettimeofday(&start, NULL);
        n = 500;
        m = 2;
        object = (combination *)malloc(sizeof(combination) * c_n_m(n, m));
        for (int i = 0; i < c_n_m(n, m); i++) {
            object[i].values = (int *)malloc(sizeof(int) * m);
            object[i].cost = 0;
        }
        calc_all_combinations_and_store_in_object();
        sniff_object_array();
        gettimeofday(&end, NULL);
        printf("time cost: %ld ms \n",
               (end.tv_sec - start.tv_sec) * 1000 +
                   (end.tv_usec - start.tv_usec) / 1000);
    }
    return 0;
}
