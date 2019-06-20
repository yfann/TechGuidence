


## cmd
+ `python -m http.server [port]`


## help

+ `help()`
+ `hlep(<module name>.<function name>)`
+ `sys.bultin_modulenames`查看内部模块
+ `dir(<module name>)`查看模块下的所有方法

## tips
+ 查看模块路径

```py
import sys
import os
for i in sys.path:
    print(i)
# 添加新路径
new_path = os.path.abspath('../')
sys.path.append(new_path)
```

+ 查看python编译后的字节码 [dis](https://docs.python.org/2/library/dis.html)

```py
import dis
def myfunc(alist):
    return len(alist)

dis.dis(myfunc)
```

+ 代码换行
```py
a = 22 + \
       33
print a
#or
a = (22+
       33)
print a
#or
a = '''32 +
    45'''
print a


```