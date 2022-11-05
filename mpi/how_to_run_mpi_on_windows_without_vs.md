编译、链接 C 文件


gcc <filename>  -l msmpi -L "C:\Program Files (x86)\Microsoft SDKs\MPI\Lib\x64" -I "C:\Program Files (x86)\Microsoft SDKs\MPI\Include"



编译、链接 C++ 文件


g++ <filename>  -l msmpi -L "C:\Program Files (x86)\Microsoft SDKs\MPI\Lib\x64" -I "C:\Program Files (x86)\Microsoft SDKs\MPI\Include"



运行 MPI 程序


mpiexec  -args <filename.exe>

