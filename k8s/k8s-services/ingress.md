
# Ingress
+ 提供集群外访问url

+ 反向代理规则，HTTP/HTTPS转发到哪个service上
    + 通过url关联service

+ Ingress Controller
    + 反向代理

+ ingress ---> service ---------> pod

+ ingress port
    + 80
    + 443

## cmd
+ `curl <ingress domain>/<path>`
+ `kubectl -n kube-system get pod | grep nginx-ingress-controller`


## ali cloud ingress

+ 容器服务
    + 应用目录
        + ack-ingress-nginx
            + 自动创建LoadBalancer service

+ 创建的ingress address会和ingress controller的service一致（external-ip）


## deploy to k8s
+ `helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx`
+ `helm repo update`
+ `helm install ingress-nginx ingress-nginx/ingress-nginx`

## tips
+ multiple ingress controller
    + 创建ingress时可以通过`kubernetes.io/ingress.class: "nginx"`指定ingress controller
        + nginx是默认标识

+ `--default-ssl-certificate`
    + 指定默认的证书
        + tls:部分没有secretName时可以使用

+ `externalTrafficPolicy: Cluster`
    + ali ingress service的配置
        + `local`只能同节点访问ingress
        
## ref
+ [ingress](https://feisky.gitbooks.io/kubernetes/content/concepts/ingress.html)
+ [Ingress k8s](https://kubernetes.io/zh/docs/concepts/services-networking/ingress/)
+ [NGINX Ingress Controller](https://kubernetes.github.io/ingress-nginx/user-guide/multiple-ingress/)

<!-- deploy nginx-ingress controller -->
+ [Installation Guide](https://kubernetes.github.io/ingress-nginx/deploy/)
<!-- image -->
+ [kubernetes/ingress-nginx](https://github.com/kubernetes/ingress-nginx/releases)

<!-- ali cloud -->
+ [Ingress概述](https://help.aliyun.com/document_detail/198892.html?spm=a2c4g.11186623.6.768.2f19528eZdYgs4)
+ [部署Ingress Controller使用私网SLB](https://help.aliyun.com/document_detail/151506.html)
+ [部署高可靠Ingress Controller](https://help.aliyun.com/document_detail/86750.html)
+ [通过Ingress Controller来实现应用的流量复制](https://help.aliyun.com/document_detail/199593.html?spm=a2c4g.11186623.6.779.fa406da9URQGrf)
+ [通过Annotation配置负载均衡](https://help.aliyun.com/document_detail/86531.html?spm=a2c4g.11174283.6.763.4a2f2ceecTgAiy)
+ [部署多个Ingress controller](https://help.aliyun.com/document_detail/151524.html)

<!-- nginx-ingress -->
+ [kubernetes/ingress-nginx](https://github.com/kubernetes/ingress-nginx/blob/master/docs/user-guide/nginx-configuration/annotations.md)


<!-- issue -->
+ [nginx ingress support http2](https://github.com/kubernetes/ingress-nginx/issues/3938)
    + nginx对http1.x和http2的支持在不同的port上
        + http2在443,需要打开TLS

<!-- gRPC -->
+ [gRPC](https://kubernetes.github.io/ingress-nginx/examples/grpc/#grpc)
+ [nginx-ingress test gRPC](https://github.com/kubernetes/ingress-nginx/tree/master/docs/examples/grpc)

<!-- TLS -->
+ [TLS certificates](https://github.com/kubernetes/ingress-nginx/blob/master/docs/examples/PREREQUISITES.md)
+ [TLS/HTTPS](https://kubernetes.github.io/ingress-nginx/user-guide/tls/)


<!-- issue -->
+ [ali ingress: connetion refused](https://segmentfault.com/a/1190000020751999)