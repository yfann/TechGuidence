
## tips
+ 表推导可以代替map,filter `[f(n) for n in range(6) if n % 2]`
+ lambda是匿名函数
+ callable()可以判断对象是否可调用`callable(obj)`,obj实现了__call__则可调用`obj()`
+ `dir()`内省
+ *参数只能在最后一个位置参数之后，其后的参数为关键字参数
+ **参数只能出现在最后一个参数
+ 可以通关装饰器或闭包创建有状态的函数


## 参数

+ `*rest` 传递任意个数参数,`rest`是tuple

```py
def avg(first, *rest):
    pass

avg(1,2,3,4)

#rest==(2,3,4)


def recv(maxsize, *, block):
    'Receives a message'
    pass

recv(1024, True) # TypeError
recv(1024, block=True) # Ok
```
+ 关键字参数

```py
def tag(name,cls=None):
    pass

tag(cls='abc','aaa')
```

+ `**arrs`传递任意数量的关键字参数,`arrs`是dict

```py
def make_element(name, value, **attrs):
    keyvals = [' %s="%s"' % item for item in attrs.items()]
    ...

make_element('item', 'Albatross', size='large', quantity=6)
```

+ 函数注解,存在`clip.__annotations__`里,不做处理

```py
def clip(text:str,max_len:'int > 0'=80) -> str:
    pass
```

## 装饰器

+ 装饰器在被装饰的函数定义时执行

```py

@decorate
def target():
    print('')

def target():
    print('')
target=decorate(target)
```

+ nonlocal /*把变量标记为自由变量，被闭包的变量是自由变量*/

```py
def make_avg():
    count=0
    total=0

    def avg(new_value):
        nonlocal count,total
        count+=1
        total+=new_value
        return total/count

    return avg
```