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

+ generator是iterable,用yield实现next

```py
def seq():
    gap, curr = 2, 1
    while True:
        yield curr
        curr = curr + gap

f = seq()
list(islice(f, 0, 10))

```
+ `yield from [iterable]`相当于:

```py
for item in [iterable]:
    yield item:
```

## list expression(表推导)

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

## tools

+ `itertools.islice([iterable],10,None)` 切片

+ `itertools.dropwhile()` 跳过开始部分元素

```py
from itertools import dropwhile
with open('/etc/passwd') as f:
    for line in dropwhile(lambda line: line.startswith('#'), f):
        print(line, end='')
```

+ `itertools.permutations()` 产生排列组合, `itertools.combinations()`产生组合

```py
>>> items = ['a', 'b', 'c']
>>> from itertools import permutations
>>> for p in permutations(items):
...     print(p)
...
('a', 'b', 'c')
('a', 'c', 'b')
('b', 'a', 'c')
('b', 'c', 'a')
('c', 'a', 'b')
('c', 'b', 'a')
>>>
```

+ `enumerate()` 产生索引

```py
>>> my_list = ['a', 'b', 'c']
>>> for idx, val in enumerate(my_list):
...     print(idx, val)
...
0 a
1 b
2 c
```

+ `zip()` 迭代多个数组, `itertools.zip_longest()`

```py
>>> xpts = [1, 5, 4, 2, 10, 7]
>>> ypts = [101, 78, 37, 15, 62, 99]
>>> for x, y in zip(xpts, ypts):
...     print(x,y)
...
1 101
5 78
4 37
2 15
10 62
7 99
>>>


>>> for i in zip_longest(a, b, fillvalue=0):
...     print(i)
...
(1, 'w')
(2, 'x')
(3, 'y')
(0, 'z')
>>>
```

+ `list()`

+ `itertools.chain()`

```py
>>> from itertools import chain
>>> a = [1, 2, 3, 4]
>>> b = ['x', 'y', 'z']
>>> for x in chain(a, b):
... print(x)
...
1
2
3
4
x
y
z
>>>
```

+ `heapq.merge()` 传入有序序列，合并排序

```py
>>> import heapq
>>> a = [1, 4, 7, 10]
>>> b = [2, 5, 6, 11]
>>> for c in heapq.merge(a, b):
...     print(c)
...
1
2
4
5
6
7
10
11
```