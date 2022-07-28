
## Kube-OIDC-Proxy



## tools
+ Cert-Manager
    + 证书管理，请求更新k8s中的TLS cert

+ Dex
    + OIDC provider

+ Gangway
    + OIDC token -> kubeconfigs

+ Contour
    + Envoy指定入口控制器，防止未加密流量在集群中流动

+ kube-OIDC-Proxy
    + 开源反向代理，为后端(api server)开启OIDC身份认证

## ref
+ [Kubernetes 单点登录详解](https://zhuanlan.zhihu.com/p/547149617)

+ [kube-oidc-proxy](https://github.com/jetstack/kube-oidc-proxy)
+ [使用 Kube-OIDC-Proxy 跨多个 EKS 集群进行一致的 OIDC 身份验证](https://aws.amazon.com/cn/blogs/china/consistent-oidc-authentication-across-multiple-eks-clusters-using-kube-oidc-proxy/)