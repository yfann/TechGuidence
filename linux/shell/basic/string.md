# string

+ 引号
    - 单引号任何字符原样输出
    - 双引号(可转义，可显示变量)
        + `str="Hello, I know you are \"$your_name\"! \n"`
```sh
your_name="runoob"
# 使用双引号拼接
greeting="hello, "$your_name" !"
greeting_1="hello, ${your_name} !"
# 使用单引号拼接
greeting_2='hello, '$your_name' !'
```

## string condition

+ `[ -n str1 ]` 长度大于0是为真  
  + `[ ! -n str1 ]`
  
+ `[ -z str1 ]` 长度为0时为真(空串)
+ `[ str1 ]` 长度非空时为真

+ `[[ $a == z* ]]` true if $a starts with "z"
    + `[[ "zoo" == z* ]]&& echo "true"`
    + `if [[ $string == *"My long"* ]]; then`

+ `[[ $a == "z*" ]]` true if $a start with "z*"


## tips
+ `echo "$string" | [command]`

+ `echo $1 |awk -v s=/ '{print index($1,s)}'` position of charaters

+ `grep -o "/" <<<"$1"| wc -l` number of charater in a string

+ `echo ${#your_name}` 输出字符串长度
<!-- 获取子串 -->
```sh
string="runoob is a great site"
echo ${string:1:4} # 输出 unoo
```
<!-- 查找字符串 -->
```sh
string="runoob is a great site"
echo `expr index "$string" io`  # 输出 4
```

## here string
+ `grep -o "s" <<<"$x"`

## ref
+ [字符串操作](https://wangdoc.com/bash/string.html)
+ [How to Compare Strings in Bash](https://linuxize.com/post/how-to-compare-strings-in-bash/)
+ [shell中判断字符串为空的几种方法](https://www.gl.sh.cn/2018/08/15/shell_zhong_pan_duan_zi_fu_chuan_wei_kong_de_ji_zhong_fang_fa.html)
+ [Shell字符串拼接（连接、合并）](http://c.biancheng.net/view/1114.html)