
## gcc

+ LDFLAGS(指定gcc的优化参数或lib位置)
    + `LDFLAGS=-static -L /usr/lib -L /path/to/your/lib`

## issues

+ 命令前加tap,不是空格

## tips

+ `$(MAKE)` 递归使用make,可以在makefile中使用`$(MAKE)`相当于使用`make`
+ `@<cmd>` The @ symbol is commonly seen at the beginning of an action lines and means that the action line itself is not be be echoed on the screen as it is executed.
+ ` $(MAKE) -C <dir>` 执行指定目录下的makefile
+ `M=$(PWD)` 返回到当前目录继续执行当前的makefile

## ref
+ [Make 命令教程](http://www.ruanyifeng.com/blog/2015/02/make.html)
+ [适用于 Go 项目的 Makefile 指南](https://juejin.im/post/6844903806971412494)
+ [Using Makefile for Go - Go语言项目如何正确使用Makefile](https://colynn.github.io/2020-03-03-using_makefile/)

<!-- make -->
+ [make](https://web.mit.edu/gnu/doc/html/make_5.html)
+ [make symbols](https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html#Automatic-Variables)


<!-- gcc -->
+ [GCC编译器30分钟入门教程](http://c.biancheng.net/gcc/)
+ [ Go 编译器：GCC 4.7.1 中的 Gccgo](https://learnku.com/docs/go-blog/gccgo-in-gcc-471/6569)
+ [go gc gccgo gcc GNU 之间的关系](https://www.jianshu.com/p/9bd145357533)
+ [Makefile选项CFLAGS,LDFLAGS,LIBS](https://blog.csdn.net/qq_15437629/article/details/85808229)