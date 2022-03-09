## condition
+ test expression
  + expression返回0 if 为真
  + expression返回1 if 为假

+ [ expression ]
  + 必须有空格

+ [[ expression ]]
  + 可以判断正则

<!-- file -->
+ `[ -a file ]` file存在为true
  + `[ -d dir ]` 目录存在为true
  + `[ -f file ]` file存在并且时普通文件
  + `[ -x file ]` file存在并且可执行
    + `if [ -x "$FILE" ]; then`
      + $FILE要放在双引号之中，这样可以防止变量$FILE为空，从而出错

<!-- string -->
+ `[ string ]` string长度大于0为true
  + `[ -n string ]` string长度大于0为true
  + `[ -z string ]` string长度为0为true
+ `[ string1 = string2 ]` `[ string1 == string2 ]`
  + `[ string1 != string2 ]`

<!-- int -->
+ `[ integer1 -eq integer2 ]`
  + `if [ $INT -eq 0 ]`
+ `[ integer1 -ne integer2 ]`
+ `[ integer1 -ge integer2 ]` >=

<!-- reg -->
+ `[[ string1 =~ regex ]]`
  + `[[ "$INT" =~ ^-?[0-9]+$ ]]` 数字判断

<!-- && || ！ -->
+ `[[ $INT -ge $MIN_VAL && $INT -le $MAX_VAL ]]`
+ `[ ! \( $INT -ge $MIN_VAL -a $INT -le $MAX_VAL \) ]`

<!-- 算数 -->
+ `if ((3 > 2)); then`
+ `((1))` 为true,算数判断非0时为true,和命令相反
+ `if (( foo = 0 ));then` 赋值并判断

## if

+ `if test "foo" = "foo"; then echo 'hello world'; fi`

+ `if echo 'hi'; then echo 'hello world'; fi`
  + if后面可以接命令，命令成功时返回0，条件成立

+ `if false; true; then echo 'hello world'; fi` 只看最后一个条件

+ `if`
```sh
if commands; then
  commands
[elif commands; then
  commands...]
[else
  commands]
fi
```

## string

+ `[ -n str1 ]` 长度大于0是为真  
  + `[ ! -n str1 ]`
  
+ `[ -z str1 ]` 长度为0时为真(空串)
+ `[ str1 ]` 长度非空时为真
+ `[[ $a == z* ]]` true if $a starts with "z"
    + `[[ "zoo" == z* ]]&& echo "true"`
    + 括号内要判断的字符串两边空格
+ `[[ $a == "z*" ]]` true if $a start with "z*"

## practice 

+ `if [ ! -n "$1" ]` 如果参数不为空
+ `if $PEM_MOD`

+ `[ -d temp ] || mkdir temp`
  + `[ ! -d temp ] && exit 1`

+ `if grep $word1 $filename && grep $word2 $filename`


## issues

+ 替换string时发现overwrite
    + 文件格式需要转为LF

## ref
+ [How to Compare Strings in Bash](https://linuxize.com/post/how-to-compare-strings-in-bash/)
+ [条件判断](https://wangdoc.com/bash/condition.html)
+ [shell中判断字符串为空的几种方法](https://www.gl.sh.cn/2018/08/15/shell_zhong_pan_duan_zi_fu_chuan_wei_kong_de_ji_zhong_fang_fa.html)
+ [Shell字符串拼接（连接、合并）](http://c.biancheng.net/view/1114.html)