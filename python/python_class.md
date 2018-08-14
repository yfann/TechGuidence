## tips

+ `__repr__()` `__str__()`  *repr的一般用法`eval(repr(x)) == x`*

```py
class Pair:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def __repr__(self):
        return 'Pair({0.x!r}, {0.y!r})'.format(self)

    def __str__(self):
        return '({0.x!s}, {0.y!s})'.format(self)

>>> p = Pair(3, 4)
>>> print('p is {0!r}'.format(p))
p is Pair(3, 4)
>>> print('p is {0}'.format(p))
p is (3, 4)
```

+ `__private` *会被重命名为`_B__private`,继承时这种属性无法被覆盖*

+ `property`

```py
class Person:
    def __init__(self, first_name):
        self.first_name = first_name

    # Getter function
    @property
    def first_name(self):
        return self._first_name

    # Setter function
    @first_name.setter
    def first_name(self, value):
        if not isinstance(value, str):
            raise TypeError('Expected a string')
        self._first_name = value

    # Deleter function (optional)
    @first_name.deleter
    def first_name(self):
        raise AttributeError("Can't delete attribute")



# >>> a = Person('Guido')
# >>> a.first_name # Calls the getter
# 'Guido'
# >>> a.first_name = 42 # Calls the setter
# Traceback (most recent call last):
#     File "<stdin>", line 1, in <module>
#     File "prop.py", line 14, in first_name
#         raise TypeError('Expected a string')
# TypeError: Expected a string
# >>> del a.first_name
# Traceback (most recent call last):
#     File "<stdin>", line 1, in <module>
# AttributeError: can`t delete attribute

class Person:
    def __init__(self, first_name):
        self.set_first_name(first_name)

    # Getter function
    def get_first_name(self):
        return self._first_name

    # Setter function
    def set_first_name(self, value):
        if not isinstance(value, str):
            raise TypeError('Expected a string')
        self._first_name = value

    # Deleter function (optional)
    def del_first_name(self):
        raise AttributeError("Can't delete attribute")

    # Make a property from existing get/set methods
    name = property(get_first_name, set_first_name, del_first_name)
```

+ `super()`

```py
class A:
    def __init__(self):
        self.x = 0

class B(A):
    def __init__(self):
        super().__init__()
        self.y = 1
```


+ `__mro__` *继承顺序列表*

```py
# >>> C.__mro__
# (<class '__main__.C'>, <class '__main__.A'>, <class '__main__.B'>,
# <class '__main__.Base'>, <class 'object'>)
# >>>
```

+ 子类扩展父类property

```py
class Person:
    def __init__(self, name):
        self.name = name

    # Getter function
    @property
    def name(self):
        return self._name

    # Setter function
    @name.setter
    def name(self, value):
        if not isinstance(value, str):
            raise TypeError('Expected a string')
        self._name = value

    # Deleter function
    @name.deleter
    def name(self):
        raise AttributeError("Can't delete attribute")

class SubPerson(Person):
    @Person.name.getter
    def name(self):
        print('Getting name')
        return super().name
```

+ 描述器

```py
class Integer:
    def __init__(self, name):
        self.name = name

    def __get__(self, instance, cls):
        if instance is None:
            return self
        else:
            return instance.__dict__[self.name]

    def __set__(self, instance, value):
        if not isinstance(value, int):
            raise TypeError('Expected an int')
        instance.__dict__[self.name] = value

    def __delete__(self, instance):
        del instance.__dict__[self.name]


class Point:
    x = Integer('x')
    y = Integer('y')

    def __init__(self, x, y):
        self.x = x
        self.y = y


# >>> p = Point(2,3)
# >>> p.x # Calls Point.x.__get__(p, Point)
# 2
# >>> Point.x # Calls Point.x.__get__(None, Point)
# <__main__.Integer object at 0x100671890>

```