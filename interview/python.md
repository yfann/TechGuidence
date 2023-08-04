




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
    + fake thread

+ 列表推导试
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

## flask

+ WSGI(Web Server Gateway Interface)
    + WSGI（Web Server Gateway Interface，Web 服务器网关接口）则是Python语言中1所定义的Web服务器和Web应用程序之间或框架之间的通用接口标准。
    + WSGI就是一座桥梁，桥梁的一端称为服务端或网关端，另一端称为应用端或者框架端，WSGI的作用就是在协议之间进行转化。WSGI将Web组件分成了三类：Web 服务器（WSGI Server）、Web中间件（WSGI Middleware）与Web应用程序（WSGI Application）。
    + Web Server接收HTTP请求，封装一系列环境变量，按照WSGI接口标准调用注册的WSGI Application，最后将响应返回给客户端。

+ 组件
    + Route(路由)
    + templates(模板)
    + Models(orm模型)
    + blueprint(蓝图)
        + 创建模块化对象
    + Jinja2模板引擎


## ref

+ [Python面试宝典 - 基础篇 - 2020](https://github.com/jackfrued/Python-Interview-Bible/blob/master/Python%E9%9D%A2%E8%AF%95%E5%AE%9D%E5%85%B8-%E5%9F%BA%E7%A1%80%E7%AF%87-2020.md)