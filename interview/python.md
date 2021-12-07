




## basic

+ 函数传参时是值传递还是引用传递
    + 不可变参数是值传递
    + 可变参数是引用传递

+ *args
    + 任意数量的参数

+ **kwargs
    + 任意数量的关键字参数

+ 动态设置obj
    + hasattr()
    + getattr()
    + setattr()

+ lambda

+  模块和包
	+ import
	+ __init__
    + ModuleNotFoundError

+  Is, ==
	+ 10 is '10'
		+  id(a)==id(b)
    + 10 == '10'

+ __new__ vs __init__

+ 实例方法 vs 类方法

## 高级
+ GIL
    + 全局解释器锁
    + 多线程中一个线程运行时会霸占GIL，释放后其他线程才能运行
    + 每个进程都有一个GIL

+ 表推导

+ 装饰器

+ 迭代器，生成器

+ 插件系统
    + pkg_resources

+ logging.getLogger(name) 

+ 深浅拷贝

+ 瘊子补丁

## 内存管理

+ 引用计数
    + 循环引用
    + `sys.getrefcount(obj)`

+ 内存泄漏