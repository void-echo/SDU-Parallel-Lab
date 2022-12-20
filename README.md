Idea can be found in our [Notion notes](https://www.notion.so/void-echo/Parallel-Algorithm-LAB-9cbe47f61d9846cdb06b62b23aae0865)


⚠ The repo's documentation & notion notes is not complete and not entirely consistent with our latest idea. If you want to see the actual ideas, See `try14` and `try16` folders. Both of them have state-of-the-art performance.

The `try15-big-change-using-avx2` version is written by AVX2 instructions. Results are correct, with a fairly slow speed.

If you have any questions, please feel free to raise an issue or send an email.

⚠ For the interest of academic integrity, please do not copy the code of this repo directly.

Hope I can help you. code and have fun!

## 代码说明

本实验最终代码包含一个文件：pivot.c 

程序中使用了OpenMP进行并行化，运行命令的主机应该支持OpenMP。

gcc 版本大于等于 8.1 的时候工作，代码正常编译运行。对于更低版本的 gcc 或者 Intel OneAPI，并未做过相应的测试。



## 编译 & 运行

代码在 `源代码` 目录下。为了方便老师进行测试，我们写了 `Makefile`和 `test.sh`脚本。要想进行编译，只需要 `make`一下即可。通过运行 `.\pivot`，就能在默认参数（线程数量：6，小数据集）下运行程序。

如果要测试其他线程数、数据集，只需要在  `.\pivot` 之后加上参数。格式是 `-t <thread_number> -f <file_name>`。两个参数的顺序是自由的，也都是可选的。缺失的参数将被赋予默认值。

程序在运行之后会把结果写入 `object.txt`当中。经过反复验证，不论是大小数据集，我们的输出结果和参考文件完全一致。写入的模式是覆盖式的，所以不必先清空文件内容再测试。

如果要进行测试，可以运行 `test.sh`脚本。它的内容如下所示。它会测试不同线程、不同数据集下的程序耗时并且输出，单位为毫秒。测试也有两个模式：大型测试和小型测试，默认是小型测试。如果想要进行完整（最高 64 核，并且大数据集也在内）的测试，只需要修改第9，10行的内容即可。

```bash
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
```

最后，如果由于平台或其他原因发生了编译错误，可以在 `prepared_bin` 文件夹里面找到我们预先编译好的二进制文件。一般情况下不需要这个文件，它只是用来防止意外情况。



我们的代码在一次编译之后，多次运行速度有所波动。如果条件允许，请老师多次测试取性能最好值。



## 之前的性能测试

我们依托依托山东大学高性能计算平台进行过测试，其配置信息如下：

- 操作系统：CentOS Linux release 7.8.2003 (Core)
- CPU：Intel (R) Xeon (R) Gold 6248 CPU @ 2.50GHz
- 内存：4GB

准确性能以实验室测试平台为准。该结果仅供参考。

#### 1.2.1 测试数据“uniformvector-2dim-5h.txt”

| **线程数量** | **执行时间 (ms)** | **加速比** |
| ------------ | ----------------- | ---------- |
| 1            | 28790             | 1          |
| 2            | 14552             | 1.98       |
| 4            | 7643              | 3.77       |
| 8            | 3897              | 7.39       |
| 12           | 2694              | 10.68      |

<img src="https://cdn.nlark.com/yuque/0/2022/png/34593176/1670058488655-b3596d5e-352f-4d85-8594-05a19bee284b.png#averageHue=%23fdfdfd&clientId=u269e801e-ea98-4&crop=0&crop=0&crop=1&crop=1&from=drop&height=356&id=u06d85a03&margin=%5Bobject%20Object%5D&name=1%281%29.png&originHeight=847&originWidth=852&originalType=binary&ratio=1&rotation=0&showTitle=false&size=23328&status=done&style=none&taskId=u5739fc5e-82be-40a8-99a5-4b97f01e2ab&title=&width=358" alt="1(1).png" style="zoom: 33%;" /><img src="https://cdn.nlark.com/yuque/0/2022/png/34593176/1670058488709-3a9bbe34-57e3-434d-a05d-a91c59dd622c.png#averageHue=%23fdfdfd&clientId=u269e801e-ea98-4&crop=0&crop=0&crop=1&crop=1&from=drop&height=351&id=uc657a609&margin=%5Bobject%20Object%5D&name=2%281%29.png&originHeight=825&originWidth=815&originalType=binary&ratio=1&rotation=0&showTitle=false&size=20341&status=done&style=none&taskId=u6cb5c2fa-923a-468c-9598-548363cc40a&title=&width=347" alt="2(1).png" style="zoom:33%;" />

#### 1.2.2  测试数据“uniformvector-4dim-1h.txt”

| **线程数量** | **执行时间 (ms)** | **加速比** |
| ------------ | ----------------- | ---------- |
| 1            | 1416201           | 1          |
| 2            | 685185            | 2.06       |
| 4            | 371142            | 3.82       |
| 8            | 245492            | 5.77       |
| 12           | 191242            | 7.40       |

<img src="https://cdn.nlark.com/yuque/0/2022/png/34593176/1670071841586-ab7ee5a1-cd51-423e-8e77-b4ee607a00c5.png#averageHue=%23fdfdfd&clientId=ud51690d5-9395-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=363&id=u55702652&margin=%5Bobject%20Object%5D&name=%7B06BCF299-BFCD-77FD-2FCE-B40FAE87BB7C%7D.png&originHeight=856&originWidth=851&originalType=binary&ratio=1&rotation=0&showTitle=false&size=35555&status=done&style=none&taskId=uc832d673-76a8-4adc-973c-b57509445a9&title=&width=360.7875061035156" alt="{06BCF299-BFCD-77FD-2FCE-B40FAE87BB7C}.png" style="zoom:33%;" /><img src="https://cdn.nlark.com/yuque/0/2022/png/34593176/1670071845141-d612e1fb-df09-4de0-8042-33ff5f3696b1.png#averageHue=%23fdfdfd&clientId=ud51690d5-9395-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=349&id=u1272354f&margin=%5Bobject%20Object%5D&name=%7B2424CE7E-65C7-4987-19CF-01E183C89EE3%7D.png&originHeight=835&originWidth=820&originalType=binary&ratio=1&rotation=0&showTitle=false&size=33927&status=done&style=none&taskId=u7d3f44d4-392d-4943-aed6-49db81f90ae&title=&width=343" alt="{2424CE7E-65C7-4987-19CF-01E183C89EE3}.png" style="zoom:33%;" />

总体来看，我们的性能还算不错，但是也不算很快。不过，我们在小数据集上取得了几乎线性的加速比增长（至少在核数不太大的时候）。
