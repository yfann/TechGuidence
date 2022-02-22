# pipe

+ `|`
    + 可以处理 std out
        + 作为下个命令的 std input
    + 不能处理 std error

+ `-`
    + 可以替代标准输入，标准输出
    + `tar -cvf - /home | tar -xvf -`
    
##  ref
+ [10.6 管线命令 （pipe）](https://wizardforcel.gitbooks.io/vbird-linux-basic-4e/content/92.html)