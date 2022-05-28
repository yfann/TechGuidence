# tee

+ 读取标准输入的数据，并将其内容输出成文件

+ `ping google.com | tee output.txt`

+ `[command] | tee [file1] [file2] [file3]` 写入多个文件

+ `ls file* | tee output.txt | wc -l` tee的结果作为另一个命令的输入

## tips

+ `-a` 追加到文件

+ `-i` 忽视`ctrl + c`中断命令
    + `[command] | tee -i [file]`