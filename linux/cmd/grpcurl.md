## cmd
+ `grpcurl -help`
+ `grpcurl [-plaintext] <ip:port> list`
    + `-plaintext`
        + use HTTP/2 when connection to server(no TLS)
    + `-insecure`
        + 调443端口
+ `grpcurl -protoset <*>.bin list`

+ `./grpcurl -cacert=./certs/tls.crt <ip>:443 list`

## install
+ `brew install grpcurl`

## ref
<!-- image -->
+ [networld/grpcurl](https://hub.docker.com/r/networld/grpcurl)
    + `./grpcurl <address> list`

<!-- detail -->
+ [grpcurl](https://blog.frognew.com/2020/04/grpcurl.html)
+ [grpcurl工具](https://chai2010.cn/advanced-go-programming-book/ch4-rpc/ch4-08-grpcurl.html)


<!-- source -->
+ [fullstorydev/grpcurl](https://github.com/fullstorydev/grpcurl)
+ [go:gRPCurl](https://pkg.go.dev/github.com/fullstorydev/grpcurl)


