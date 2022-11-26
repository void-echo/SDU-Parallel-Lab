#include <immintrin.h>
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


static const int thread_count = 2;
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
    double cost;
    int *values;
} combination;

static combination *object;
static double *cache_eu_dist;  // cache for euclidean distance.
                               // shape: (thread_count, nums_p, n/4)
static double *small_cache;    // shape: (thread_count, nums_p)
static __m256d *block_cache;   // shape: (thread_count, nums_p)

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

inline
double hsum_double_avx(__m256d v) {
    __m128d vlow  = _mm256_castpd256_pd128(v);
    __m128d vhigh = _mm256_extractf128_pd(v, 1); // high 128
            vlow  = _mm_add_pd(vlow, vhigh);     // reduce down to 128

    __m128d high64 = _mm_unpackhi_pd(vlow, vlow);
    return  _mm_cvtsd_f64(_mm_add_sd(vlow, high64));  // reduce to scalar
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
        int block_num = n / 4;  // each __m256d can hold 4 double
        cache_eu_dist = (double *)malloc(sizeof(double) * thread_count * m * n);
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
        block_cache = (__m256d *)malloc(sizeof(__m256d) * thread_count * m);
        
        object = (combination *)malloc(sizeof(combination) * c_n_m(n, m));
        for (int i = 0; i < c_n_m(n, m); i++) {
            object[i].values = (int *)malloc(sizeof(int) * m);
            object[i].cost = 0;
        }
        // calculate the Euclidean distance between every two points, in the
        // original coordinate.
        calcEuclideanDistanceAndStoreInArray();
        // printf("Euclidean distance calculated.\n");
        calc_all_combinations_and_store_in_object();
        small_cache = (double *)malloc(sizeof(double) * thread_count * m);

        // *********************************************************
        int len = c_n_m(n, m);
        // set omp thread number
#pragma omp parallel for 
        for (int i = 0; i < len; i++) {
            // printf("HERE\n");
            int tid = omp_get_thread_num();
            int d1 = tid * m * n;
            int *values = object[i].values;
            for (int __m__ = 0; __m__ < m; __m__++) {
                int d2 = d1 + __m__ * n;
                int pivot_id = values[__m__];
                int _d2 = pivot_id * n;
                for (int __n__ = 0; __n__ < n; __n__++) {
                    cache_eu_dist[d2 + __n__] = euclidean_distance[_d2 + __n__];
                }
            }

            // init the small cache
            int d2 = tid * m;
            for (int __n__ = 0; __n__ < n; __n__++) {
                for (int col = 0; col < block_num; col++) {
                    __m256d _max = _mm256_set1_pd(0.0);
                    for (int __m__ = 0; __m__ < m; __m__++) {
                        int d3 = d1 + __m__ * n;
                        small_cache[d2 + __m__] = cache_eu_dist[d3 + __n__];

                        // construct __m256d every 4 elements of cache_eu_dist
                        // __m256d _cache_eu_dist =
                        //     _mm256_loadu_pd(&cache_eu_dist[d3 + col * 4]);
                        block_cache[d2 + __m__] = _mm256_andnot_pd(
                            _mm256_set1_pd(-0.0),
                            _mm256_sub_pd(_mm256_loadu_pd(&cache_eu_dist[d3 + col * 4]), 
                            _mm256_set1_pd(small_cache[d2 + __m__])));
                        // for each index from 0 to 3, find the max value of
                        // each column
                        if (__m__ == 0) {
                            _max = block_cache[d2 + __m__];
                        } else {
                            _max = _mm256_max_pd(_max, block_cache[d2 + __m__]);
                        }
                    }
                    object[i].cost += hsum_double_avx(_max);
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
        free(points);
        free(euclidean_distance);
        for (int i = 0; i < c_n_m(n, m); i++) {
            free(object[i].values);
        }
        free(object);
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
