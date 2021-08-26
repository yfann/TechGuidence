## cmd

+ `curl --insecure https://www.baidu.com`
    + 或`-k` 跳过https检查

<!-- https exapmle-->
+ `curl --cacert /etc/etcd/ssl/etcd-ca.pem --cert /etc/etcd/ssl/etcd.pem --key /etc/etcd/ssl/etcd-key.pem https://****:**/metrics`


+ `curl -LO <url>`

## tips
+ `-O` 服务器返回内容保存成文件,并将URL的最后作为文件名
+ `-I` head请求，并打印返回的http头
+ `-L` 请求随服务器重定向,curl默认不跟随重定向


## ref
+ [curl 的用法指南](https://www.ruanyifeng.com/blog/2019/09/curl-reference.html)

+ [grpcurl](https://blog.frognew.com/2020/04/grpcurl.html)
    + 访问gRPC


