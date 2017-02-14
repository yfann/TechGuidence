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

## encode/decode

```
# str  -> decode('the_coding_of_str') -> unicode
# unicode -> encode('the_coding_you_want') -> str
# 只对unicode使用encode

#unicode可以作为中间码
#s是code_A的str
#s.decode('code_A').encode('code_B')
#str(code_A)->unicode->str(code_B)
```
例子：
```py
ustr=u"\u8c46\u74e3\u7535\u5f71\u6392\u884c\u699c".encode('utf-8')
print ustr

print type('中文')
# <type 'str'>
print type(u'中文')
# <type 'unicode'>


isinstance(u'中文', unicode)
# True
isinstance('中文', unicode)
# False
isinstance(u'中文', str)
# False
isinstance('中文', str)
# True
```
+ python内部都为unicode编码

+ decode(外部编码转换为内部unicode) encode(内部unicode转换为外部其他编码)

+ 乱码是因为输出的外部编码和IDE或控制台的编码不一致

```py
print u'中文'.encode('gbk')
print u'中文'.encode('utf-8')
```
+ python源代码为ASCII,要修改编码需在头部声明
```py
#coding=utf-8
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