# List Watch

+ client(kubelet/controler-manager...)---------(list-watch)-------->apiserver------>etcd

+ 消息可靠性
    + 仅watch可能会丢失消息
    + list保证了可靠


+ 消息并发
    + resourceVersion


## watch

+ url?watch=true

+ http长连接
    + Chunked transfer encoding
        + `Transfer-Encoding:chunked`

+ 返回watchevent

+ informer
    + list-watch API
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

## ref
+ [理解 K8S 的设计精髓之 List-Watch机制和Informer模块](https://zhuanlan.zhihu.com/p/59660536)
+ [谈谈 Kubernetes list/watch 的设计原理](https://zhuanlan.zhihu.com/p/520307533)