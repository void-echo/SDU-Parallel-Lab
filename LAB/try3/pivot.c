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
// #include <omp.h>

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

static int thread_count = 12;
static double *points;
static int n, dim, nums_p, p_dot_id;
// n : number of points,
// dim : dimension of points,
// nums_p : number of pivots,
// p_dot_id : pivot dot id

static double *euclidean_distance;
static double *object;

// return the original Euclidean coordinate of the point
static inline double get_point_coordinate_of_id_and_dimension(int id,
                                                              int dimension) {
    return points[id * dim + dimension];
}
static void showHowManyMbOneArrayNeed(int n, char *type);
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
#pragma omp parallel for num_threads(thread_count)
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            euclidean_distance[i * n + j] = get_distance(i, j);
        }
        // printf("calcEuclideanDistanceAndStoreInArray: %d\n", i);
    }
}

static inline long long combination(int n, int k) {
    long long result = 1;
    for (int i = 1; i <= k; i++) {
        result *= (n - k + i);
        result /= i;
    }
    return result;
}

// uses global variable: n, nums_p
// out should already be allocated
static void calcAndStoreCombination(int **out) {
    int *combination = (int *)malloc(sizeof(int) * nums_p);
    for (int i = 0; i < nums_p; i++) {
        combination[i] = i;
    }
    int *temp = (int *)malloc(sizeof(int) * nums_p);
    for (int i = 0; i < nums_p; i++) {
        temp[i] = i;
    }
    int count = 0;
    while (1) {
        int i = nums_p - 1;
        while (i >= 0 && combination[i] == n + 1 - nums_p + i) {
            i--;
        }
        if (i < 0) {
            printf("Warning: No more combinations!\n");
            break;
        }
        combination[i]++;
        for (int j = i + 1; j < nums_p; j++) {
            combination[j] = combination[j - 1] + 1;
        }
        for (int i = 0; i < nums_p; i++) {
            temp[i] = combination[i];
        }
        for (int i = 0; i < nums_p; i++) {
            out[count][i] = temp[i];
        }
        temp = (int *)malloc(sizeof(int) * nums_p);
        count++;
    }
    free(combination);
    free(temp);
}

static inline double calcOneChebyshevDistance(
    int dot_id1, int dot_id2, int *one_pivot_combination_container) {
    // one_pivot_combination_container is a container to store the pivot
    // combination. each element in the container is a pivot id.
    double max = 0;
    for (int i = 0; i < nums_p; i++) {
        int pivot = one_pivot_combination_container[i];
        double diff = fabs(euclidean_distance[dot_id1 * n + pivot] -
                           euclidean_distance[dot_id2 * n + pivot]);
        if (diff > max) {
            max = diff;
        }
    }
    return max;
}

static void printEuclideanDistance() {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            // printf("%d ", euclidean_distance[i * n + j]);
            // print in scientific notation
            printf("%e ", euclidean_distance[i * n + j]);
        }
        printf("\n");
    }
}

static void showHowManyMbOneArrayNeed(int n, char *type) {
    // when print size number, use red color
    if (type == "int") {
        printf("\033[31m");
        printf("size of int: %d\n", sizeof(int));
        printf("\033[0m");
        printf("size of int array of length %d: %d\n", n, sizeof(int) * n);
        printf("size of int array of length %d in MB: %f\n", n,
               (double)sizeof(int) * n / 1024 / 1024);
    } else if (type == "double") {
        printf("\033[31m");
        printf("size of double: %d\n", sizeof(double));
        printf("\033[0m");
        printf("size of double array of length %d: %d\n", n,
               sizeof(double) * n);
        printf("size of double array of length %d in MB: %f\n", n,
               (double)sizeof(double) * n / 1024 / 1024);
    } else if (type == "int*") {
        printf("\033[31m");
        printf("size of int*: %d\n", sizeof(int *));
        printf("\033[0m");
        printf("size of int* array of length %d: %d\n", n, sizeof(int *) * n);
        printf("size of int* array of length %d in MB: %f\n", n,
               (double)sizeof(int *) * n / 1024 / 1024);
    } else if (type == "double*") {
        printf("\033[31m");
        printf("size of double*: %d\n", sizeof(double *));
        printf("\033[0m");
        printf("size of double* array of length %d: %d\n", n,
               sizeof(double *) * n);
        printf("size of double* array of length %d in MB: %f\n", n,
               (double)sizeof(double *) * n / 1024 / 1024);
    } else if (type == "int**") {
        printf("\033[31m");
        printf("size of int**: %d\n", sizeof(int **));
        printf("\033[0m");
        printf("size of int** array of length %d: %d\n", n, sizeof(int **) * n);
        printf("size of int** array of length %d in MB: %f\n", n,
               (double)sizeof(int **) * n / 1024 / 1024);
    }
}

int main(int argc, char *argv[]) {
    int DEBUG = 1;
    if (!DEBUG) {
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
        gettimeofday(&start, NULL);
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
        printf("dim = %d, point number = %d, pivot numver = %d\n", dim, n,
               nums_p);

        // allocate memory for points
        points = (double *)malloc(sizeof(double) * n * dim);
        // read points
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < dim; j++) {
                fscanf(file, "%lf", &points[i * dim + j]);
            }
        }
        euclidean_distance = (double *)malloc(sizeof(double) * n * n);
        // object array to store the total chebyshev distance.
        // each element in the array is the total chebyshev distance of the
        // point. shape: n^nums_p
        object = (double *)malloc(sizeof(double) * pow(n, nums_p));

        // calculate the Euclidean distance between every two points, in the
        // original coordinate then print the result print "here"
        calcEuclideanDistanceAndStoreInArray();
        // printEuclideanDistance();
        printf("Finished\n");

        // TODO HERE: NOT FINISHED
        return 0;
    } else {
        // DEBUG
        struct timeval start, end;
        gettimeofday(&start, NULL);
        n = 500;
        nums_p = 2;
        printf("start to allocate memory for output array\n");
        int **output = (int **)malloc(sizeof(int *) * n);
        for (int i = 0; i < n; i++) {
            output[i] = (int *)malloc(sizeof(int) * nums_p);
        }
        printf("end to allocate memory for output array\n");
        calcAndStoreCombination(output);

        gettimeofday(&end, NULL);
        printf("time cost: %ld ms \n",
               (end.tv_sec - start.tv_sec) * 1000 +
                   (end.tv_usec - start.tv_usec) / 1000);
        return 0;
    }
}
