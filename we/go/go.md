Go语言入门(一)

## 简介

Go是编译型的语言。Go的工具链将程序的源文件转变成机器的二进制指令。


## hello world例子

在helloworld.go中写入

package main

import "fmt"

func main(){
    fmt.Println("Hello world")
}

go run helloworld.go 运行程序
输出：
Hello world


go build helloworld.go 可以编译程序，生成helloworld的可执行程序
以后可以直接执行:
./helloworld

go代码是使用包来组织的(其他语言中的库)，一个包可以包含多个.go文件，一般放在同一个文件夹中，文件夹为包名。每个.go文件开头声明所在的包，如helloworld.go中package main. main包是个特殊的包，是用来定义可执行程序的不是库。

可以用import命令导入其他包。helloworld.go中使用了import "fmt"导入fmt包，用来格式化输出。Println是fmt中的可导出函数。导入的包必须被用到，如果缺失或导入了多余的包编译会失败。

## 变量

变量声明规则：
Go中函数和变量的名称是区分大小写的。
在函数内声明的变量只在函数内可见。
在函数外声明的变量在整个包中可见。
函数外的变量如果第一个字母大写则可以被其他包访问。
Go中变量习惯使用短名称，特别是作用于较小的变量直接使用i而不是index。如果作用域的范围越大则变量用长且有意义的名称。
单词组合式命名一般使用“驼峰式”，如：parseRequestLine

声明：
有四个注意的声明：var,const,type,func

var声明创建一个具体类型的变量，然后给他附加一个名字并设置初始值。通用形式为： var name type = expression
type和expression可以省略一个。省略type则类型由expression决定，省略expression则初始值根据type取零值。
例如：
var boiling float64 = 100
var i,j,f int

短变量声明，可以用 name:=expression来声明局部变量(函数内变量)。   
例如：
t := 0.0
i,j := 0,1

:= 是声明，= 是赋值。


## 指针

变量是存储值的地方。指针的值是变量的地址，可以间接修改变量的值。
例子：

var p *int
var x int = 1
p = &x
fmt.Println(*p)

*int 是个int型的指针, &x是取x变量的地址, *p是p指向的变量。

一个典型的闭包例子：

var p=f()

func f() *int{
    v := 1
    return &v
}

指针的零值为nil。如果p!=nil的结果为true，则说明p指向一个变量。指针是可以比较的，当两个指针都相同时说明两个指针都指向添加欧诺个一个变量或两者都为nil。

## new函数

内置的new函数是另外一钟创建变量的方式。
new(T)创建一个未命名的T类型变量，初始化T的零值，并返回其地址(*T)。

p := new(int)
fmt.Println(*p)
*p =2 
fmt.Println(*p)

使用new创建的变量和取址的普通变量没什么不同，只是不需要引入虚拟的名字，是语法上的便利。
每次使用new返回一个具有唯一地址的不同变量：
p := new(int)
q := new(int)
fmt.Println(p==q)  //false 
