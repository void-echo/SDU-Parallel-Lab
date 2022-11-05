#include <stdio.h>
#include <stdlib.h>

static double** matrix;

int main(int argc, char const *argv[]) { 
    int n = 5;
    matrix = (double**)malloc(n * sizeof(double*));
    for (int i = 0; i < n; i++) {
        matrix[i] = (double*)malloc(n * sizeof(double));
    }
    return 0; 
    }
