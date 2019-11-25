


## issues

+ [UnboundLocalError](https://docs.python.org/2/faq/programming.html#why-am-i-getting-an-unboundlocalerror-when-the-variable-has-a-value)
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