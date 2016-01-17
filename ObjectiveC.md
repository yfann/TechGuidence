
#Objective-C [#](https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html#//apple_ref/doc/uid/TP40011210-CH1-SW1) [#](https://developer.apple.com/library/ios/navigation/)

iOS支持 Swift,Objective-C, C/C++

学语言时需要关注的:
+ compile-time VS run-time
+ stack VS heap(变量的位置)
+ programmer VS compiler/runtime/framework(谁会动你的代码)

开发方式：
+ Clang/GCC(命令行)

    //命令行编译(arc自动内存管理)
	clang -fobjc-arc HelloWOrld.m -o HelloWorld
	//执行
	./HelloWorld

+ XCode

扩展名:
+ .m
+ .h

编译过程：

LLVM(Low level virtual machine) 

c/c++/OC -> GCC/LLVM-GCC/LLVM-Clang ->x86-64 Machine Code