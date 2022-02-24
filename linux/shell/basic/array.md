# shell array
<!-- 定义数组-->
+ `a=(1 2 3)`
    + `a+=(4 5 6)` 最加数组
    + `unset a[2]` 删除成员
        + `a[1]=''`
    + `unset a` 删除数组

```sh
a='a b c'
f=($a)
echo ${f[@]}
```

    
<!-- 读取数组 -->
+ `echo ${a[1]}`
+ `echo ${a[@]}` 读取全部
    + `hobbies=( "${activities[@]}" )` copy 数组
```sh
for i in "${a[@]}"; do
  echo $i
done
```

+ 数组长度
    + `${#array[*]}`
    + `${#array[@]}`

+ 返回数组成员index
    + `${!array[@]}`
    + `${!array[*]}`


+ 切片数组
    + `${array[@]:position:length}`

+ 关联数组(字典)
```sh
declare -A colors
colors["red"]="#ff0000"
colors["green"]="#00ff00"
colors["blue"]="#0000ff"

# echo ${colors["blue"]}
```

## tips
+ `mp3s=( *.mp3 )` 把当前目录的所有mp3文件放入数组

## ref
+ [数组（array）](https://wangdoc.com/bash/array.html)
+ [shell 数组、字典、source、split简单实例](https://blog.csdn.net/u014297722/article/details/54601660)
+ [Shell一维数组和二维数组](https://www.jianshu.com/p/543fa9df3469)