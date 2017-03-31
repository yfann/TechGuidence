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