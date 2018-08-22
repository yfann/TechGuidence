# Python

## environment
+ vscode + python extension
+ [pip on windows](https://pypi.python.org/pypi/setuptools#windows-simplified)
+ virtualenv?

## install 3rd libs

Packages: [pypi](https://pypi.python.org/pypi)

管理工具:

+ [pip](http://pypi.python.org/pypi/pip#downloads)
    `pip install [libname]`

+ [easy installer](http://pypi.python.org/pypi/setuptools)
    `easy_install [libname]`

+ [wheel](http://pythonwheels.com/)
    `pip install *.whl`

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

## Trouble Shooting

+ unicodedecodeerror: 'ascii' codec can't decode byte 0xb0 ...

[root cause](https://docs.python.org/3/howto/unicode.html)

solution1:
```
import sys
reload(sys)
sys.setdefaultencoding('gbk')
```

solution2:
注释python27\lib\mimetypes.py中的
```py
# try:
#     ctype = ctype.encode(default_encoding) # omit in 3.x!
# except UnicodeEncodeError:
#     pass
```


##　ref

+ [tutorialspoint](http://www.tutorialspoint.com/python/string_decode.htm)
+ [python编码](http://wklken.me/posts/2013/08/31/python-extra-coding-intro.html)
+ [official doc](https://docs.python.org/3.8/library/index.html)
+ [python3 cookbook](https://python3-cookbook.readthedocs.io/zh_CN/latest/c04/p04_implement_iterator_protocol.html)