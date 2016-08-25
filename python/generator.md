## container

+ list  `[1,2,3]`

+ set `{1,2,3}`

+ tuple `(1,2,3)`

+ dict `{1:'foo',2:'bar'}`

+ string `'foobar'`


## iterable

+ 大部分container是iterable, iterable不限于contianer

+ iterable是实现了`__iter__()`方法的对象，该方法返回iterator对象
```py
next(iter([1,2,3]))
```

## iterator

实现了`__next__()`方法的是iterator, 每次调用next(iterator)返回一个值

```py
from itertools import islice
# seq既是iterable也是iterator
class seq:
    def __init__(self):
        self.gap = 2
        self.curr = 1
    
    def __iter__(self):
        return self 
# python2.x next()
    def __next__(self):
        value = self.curr
        self.curr += self.gap
        return value
    
f = seq()
list(islice(f, 0, 10))
```

## generator

generator是iterable,用yield实现next

```py
def seq():
    gap, curr = 2, 1
    while True:
        yield curr
        curr = curr + gap

f = seq()
list(islice(f, 0, 10))

```

## list expression

```py
numbers=[1,2,3,4,5,6]
[x ** 2 for x in numbers]
```

## generator expression

```py
numbers=[1,2,3,4,5,6]
squares_list=(x * x for x in numbers)
list(squares_list)
```