

## ref
+ [Go中的内存逃逸分析](https://segmentfault.com/a/1190000040610063)
    + 局部变量
        + 默认会在栈上
        + 如果闭包(函数返回指针)或变量很大则被分配在堆上(逃逸)，增加GC压力

+ [3.2 切片](https://draveness.me/golang/docs/part2-foundation/ch03-datastructure/golang-array-and-slice/)