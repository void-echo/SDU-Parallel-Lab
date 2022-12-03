#!/bin/bash

# This script is used to test the time cost of the program `pivot.c`.
# first make clean and make the program
make clean
make

# `small` for small test, `big` for big test
declare isSmallTestOrBigTest="small"
# declare isSmallTestOrBigTest="big"
declare exe_name="out"

if [ "$isSmallTestOrBigTest" = "small" ]; then
    declare -a thread_nums=("1" "2" "4" "8" "12" "16")
    declare -a file_names=("./uniformvector-2dim-5h.txt")

elif [ "$isSmallTestOrBigTest" = "big" ]; then
    declare -a thread_nums=("1" "2" "4" "8" "12" "16" "32" "64")
    declare -a file_names=("./uniformvector-2dim-5h.txt" "./uniformvector-4dim-1h.txt")

fi

# run ./out and record the time cost.
# time cost line is the 5th line of the output.
for i in "${file_names[@]}"; do
    for j in "${thread_nums[@]}"; do
        echo "file name: $i, thread num: $j"
        ./$exe_name -f $i -t $j | sed -n '5p'
    done
done
