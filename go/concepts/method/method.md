



## value receiver

## point receiver
+ 接受者过大，不想copy
+ 需要修改接受者
```go
func (p *Point) ScaleBy(factor float64) {
    p.X *= factor
    p.Y *= factor
}
// (*Point).ScaleBy
r := &Point{1, 2}
r.ScaleBy(2)

p := Point{1, 2}
p.ScaleBy(2)
//************************隐式调用1
// varaible 可以获取地址
// 隐式调用 (&p).ScaleBy(2)
// 只作用于变量
// 类似的有p.X(struct),perim[0](slice)

Point{1, 2}.ScaleBy(2) // compile error: can't take address of Point literal
//** temporary value 无法获取地址


// *****************隐式调用2
func (p Point) ScaleBy(factor float64)...
// pptr是指针
pptr.Distance(q)
// 隐式调用 编译器会插入* (*pptr).Distance(q)
```

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






