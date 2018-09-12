+ `vars()` *查看对象或类的属性*

```py
pysite=PythonSite('gg')

vars(PythonSite)
#等价于
PythonSite.__dict__
```

+ 属性 *python访问对象属性时先访问对象的__dict__,如果没有查找父类的__dict__*

```py
pysite1.site
#等价于
pysite1.__dict__['site']
```

+ 描述器 *调描述器时会先调object.__getattribute__()*

```py
obj.x
type(obj).__dict__['x'].__get__(obj, type(obj))

class.x
type(class).__dict__['x'].__get__(None, type(class)
```
