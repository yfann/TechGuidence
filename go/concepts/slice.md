## slice
+ `s:=[]int{0,1,3,4}` slice,长度不固定,可以扩展
    + `s:=[...]int{0,1,3,4}`数组,长度固定

+ slice:可变长度，对应底层数组
    + 指针：底层数组中slice可以访问的位置
    + 长度: slice中的元素个数，不能超过容量
        + `len(s)`
    + 容量：slice的起始元素到底层数组中的最后一个元素间的个数
        + `cap(s)`

+ `s[i:j]` 创建新slice,s可以是数组或指向数组的指针
    + j超过cap 报错
    + j超过len 扩展

+ slice之间无法比较,需要自己实现
    + `bytes.Equal` 可以比较[]byte

+ slice==nil时 len,cap都为0
    + slice!=nil时 len,cap也可以为0
        + `var s []int` len==0,s==nil
        + `s=nil` len==0,s==nil
        + `s=[]int(nil)` len==0,s==nil
        + `s=[]int{}` len==0,s!=nil
    + 要用`len(s)==0`判断slice是否为空，而不是用`s==nil`判断
    + 为nil的slice和长度为0的slice行为一致,用方法时不会报错

+ `func reverse(s []int)`通过slice参数可以修改底层数组

+ `make([]int,len,cap)`

+ `copy(target_sli,source_sli)`
    + `copy(slice[i:],slice[i+1:])`  copy来移除元素

+ `append(x,x...)`
    + `append(x,1,3,4)`
```go
var runes []rune
rues = append(runes,"asdf")
// append有可能通过make函数扩展底层数组,传入的slice和返回的slice有可能不是同一个
// 所以要再次赋值给传入的rues
```

+ slice就地修改,func只在传入的slice上修改，不创建新的slice
    + `s:=strings[:0]` 指向原始slice长度为0的新建slice
    + 重用底层数组

