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

+ StringIO/BytesIO *模拟文件读写,UT*

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

+ partial *分块读取*

```py
from functools import partial
SIZE=32
with open('xxx','rb') as f:
    records=iter(partial(f.read,SIZE),b'')
    for r in records:
        ...
#partial(f.read,SIZE) 为可调用对象，iter为其创建迭代器，当其返回b''时停止调用
```

+ readinto *读二进制数据到可变缓冲区*

```py
import os.path

def read_into_buffer(filename):
    buf = bytearray(os.path.getsize(filename))
    with open(filename, 'rb') as f:
        f.readinto(buf)
    return buf
```

+ mmap *读二进制文件到内存，mmap返回二进制数组，并不会把整个文件读到内存中*

```py
import os
import mmap
# mmap.ACCESS_READ mmap.ACCESS_COPY
# 默认会把修改的内容同步到文件中
# memoryview
def memory_map(filename, access=mmap.ACCESS_WRITE):
    size = os.path.getsize(filename)
    fd = os.open(filename, os.O_RDWR)
    return mmap.mmap(fd, size, access=access)

with memory_map('data') as m:
        print(len(m))
        print(m[0:10])
```

+ os.path *处理文件名*

```py

import os
path = '/Users/beazley/Data/data.csv'

# Get the last component of the path
os.path.basename(path)
>>>'data.csv'

# Get the directory name
os.path.dirname(path)
>>>'/Users/beazley/Data'

# Join path components together
os.path.join('tmp', 'data', os.path.basename(path))
>>>'tmp/data/data.csv'

# Expand the user's home directory
path = '~/Data/data.csv'
os.path.expanduser(path)
>>>'/Users/beazley/Data/data.csv'

# Split the file extension
os.path.splitext(path)
>>>('~/Data/data', '.csv')

os.path.exists('/etc/passwd')

os.path.isfile('/etc/passwd')
```

+ `os.listdir()`

```py
import os.path
import glob
from fnmatch import fnmatch

# Get all regular files
names = [name for name in os.listdir('somedir')
        if os.path.isfile(os.path.join('somedir', name))]

# Get all dirs
dirnames = [name for name in os.listdir('somedir')
        if os.path.isdir(os.path.join('somedir', name))]

pyfiles = [name for name in os.listdir('somedir')
            if name.endswith('.py')]


pyfiles = glob.glob('somedir/*.py')

pyfiles = [name for name in os.listdir('somedir')
            if fnmatch(name, '*.py')]
```

+ `io.TextIOWrapper()`

```py
import urllib.request
import io

u = urllib.request.urlopen('http://www.python.org')
f = io.TextIOWrapper(u, encoding='utf-8')
text = f.read()

#########################

>>> import sys
>>> sys.stdout.encoding
'UTF-8'
>>> sys.stdout = io.TextIOWrapper(sys.stdout.detach(), encoding='latin-1')
>>> sys.stdout.encoding
'latin-1'


#########################
>>> f = open('sample.txt','w')
>>> f
<_io.TextIOWrapper name='sample.txt' mode='w' encoding='UTF-8'>
>>> b = f.detach()
>>> b
<_io.BufferedWriter name='sample.txt'>
>>> f = io.TextIOWrapper(b, encoding='latin-1')
>>> f
<_io.TextIOWrapper name='sample.txt' encoding='latin-1'>
```

+ tempfile *关闭后会自动清除*

```py
from tempfile import TemporaryFile

with TemporaryFile('w+t') as f:
    # Read/write to the file
    f.write('Hello World\n')
    f.write('Testing\n')

    # Seek back to beginning and read the data
    f.seek(0)
    data = f.read()

# Temporary file is destroyed

```

+ pickle *序列化python对象*

```py
import pickle

data = ... # Some Python object
f = open('somefile', 'wb')
pickle.dump(data, f)

# Restore from a file
f = open('somefile', 'rb')
data = pickle.load(f)

# Restore from a string
data = pickle.loads(s)

```


## tools

+ `os.walk()`
+ `fnmatch.filter()`