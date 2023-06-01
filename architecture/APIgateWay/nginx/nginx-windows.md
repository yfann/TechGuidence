
## cmd
+ `start nginx`
    + 解压后启动nginx
    + 不要直接双击nginx.exe

+ `tasklist /fi "imagename eq nginx.exe"`
    + 查看是否启动

+ `nginx -t -c /nginx-1.15.2/conf/nginx.conf`
    + 检查配置文件是否正确

+ `nginx -s reload`
    + 重新加载配置

+ `nginx -s stop` 
    + `nginx -s quit`
    + 关闭nginx

## ref
+ [nginx for Windows](http://nginx.org/en/docs/windows.html)
+ [nginx download](http://nginx.org/en/download.html)