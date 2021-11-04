

## python 模块 包

+ 模块: 
    + 一个.py文件

+ 包: 
    + 包含.py文件的文件夹
    + 有`__init__.py`


+ 根据`sys.path` 查找包或模块
    + 没找到报`ModuleNotFoundError`
    + `print(sys.path)`
        + 执行脚本的路径
        + PYTHONPATH
        + 第三方模块的路径

+ `_xxx` protected
    + `from module_name import *`默认不导入内部类

+ `__xxx` private

+ `__xxx__` magic

+ `__name__`   
    + `python xx.py`时，解释器会设置`__name__='__main__'` 
    + `import xx`时，会设置`__name__='xx'` 

+ `import math`
    + `math = __import__("math")`

## from import 

+ `import [module]/[function]`
    + `import [pkg1].[pkg2].[module].[function]` 
    + `import xx as xxx` 别名
    + 不能导入`import [pkg]` 

+ `from [pkg]/[module]`
    + `from [pkg1].[pkg2].[module] import [function]`
    + `from [pkg1].[pkg2] import [module]`
    + `from . import module`
        + 导入同path下的module

+ 同包内不同模块之间引用
    + 绝对路径
        + `from package1.package2 import module1`
    + 相对路径
        + `from . import module_3`
            + 引入同路径的模块
        + `from .package_2 import module_21`
            + 引入同路径子包的模块
        + `from .. import module_name`
            + 上级目录模块
        + `from ..package_name import module_name`
    + 问题路径
        + `import module1`
            + 可能会`ModuleNotFoundError`
                + 级联引用时会包这种错误
                + 编译器会把执行代码的path放入`sys.path`中，`import module1`不会报错。但module1的path不会放入`sys.path`中，module1中如果使用了`import module2`则会报错
        

## __init__.py

+ 文件夹当在包管理，目录会成为module package
    + 嵌套文件夹时每个文件夹都应有__init__.py

+ import时会地总执行里面的函数

+ `__all__ = ['subpackage_1', 'subpackage_2']`
    + 对应`from mypackage import *`导入的模块


## ref

+ [ModuleNotFoundError 问题浅谈](https://zhuanlan.zhihu.com/p/69099185)
+ [python 模块](http://www.liaoxuefeng.com/wiki/001374738125095c955c1e6d8bb493182103fac9270762a000/0013868200196665403ac40fac14536939dd5af20810782000)
+ [python 模块2](http://www.cnblogs.com/feixuelove1009/p/5562856.html)
+ [Python __init__.py 作用详解](https://www.jianshu.com/p/73f7fbf75183)
