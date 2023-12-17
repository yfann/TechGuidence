

# struct

```go
type Employee struct {
    ID        int
    Name      string
    Address   string
    DoB       time.Time
    Position  string
    Salary    int
    ManagerID int
}

var dilbert Employee

var employeeOfTheMonth *Employee = &dilbert

employeeOfTheMonth.Position += " (proactive team player)"
// (*employeeOfTheMonth).Position += " (proactive team player)"

e = new(Employee)
e.Name - ...

// literal value
type Point struct{ X, Y int }
p := Point{1, 2}


func AwardAnnualRaise(e *Employee) {
    e.Salary = e.Salary * 105 / 100
}
```

## 匿名成员
```go
type Circle struct {
    Point
    Radius int
}

type Wheel struct {
    Circle
    Spokes int
}

var w Wheel
w.X = 8            // equivalent to w.Circle.Point.X = 8
w.Y = 8            // equivalent to w.Circle.Point.Y = 8
w.Radius = 5       // equivalent to w.Circle.Radius = 5
w.Spokes = 20

w = Wheel{Circle{Point{8, 8}, 5}, 20}
```

## tips

+ type A struct,var a A和a2 := A{}相同

+ struct零值不是nil,是一个将所有属性初始化为零值的结构

+ *struct为nil

+ 大写成员可导出

+ 结构体S不能包含自身，可以包含*s


## ref
+ [go struct](https://docs.hacknode.org/gopl-zh/ch4/ch4-04.html)