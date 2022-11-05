#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<time.h>
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

static int nums_p = 2, n = 6;

static void calcAndStoreCombination(int** out) {
    int* combination = (int*)malloc(sizeof(int) * nums_p);
    int* temp = (int*)malloc(sizeof(int) * nums_p);
    for (int i = 0; i < nums_p; i++) {
        combination[i] = i;
        temp[i] = i;
    }   // make combination = [0, 1, 2, 3, 4, 5 ...], temp = [0, 1, 2, 3, 4, 5 ...]
    int count = 0;
    while (1) {
        int i = nums_p - 1;
        // i is the index of the last element in combination
        while (i >= 0 && combination[i] == n - nums_p + i) {
            // if the last element in combination is n - nums_p + i, then the combination is the last one.
            i--;
        }
        if (i < 0) {
            break;
        }
        combination[i]++;
        for (int j = i + 1; j < nums_p; j++) {
            combination[j] = combination[j - 1] + 1;
        }
        for (int i = 0; i < nums_p; i++) {
            temp[i] = combination[i];
        }
        out[count] = temp;
        temp = (int*)malloc(sizeof(int) * nums_p);
        count++;
        // printf("count: %d\n", count);
    }
    free(combination);
    free(temp);
}

int main() {
    // out is a matrix of shape (C_n^nums_p, nums_p)
    // start time recording
    struct timeval start, end;
    gettimeofday(&start, NULL);
    // out is a matrix of shape (C_n^nums_p, nums_p)
    int** out = (int**)malloc(sizeof(int*) * n);
    for (int i = 0; i < 1; i++) {
        out[i] = (int*)malloc(sizeof(int) * nums_p);
    }
    calcAndStoreCombination(out);
    // print each row of out in a beautiful way
    for (int i = 0; i < 20; i++) {
        for (int j = 0; j < nums_p; j++) {
            printf("%d ", out[i][j]);
        }
        printf("\n");
    }
    free(out);
    // end time recording
    gettimeofday(&end, NULL);
    // print in ms
    printf("time cost: %ld ms\n", (end.tv_sec - start.tv_sec) * 1000 + (end.tv_usec - start.tv_usec) / 1000);
    return 0;
}