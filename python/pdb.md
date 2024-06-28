# python pdb

## operation
+ `l` (list): 显示当前代码段。
+ `n` (next): 执行下一行代码。
+ `s` (step): 进入函数内部。
+ `c` (continue): 继续执行直到下一个断点或程序结束。
+ `q` (quit): 退出调试器。
+ `p` (print): 打印变量的值，例如 p a。
+ `h` (help): 显示帮助信息。
+ `w` (where): 显示当前的调用堆栈。
+ `b` (break): 设置断点，例如 b 10 在第 10 行设置断点。



## usage
+ `pdb.set_trace()`
+ `python -m pdb debug_example.py` 异常时自动进入断点