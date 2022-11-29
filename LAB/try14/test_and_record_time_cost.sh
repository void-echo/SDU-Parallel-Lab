#!/bin/bash

# This script is used to test the time cost of the program `pivot.c`.

# first make clean and make the program
make clean
make

# then run the program and record the time cost

# run ./out and record the time cost.
# time cost line is the 5th line of the output.
declare -a thread_nums=("1" "2" "4" "8" "12" "16");
# declare -a file_names=("./uniformvector-2dim-5h.txt" "./uniformvector-4dim-1h.txt");
declare -a file_names=("./uniformvector-2dim-5h.txt");

for i in "${file_names[@]}"
do
    for j in "${thread_nums[@]}"
    do
        echo "file name: $i, thread num: $j"
        ./out -f $i -t $j | sed -n '5p'
    done
done