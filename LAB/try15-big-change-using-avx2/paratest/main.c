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
#include <immintrin.h>
// #include <zmmintrin.h>   // not usable on my AMD machine.
// I have this header in C:\Program Files (x86)\Microsoft Visual
// Studio\...\include\zmmintrin.h but VScode cannot find it. anyway, we are not
// going to use AVX512. AVX2 is enough. so <zmmintrin.h>  is not needed in fact.
// 😊 Void Echo, 2022-11-04
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

#define d4 __m256d
#define d2 __m128d

static inline double hsum_4_doubles_avx(__m256d v) {
    __m128d vlow = _mm256_castpd256_pd128(v);
    __m128d vhigh = _mm256_extractf128_pd(v, 1);  // high 128
    vlow = _mm_add_pd(vlow, vhigh);               // reduce down to 128

    __m128d high64 = _mm_unpackhi_pd(vlow, vlow);
    return _mm_cvtsd_f64(_mm_add_sd(vlow, high64));  // reduce to scalar
}

static inline double horizontal_add(__m256d a) {
    __m256d t1 = _mm256_hadd_pd(a, a);
    __m128d t2 = _mm256_extractf128_pd(t1, 1);
    __m128d t3 = _mm_add_sd(_mm256_castpd256_pd128(t1), t2);
    return _mm_cvtsd_f64(t3);
}

static double inline get_el_from_d4(__m256d d4, int index) {
    double *p = (double *)&d4;
    return p[index];
}

int main() {
    int MODE = 1;
    if (MODE == 0) {
        printf("Hello World!\n");
        d4 a = _mm256_set_pd(1.0, 2.0, -3.0, 4.0);
        // print each element of a
        double *p = (double *)&a;
        printf("a = %lf %lf %lf %lf\n", p[0], p[1], p[2], p[3]);
        // all elements of a subtracted by 1.0
        d4 b = _mm256_sub_pd(a, _mm256_set1_pd(1.0));
        p = (double *)&b;
        printf("b = %lf %lf %lf %lf\n\n\n", p[0], p[1], p[2], p[3]);

        // get absolute value of each element of a
        d4 c = _mm256_andnot_pd(_mm256_set1_pd(-0.0), a);
        p = (double *)&c;
        printf("c = %lf %lf %lf %lf\n\n\n", p[0], p[1], p[2], p[3]);
        double result = hsum_4_doubles_avx(c);
        printf("result = %lf\n", result);

        d4 d = _mm256_set_pd(-3, 5, 1, 2);
        // get max value of each element of a and d
        d4 e = _mm256_max_pd(a, d);
        p = (double *)&e;
        printf("e = %lf %lf %lf %lf\n\n\n", p[0], p[1], p[2], p[3]);
    } else if (MODE == 1) {
        __m256d* arr = (__m256d*)malloc(2 * sizeof(__m256d));
        arr[0] = _mm256_set_pd(1.0, 2.0, -3.0, 4.0);
        arr[1] = _mm256_set_pd(1.0, -3.0, 2.0, 4.0);
        __m256d max_ = _mm256_max_pd(arr[0], arr[1]);
        double *p = (double *)&max_;
        printf("max_ = %lf %lf %lf %lf\n", p[0], p[1], p[2], p[3]);
    }
}