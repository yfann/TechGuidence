
# receiver（方法的接收器）
+ 其他语言this,self
+ 除了指针和interface其他类型都可以作为receiver

## value receiver

## point receiver
+ 接受者过大，不想copy
+ 需要修改接受者


+ 如果类型有一个方法支持pointer receiver,则所有方法都应该支持pointer receiver
    - 如果type T的所有方法都是value receiver,则调用方法都是copy value,是安全的
    - 如果type T有方法是pointer receiver, 则应该避免copy value 
    - Either the receiver argument has the same type as the receiver parameter, for example both have type T or both have type *T
    ```go
    Point{1, 2}.Distance(q) //  Point
    pptr.ScaleBy(2)         // *Point
    ```
    - Or the receiver argument is a variable of type T and the receiver parameter has type *T. The compiler implicitly takes the address of the variabl
    ```go
    p.ScaleBy(2) // implicit (&p)
    ```
    - Or the receiver argument has type *T and the receiver parameter has type T. The compiler implicitly dereferences the receiver, in other words, loads the value
    ```go
    pptr.Dist
    ance(q) // implicit (*pptr)
    ```

+ 指针类型不能添加方法
```go
type P *int
func (P) f(){...}  //报错
```

## nil可以做为接收者
+ nil代表空值
```go
type IntList struct{
    Value int
    Tail *IntList
}

func (list *IntList) Sum() int{
    if list==nil{
        return 0
    }
    return list.Value+list.Tail.Sum()
}

```

## tips
+ 函数参数为值拷贝
    + 如果一个函数需要更新一个变量，或者函数的其中一个参数实在太大我们希望能够避免进行这种默认的拷贝，这种情况下我们就需要用到指针了
    + 对receiver也适用



