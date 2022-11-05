#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
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

static const int n = 500, m = 2;
static int count = 0;

static int inline c_n_m(int n, int m) {
    // C(n, m) = n! / (m! * (n - m)!)
    int result = 1;
    for (int i = 1; i <= m; i++) {
        result = result * (n - i + 1) / i;
    }
    return result;
}

struct combination {
    int *values;
    double cost;
};
// work as static class method
static void inline __minus1(struct combination *c) {
    c->values[m - 1]--;
}

// work as static class method
static void inline __plus1(struct combination *c) {
    c->values[m - 1]++;
}
// work as static class method
static int inline __last2same(struct combination *c) {
    return c->values[m - 1] == c->values[m - 2];
}
// work as static class method
static void inline __print_combination(struct combination *c) {
    // format: (1, 2, 3, 4, 5, 6)
    printf("(%d", c->values[0]);
    for (int i = 1; i < m; i++) {
        printf(", %d", c->values[i]);
    }
    // showing cost
    // printf(") cost: %f \n", c->cost);
    // not showing cost
    printf(")\n");
}


// return one arbitrary combination struct
// static struct combination* get_combination() {
//     struct combination* result = (struct combination*)malloc(sizeof(struct
//     combination)); result->values = (int*)malloc(sizeof(int) * m); for (int i
//     = 0; i < m; i++) {
//         result->values[i] = i;
//     }
//     result->cost = 0;
//     return result;
// }
static int *comb, *tmp;
static struct combination *next_combination() { 
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
    // start to new combination
    struct combination *com = (struct combination *)malloc(sizeof(struct combination));
    int* values = (int*)malloc(sizeof(int) * m);
    for (int i = 0; i < m; i++) {
        values[i] = tmp[i];
    }
    com->values = values;
    com->cost = 0;
    // finished newing a combination struct
    __minus1(com);
    if (__last2same(com)) {
       count--;
       return next_combination();
    }
    return com;
 }

static void inline init_comb_and_tmp() {
    // init comb and tmp
    comb = (int *)malloc(sizeof(int) * m);
    tmp = (int *)malloc(sizeof(int) * m);
    for (int i = 0; i < m; i++) {
        comb[i] = i;
        tmp[i] = i;
    }
}

int main() { 
    // start recording time
    struct timeval start, end;
    gettimeofday(&start, NULL);
    init_comb_and_tmp();
    for (int i = 0; i < c_n_m(n, m); i++) {
        struct combination *com = next_combination();
        if (com == NULL) {
            break;
        }
        // __print_combination(com);
    }
    // end recording time
    gettimeofday(&end, NULL);
    printf("time: %ld ms\n", (end.tv_sec - start.tv_sec) * 1000 + (end.tv_usec - start.tv_usec) / 1000);
    return 0;
}