## go method code

```go
// pointer receiver

type IntSet struct { /* ... */ }
func (*IntSet) String() string
var _ = IntSet{}.String() // compile error: String requires *IntSet receiver

var s IntSet
var _ = s.String() // OK: s is a variable and &s has a String method

var _ fmt.Stringer = &s // OK
var _ fmt.Stringer = s  // compile error: IntSet lacks String method
```

## pointer receiver

```go
func (p *Point) ScaleBy(factor float64) {
    p.X *= factor
    p.Y *= factor
}
//调用1
(*Point).ScaleBy

//调用2
r := &Point{1, 2}
r.ScaleBy(2)
fmt.Println(*r)

//调用3
//隐式调用1
p := Point{1, 2}
p.ScaleBy(2)
// 只有varaible 可以获取地址
// 编译器会隐式调用 (&p).ScaleBy(2)
// 只作用于变量
// 类似的有p.X(struct),perim[0](slice)
//** temporary value 无法获取地址
//Point{1, 2}.ScaleBy(2) 
// compile error: can't take address of Point literal



// *****************隐式调用2
func (p Point) ScaleBy(factor float64)...
// pptr是指针
pptr.Distance(q)
```

## method value
```go
p := Point{1, 2}
q := Point{4, 6}

distanceFromP := p.Distance        // method value
fmt.Println(distanceFromP(q))      // "5"
```
<!-- method expression -->
```go
p := Point{1, 2}
q := Point{4, 6}

distance := Point.Distance   // method expression
fmt.Println(distance(p, q))  // "5"
fmt.Printf("%T\n", distance) // "func(Point, Point) float64"

scale := (*Point).ScaleBy
scale(&p, 2)
fmt.Println(p)            // "{2 4}"
fmt.Printf("%T\n", scale) // "func(*Point, float64)"

// ........
func (path Path) TranslateBy(offset Point, add bool) {
    var op func(p, q Point) Point
    if add {
        op = Point.Add
    } else {
        op = Point.Sub
    }
    for i := range path {
        // Call either path[i].Add(offset) or path[i].Sub(offset).
        path[i] = op(path[i], offset)
    }
}
```