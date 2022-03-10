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

## here string
+ `grep -o "s" <<<"$x"`

## ref
+ [How to Compare Strings in Bash](https://linuxize.com/post/how-to-compare-strings-in-bash/)
+ [shell中判断字符串为空的几种方法](https://www.gl.sh.cn/2018/08/15/shell_zhong_pan_duan_zi_fu_chuan_wei_kong_de_ji_zhong_fang_fa.html)
+ [Shell字符串拼接（连接、合并）](http://c.biancheng.net/view/1114.html)