


## 空接口
+ `var any interface{}`
+ 可以赋任何值
+ 类型断言（空接口还原出实际值）



## 接口值
+ 动态类型(具体类型)
    + 初始:nil
    + 是否为nil,和动态类型有关
+ 动态值(具体类型的值)
    + 初始:nil

+ 隐式转换
```go
var w io.Writer
w=os.Stdout //隐式转换
// w=io.Writer(os.Stdout) 显示转换

// 动态类型: *os.File
// 动态值: os.Stdout的副本，指向标准输出的os.File类型的指针

w.Write([]byte("hello"))
// os.Stdout.Write([]byte("hello"))
// (*os.File).Write
```

+ ==
    + 动态类型相同
        + 可比较
            + 基本类型，指针
    + 动态值相同
```GO
var x interface{}=[]int{1,2,3}
x==x
// 异常,slice,map,function不可比较
```

+ 空指针不能赋给接口
```go
var buf *bytes.Buffer
// var buf io.Writer 应该使用

func f(out io.Writer){
    if out !=nil{
        out.Write([]byte("done\n"))
    }
}

f(buf) //报错，动态类型不为空(被设置为*bytes.Buffer)，动态值为空



```

+ `fmt.Printf("%T",x)` 查看类型，内部反射





## ref
+ [golang的struct里面嵌入interface](https://www.jianshu.com/p/a5bc8add7c6e)
+ [Go语言接口和类型之间的转换](http://c.biancheng.net/view/83.html)