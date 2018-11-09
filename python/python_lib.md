+ `abc` 定义抽象类

```py
from abc import ABCMeta, abstractmethod

class IStream(metaclass=ABCMeta):
    @abstractmethod
    def read(self, maxbytes=-1):
        pass

    @abstractmethod
    def write(self, data):
        pass


#继承
class SocketStream(IStream):
    def read(self, maxbytes=-1):
        pass

    def write(self, data):
        pass

#类型检测
def serialize(obj, stream):
    if not isinstance(stream, IStream):
        raise TypeError('Expected an IStream')
    pass
```



## ref

+ pandas jieba xlrd snownlp gensim sklearn xlsxwriter
+ tensorflow(3.6.2x64)
+ keras