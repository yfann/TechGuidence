## tips

+ `rt wt at`读,写,追加 `rb,wb` 读写二进制 `xt` 文件不存在才能写入
```py
with open('xxx.py','wt') as f:
    f.write()
```

+ `sys.getdefaultencoding()`  *未知编码时使用latin-1*

```py
with open('xxx.txt','rt',encoding='latin-1') as f:
    ...
```

+ \r\n会默认替换为\n,
```py
#不会替换为\n
with open('xxx','rt',newline='') as f:
    ...
```

+ `b'abc'`字节字符串

```py
b=b'hello world'
for a in b:
    print(a)
```

+ array可以直接写入二进制文件，因为实现了缓存接口，这种对象会直接暴露其底层的内存缓冲区给能处理它的操作

```py
import array
nums = array.array('i', [1, 2, 3, 4])
with open('data.bin','wb') as f:
    f.write(nums)

```

+ StringIO/BytesIO *模拟文件读写*

```py
s=io.BytesIO()
s.write(b'binary data')
s.getvalue()
#b'binary data'
```


+ gzip/bz2

```py
import gzip
with gzip.open('file.gz','rt') as f:
    text=f.read()
```

+ partial

```py
from functools import partial
SIZE=32
with open('xxx','rb') as f:
    records=iter(partial(f.read,SIZE),b'')
    for r in records:
        ...
#partial(f.read,SIZE) 为可调用对象，iter为其创建迭代器，当其返回b''时停止调用
```

+ readinto