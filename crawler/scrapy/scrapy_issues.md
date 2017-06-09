
## issues

+ 403 **setting.py中加USER_AGENT**

+ unicodedecodeerror: 'ascii' codec can't decode byte 0xb0 ...

[root cause](https://docs.python.org/3/howto/unicode.html)

solution:
```
import sys
reload(sys)
sys.setdefaultencoding('gbk')
```
+ No module named 'win32api'
pip install pypiwin32