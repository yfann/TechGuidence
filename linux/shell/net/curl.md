## cmd

+ `curl -k https://www.baidu.com`
    + 或`--insecure` 跳过https检查

<!-- https exapmle-->
+ `curl --cacert /etc/etcd/ssl/etcd-ca.pem --cert /etc/etcd/ssl/etcd.pem --key /etc/etcd/ssl/etcd-key.pem https://****:**/metrics`


+ `curl -LO <url>`

## tips

+ `-O` 服务器返回内容保存成文件,并将URL的最后作为文件名

+ `-I` head请求，并打印返回的http头

+ `-L` 请求随服务器重定向,curl默认不跟随重定向

+ `-vvv` 查看请求过程
    + `-v`

+ `-u`
    + `curl -k -u <name>:<pwd> <url>:<port>`

+ `-F` upload file

+ `-#` --progress-bar

+ `-w [format]`
    + `--write-out`

## practice

```sh
# waiting url return 200
  while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' localhost:9000)" != "200" ]]
  do
    echo "connecting nexus ..."
    sleep 5
  done
```

## ref
+ [curl 的用法指南](https://www.ruanyifeng.com/blog/2019/09/curl-reference.html)
+ [curl 命令详解](https://www.jianshu.com/p/07c4dddae43a)
+ [grpcurl](https://blog.frognew.com/2020/04/grpcurl.html)
    + 访问gRPC
+ [Write out](https://everything.curl.dev/usingcurl/verbose/writeout)
<!-- issue -->
+ [使用curl进行https通信遇到的问题总结](https://codeantenna.com/a/VVQP6e8H8G)

