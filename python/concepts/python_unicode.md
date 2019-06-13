
## python2/3

+ python2中包含unicode str和非unicode str
+ python3中只有unicode str

## encode/decode(python2)

>str和uniocde都是basestring的子类. `'中文'` str   `u'中文'` unicode
```py
print type('中文')
# <type 'str'>
print type(u'中文')
# <type 'unicode'>
```

```
# str.decode() == unicode
# unicode.encode() == str
# 只对unicode使用encode

# str.encode() == str.decode(sys.defaultencoding).encode()
# 当str时中文，sys.defaultencoding是ascii时出现乱码
# unicode.decode() == unicode.encode().decode()

# unicode可以作为中间码
# s是code_A的str
# s.decode('code_A').encode('code_B')
# str(code_A)->unicode->str(code_B)
```
例子：
```py
ustr=u"\u8c46\u74e3\u7535\u5f71\u6392\u884c\u699c".encode('utf-8')
print ustr

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

# if type(text) is bytes
text.decode('unicode_escape')
```

## encode/decode

+ 查看默认编码
```py
import sys
print(sys.getdefaultencoding())
```

+ 修改默认编码
```py
import sys
reload(sys)
sys.setdefaultencoding('gbk')
```
>或代码文件加注释
```py
#coding=utf-8
```


## ref
+ [Python字符编码详解](http://python.jobbole.com/82107/)
+ [PYTHON-进阶-编码处理小结](http://wklken.me/posts/2013/08/31/python-extra-coding-intro.html)