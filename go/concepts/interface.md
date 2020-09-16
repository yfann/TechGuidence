


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
w=os.Stdout
// w=io.Writer(os.Stdout) 显示转换
// 动态类型 *os.File
// 动态值 os.Stdout的副本，指向标准输出的os.File类型的指针
w.Write([]byte("hello"))
// os.Stdout.Write([]byte("hello"))
```

+ 可以==比较
```GO
var x interface{}=[]int{1,2,3}
x==x
// 异常,slice,map,function不可比较
```

+ 空指针不能赋给接口
```go
var buf *bytes.Buffer

func f(out io.Writer){
    if out !=nil{
        out.Write([]byte("done\n"))
    }
}

f(buf) //报错，动态类型不为空，动态值为空

// 应该使用
var buf io.Writer
```

+ `fmt.Printf("%T\n",x)` 查看类型，内部反射