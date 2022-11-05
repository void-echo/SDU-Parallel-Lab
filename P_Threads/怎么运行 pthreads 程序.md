编译该程序的方法与编译普通的C程序是一样的。区别在于，需要链接Pthreads线程库

$ gcc -g -Wall -o <可执行文件名字> <源文件.c> -lpthread
