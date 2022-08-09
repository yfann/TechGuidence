## at(linux 计划任务)


## cmd

+ `at -l`
    + `atq` 查看任务序列

+ `at -r <id>`
    + `atrm <id>` 删除任务

## practice
+ `at now + 1 minute -f testat.sh`
+ `echo "ls -l" | at 1:25 pm`
+ `at  01:35 < my-at-jobs.txt`



## `at>`
+ `at now + 1 minute`
    + `at> ....` 

+ `ctrl + d` 完成编辑

## tips
+ job结果会mail
    + `/usr/sbin/sendmail`



## issues

+ WSL `Can't open /var/run/atd.pid to signal atd. No atd running?`
    + `sudo /etc/init.d/atd start`

## ref
+ [Linux at, batch, atq, and atrm commands](https://www.computerhope.com/unix/uat.htm)