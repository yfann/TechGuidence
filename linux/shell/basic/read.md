# read

+ `read aa` 标准输入读取数据，传给变量`echo aa`
    + `read -p "输入网站名:" website` -p提示
    + ` -t 5 ` 倒计时
    + `-s` 密码不显示

+ read file
<!-- read file -->
```sh
cat test.txt | while read line 
do
   echo "Line $count:$line"
   count=$[ $count + 1 ]    
done

while read myline
do
  echo "$myline"
done < $filename
```

+ `$REPLY` 读取所有参数
```sh
read
echo "REPLY = '$REPLY'"
```

## ref
+ [Linux read 命令](https://www.runoob.com/linux/linux-comm-read.html)
+ [read 命令](https://wangdoc.com/bash/read.html)