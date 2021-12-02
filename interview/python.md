




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

## 高级
+ GIL
    + 多线程

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