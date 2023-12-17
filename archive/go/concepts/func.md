

## func type

```go

package main

import "fmt"

// Greeting function types
type Greeting func(name string) string

func (g Greeting) say(n string) {
    fmt.Println(g(n))
}

func english(name string) string {
    return "Hello, " + name
}

func french(name string) string {
    return "Bonjour, " + name
}

func main() {
    g := Greeting(english)
    g.say("World")
    g = Greeting(french)
    g.say("World")
}
```




## variable length argument

```go
func Println(a ...interface{}) (n int, err error) {
	return Fprintln(os.Stdout, a...)
}
```


## tips

+ return func
```go
func Timeout(arg string) func(context.Context) (string, error) {
    ....
}
```

+ format
```go
for t := 0.0; t < cycles*2*math.Pi; t += res {
    x := math.Sin(t)
    y := math.Sin(t*freq + phase)
    img.SetColorIndex(
        size+int(x*size+0.5), size+int(y*size+0.5),
        blackIndex, // 最后插入的逗号不会导致编译错误，这是Go编译器的一个特性
    )               // 小括弧另起一行缩进，和大括弧的风格保存一致
}
```