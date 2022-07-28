
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
    + is a reverse proxy server to authenticate users using OIDC to Kubernetes API servers where OIDC authentication is not available (i.e. managed Kubernetes providers such as GKE, EKS, etc).

## ref
+ [Kubernetes 单点登录详解](https://blog.fleeto.us/post/sso-kubernetes-guide/)

+ [kube-oidc-proxy](https://github.com/jetstack/kube-oidc-proxy)
+ [使用 Kube-OIDC-Proxy 跨多个 EKS 集群进行一致的 OIDC 身份验证](https://aws.amazon.com/cn/blogs/china/consistent-oidc-authentication-across-multiple-eks-clusters-using-kube-oidc-proxy/)

<!-- normal user auth -->
+ [Kubectl Login: Solving Authentication For Kubernetes](https://loft.sh/blog/kubectl-login-solving-authentication-for-kubernetes/)
+ [int128/kubelogin](https://github.com/int128/kubelogin)