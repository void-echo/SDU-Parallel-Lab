#include <stdio.h>
#include <stdlib.h>
#include <math.h>
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

#ifdef WIN32
    // get logical cpu num and store in cpu_num
    int get_cpu_num()
    {
        SYSTEM_INFO sysinfo;
        GetSystemInfo(&sysinfo);
        return sysinfo.dwNumberOfProcessors;
    }
#else
    cpu_num = sysconf(_SC_NPROCESSORS_ONLN);
#endif


static inline long long combination(int n, int k) {
    long long result = 1;
    for (int i = 1; i <= k; i++) {
        result *= (n - k + i);
        result /= i;
    }
    return result;
}

static void showHowManyMbOneArrayNeed(int n, char* type) {
    // when print size number, use red color
    if (type == "int") {
        printf("\033[31m");
        printf("size of int: %d\n", sizeof(int));
        printf("\033[0m");
        printf("size of int array of length %d: %d\n", n, sizeof(int) * n);
        printf("size of int array of length %d in MB: %f\n", n, (double)sizeof(int) * n / 1024 / 1024);
    } else if (type == "double") {
        printf("\033[31m");
        printf("size of double: %d\n", sizeof(double));
        printf("\033[0m");
        printf("size of double array of length %d: %d\n", n, sizeof(double) * n);
        printf("size of double array of length %d in MB: %f\n", n, (double)sizeof(double) * n / 1024 / 1024);
    } else if (type == "int*") {
        printf("\033[31m");
        printf("size of int*: %d\n", sizeof(int*));
        printf("\033[0m");
        printf("size of int* array of length %d: %d\n", n, sizeof(int*) * n);
        printf("size of int* array of length %d in MB: %f\n", n, (double)sizeof(int*) * n / 1024 / 1024);
    } else if (type == "double*") {
        printf("\033[31m");
        printf("size of double*: %d\n", sizeof(double*));
        printf("\033[0m");
        printf("size of double* array of length %d: %d\n", n, sizeof(double*) * n);
        printf("size of double* array of length %d in MB: %f\n", n, (double)sizeof(double*) * n / 1024 / 1024);
    } else if (type == "int**") {
        printf("\033[31m");
        printf("size of int**: %d\n", sizeof(int**));
        printf("\033[0m");
        printf("size of int** array of length %d: %d\n", n, sizeof(int**) * n);
        printf("size of int** array of length %d in MB: %f\n", n, (double)sizeof(int**) * n / 1024 / 1024);
    }
}

static inline long long matrix_sum(int n, int** matrix) {
    long long sum = 0;
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            sum += matrix[i][j];
        }
    }
    return sum;
}

int main() {
    int n = 1000;
    // n x n matrix
    // start to count time
    struct timeval start, end;
    gettimeofday(&start, NULL);
    int** matrix = malloc(sizeof(int*) * n);
    for (int i = 0; i < n; i++) {
        matrix[i] = malloc(sizeof(int) * n);
    }
    // init matrix
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            matrix[i][j] = i * n + j;
        }
    } 


    // sum of matrix
    long long sum = matrix_sum(n, matrix);
    printf("\nsum of matrix: %lld\n", sum);
    gettimeofday(&end, NULL);
    // print time in ms
    printf("time: %ld ms\n", (end.tv_sec - start.tv_sec) * 1000 + (end.tv_usec - start.tv_usec) / 1000);
    return 0;
}