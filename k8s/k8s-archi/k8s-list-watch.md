# List Watch

+ client(kubelet/controler-manager...)---------(list-watch)-------->apiserver------>etcd

+ 消息可靠性
    + 仅watch可能会丢失消息
    + list保证了可靠


+ resourceVersion
    + 这个标签是递增的数字，所以当客户端并发处理同一个资源的事件时，它就可以对比resourceVersion来保证最终的状态和最新的事件所期望的状态保持一致。

## list
+ list API 返回资源列表
    + 查询当前资源
+ 基于http短连接
+ 

## watch

+ url?watch=true

+ http长连接
    + Chunked transfer encoding（HTTP/1.1）
        + response
            + `Transfer-Encoding:chunked`
        + 使用分块传输编码，数据分解成一系列数据块，并以一个或多个块发送，这样服务器可以发送数据而不需要预先知道发送内容的总大小。
```sh
$ curl -i http://{kube-api-server-ip}:8080/api/v1/watch/pods?watch=yes
HTTP/1.1 200 OK
Content-Type: application/json
Transfer-Encoding: chunked
Date: Thu, 02 Jan 2019 20:22:59 GMT
Transfer-Encoding: chunked

{"type":"ADDED", "object":{"kind":"Pod","apiVersion":"v1",...}}
{"type":"ADDED", "object":{"kind":"Pod","apiVersion":"v1",...}}
{"type":"MODIFIED", "object":{"kind":"Pod","apiVersion":"v1",...}}
...
```

+ 返回watchevent

## informer
+ Client-go的核心工具包
    + Lister()
        + list/get k8s objects
    + 一般通过informer获取k8s对象而不是直接调用k8s api

+ 依赖list-watch API
    + relist-watch

+ 先list resource,缓存结果
    + 再通过watch机制维护缓存

+ 缓存
    + DeltaFIFO
        + 缓存watch APi的各种事件
    + LocalStore
        + 只会被Lister(List/Get)方法访问
        
+ apiserver--(event)---->reflector---(event)--->DeltaFIFO
+ DeltaFIFO------->store<--------------Lister

## Tips
+ level trigger vs edge trigger
    + k8s使用level trigger

+ 设计异步消息系统
    + 消息可靠性
    + 消息实时性
    + 消息顺序性
    + 高性能
        + list-watch比周期性调用list高效

## ref
+ [理解 K8S 的设计精髓之 List-Watch机制和Informer模块](https://zhuanlan.zhihu.com/p/59660536)
+ [谈谈 Kubernetes list/watch 的设计原理](https://zhuanlan.zhihu.com/p/520307533)