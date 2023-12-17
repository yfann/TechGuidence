
## kube-apiserver 
+ auditing 产生于kube-apiserver内部
+ audit日志存储
    + log后端（事件写入文件）
    + webhook (将事件发送到外部HTTP API)
+ audit.k8s.io
    
## tips

+ 对资源类的请求
    + 可以audit
        + request
        + response

## ref
+ [Auditing](https://kubernetes.io/zh/docs/tasks/debug-application-cluster/audit/)