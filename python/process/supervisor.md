

## tips

+ supervisord  porcess

+ stdout_logfile_maxbytes=0
    + disable log file rotation

+ stdout_logfile=/dev/stdout
    + /dev/stdout is a symlink to /proc/self/fd/1
    +  redirect the program's stdout to supervisor's stdout


+ redirect_stderr=true

## ref

+ [supervisor](http://supervisord.org/running.html)
+ [supervisor](https://www.jianshu.com/p/0b9054b33db3)
+ [supervisor(一)基础篇](https://blog.51cto.com/lixcto/1539136)

+ [How to redirect stdout from child processes to supervisord](https://veithen.io/2015/01/08/supervisord-redirecting-stdout.html)