
# Ingress
+ 反向代理规则，HTTP/HTTPS转发到哪个service上
    + host+url

+ Ingress Controller
    + 反向代理


## cmd
+ `curl <ingress domain>/<path>`
+ `kubectl -n kube-system get pod | grep nginx-ingress-controller`

## ref
+ [ingress](https://feisky.gitbooks.io/kubernetes/content/concepts/ingress.html)
+ [Ingress](https://kubernetes.io/zh/docs/concepts/services-networking/ingress/)
+ [Ingress 控制器](https://kubernetes.io/zh/docs/concepts/services-networking/ingress-controllers/)
<!-- ali cloud -->
+ [Ingress概述](https://help.aliyun.com/document_detail/198892.html?spm=a2c4g.11186623.6.768.2f19528eZdYgs4)
+ [部署Ingress Controller使用私网SLB](https://help.aliyun.com/document_detail/151506.html)
+ [部署高可靠Ingress Controller](https://help.aliyun.com/document_detail/86750.html)
+ [通过Ingress Controller来实现应用的流量复制](https://help.aliyun.com/document_detail/199593.html?spm=a2c4g.11186623.6.779.fa406da9URQGrf)