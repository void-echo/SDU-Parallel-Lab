#include <immintrin.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#ifdef _WIN32
#include <windows.h>
#else
#include <getopt.h>
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
int opterr = 1, /* if error message should be printed */
    optind = 1, /* index into parent argv vector */
    optopt,     /* character checked for validity */
    optreset;   /* reset getopt */
char *optarg;   /* argument associated with option */

#define BADCH (int)'?'
#define BADARG (int)':'
#define EMSG ""

/*
 * getopt --
 *      Parse argc/argv argument vector.
 * I wrote this code for use of `getopt` on Windows platform.
 * If it is on Linux, `getopt` is already defined.
 */
int getopt(int nargc, char *const nargv[], const char *ostr) {
    static char *place = EMSG; /* option letter processing */
    const char *oli;           /* option letter list index */

    if (optreset || !*place) { /* update scanning pointer */
        optreset = 0;
        if (optind >= nargc || *(place = nargv[optind]) != '-') {
            place = EMSG;
            return (-1);
        }
        if (place[1] && *++place == '-') { /* found "--" */
            ++optind;
            place = EMSG;
            return (-1);
        }
    } /* option letter okay? */
    if ((optopt = (int)*place++) == (int)':' || !(oli = strchr(ostr, optopt))) {
        /*
         * if the user didn't specify '-' as an option,
         * assume it means -1.
         */
        if (optopt == (int)'-') return (-1);
        if (!*place) ++optind;
        if (opterr && *ostr != ':')
            (void)printf("illegal option -- %c\n", optopt);
        return (BADCH);
    }
    if (*++oli != ':') { /* don't need argument */
        optarg = NULL;
        if (!*place) ++optind;
    } else {        /* need an argument */
        if (*place) /* no white space */
            optarg = place;
        else if (nargc <= ++optind) { /* no arg */
            place = EMSG;
            if (*ostr == ':') return (BADARG);
            if (opterr)
                (void)printf("option requires an argument -- %c\n", optopt);
            return (BADCH);
        } else /* white space */
            optarg = nargv[optind];
        place = EMSG;
        ++optind;
    }
    return (optopt); /* dump back option letter */
}
#endif
#include <omp.h>

static int thread_count = 6;
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
static double **cache_eu_dist;  // size: thread_count * m * n

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
#pragma omp parallel for num_threads(thread_count)
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
// static INLINE double calcOneChebyshevDistance(int dot_id1, int dot_id2,
//                                               int tid) {
//     double max = 0;
//     int d1 = tid * m * n;
//     for (int i = 0; i < m; i++) {
//         int d_1 = d1 + i * n + dot_id1;
//         int d_2 = d1 + i * n + dot_id2;
//         double diff = fabs(cache_eu_dist[d_1] - cache_eu_dist[d_2]);
//         // double diff = 0;
//         if (diff > max) {
//             max = diff;
//         }
//     }
//     return max;
// }

static INLINE double calcOneChebyshevDistance(int dot_id1, int dot_id2,
                                              int tid) {
    double max = 0;
    int __num1 = dot_id1, __num2 = dot_id2;
    for (int i = 0; i < m; i++) {
        int base = n * i;
        __num1 += base;
        __num2 += base;
        double diff =
            fabs(cache_eu_dist[tid][__num1] - cache_eu_dist[tid][__num2]);
        // double diff = 0;
        if (diff > max) {
            max = diff;
        }
        __num1 = dot_id1;
        __num2 = dot_id2;
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
    int DEBUG = 0;  // 0: run the program normally, 1: run some unit tests
    if (!DEBUG) {
        char *filename = (char *)"uniformvector-2dim-5h.txt";
        // usage: ./pivot -f <filename> -t <thread_count>
        // parse command line arguments
        int opt;
        while ((opt = getopt(argc, argv, "f:t:")) != -1) {
            switch (opt) {
                case 'f':
                    filename = optarg;
                    break;
                case 't':
                    thread_count = atoi(optarg);
                    omp_set_num_threads(thread_count);
                    break;
                default:
                    printf("Usage: ./pivot -f <filename> -t <thread_count>");
                    return -1;
            }
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
        printf(
            "dim = %d, point number = %d, pivot numver = %d, thread number = "
            "%d, using file %s\n",
            dim, n, nums_p, thread_count, filename);

        // allocate memory for points
        points = (double *)malloc(sizeof(double) * n * dim);
        // cache_eu_dist is double**
        cache_eu_dist = (double **)malloc(sizeof(double *) * thread_count);
        for (int i = 0; i < thread_count; i++) {
            cache_eu_dist[i] = (double *)malloc(sizeof(double) * m * n);
        }
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
        printf("all combinations calculated.\n");

        // *********************************************************
        int len = c_n_m(n, m);
// set omp thread number
#pragma omp parallel for schedule(static, 200) num_threads(thread_count)
        for (int i = 0; i < len; i++) {
            int tid = omp_get_thread_num();
            int *values = object[i].values;
            for (int __m__ = 0; __m__ < m; __m__++) {
                int pivot_id = values[__m__];
                int _d2 = pivot_id * n;
                for (int __n__ = 0; __n__ < n; __n__++) {
                    cache_eu_dist[tid][__m__ * n + __n__] =
                        euclidean_distance[_d2 + __n__];
                }
            }
            for (int __i__ = 0; __i__ < n; __i__++) {
                int bound = __i__ + 1;
                for (int __j__ = bound; __j__ < n; __j__++) {
                    object[i].cost +=
                        calcOneChebyshevDistance(__i__, __j__, tid);
                }
            }
        }

        // sort the object array by cost
        sort_object_array_by_cost(0);  // 1: show debug message, 0: not

        // end timer
        gettimeofday(&end, NULL);
        printf("time cost: %ld ms \n",
               (end.tv_sec - start.tv_sec) * 1000 +
                   (end.tv_usec - start.tv_usec) / 1000);
        // sniff_object_array();  // result seems to be correct :-)
        dmp_object_array_to_file();
        free(points);
        free(euclidean_distance);
        for (int i = 0; i < c_n_m(n, m); i++) {
            free(object[i].values);
        }
        free(object);
        
        for (int i = 0; i < thread_count; i++) {
            free(cache_eu_dist[i]);
        }
        free(cache_eu_dist);
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
