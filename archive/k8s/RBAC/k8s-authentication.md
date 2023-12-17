

# kubernetes Authentication

+ k8s user
  + service account(in cluster)
  + normal user(outside the cluster)
      + k8s外部产生，不能被k8s api添加
      + 与k8s关联
          + 被cluster's certificate authority (CA) 签名的证书
                  + user name is from common name(`"/CN=bob"`) in `subject` of cert
                      + RBAC会确定用户是否有权访问资源

+ process(kubectl,kubelet...) call k8s api 时的身份
    + normal user
    + service account
    + anonymous request

## service account
+ Kubernetes API管理和创建Service account
+ bound to specific namespaces
+ service account通过Admission Controller关联pod
+ secret
    + 创建serviceaccount时会创建相应的secret
    + seret包含
        + API server的pulibc CA
        + JWT(bearer token)
    + secret mounted into pods
    + 可在k8s集群外使用
+ system:serviceaccount:(NAMESPACE):(SERVICEACCOUNT)
    + system:serviceaccounts
    + system:serviceaccounts:(NAMESPACE)
+ 许多附加组件 add-ons 目前在 kube-system 命名空间以 "default" 服务账号运行.要允许这些附加组件以超级用户权限运行，需要将集群的 cluster-admin 权限授予 kube-system 命名空间中的 "default" 服务账号。



## Authentication strategies 

+ authentication modules
  + certificates
  + password
  + plain tokens
  + bootstrap tokens
  + JSON web tokens
    + for service accounts

+ ways of authenticating API requests through authentication plugins
    + client certificate
    + bearer token
    + authenticating proxy


+ request to k8s api
    + Username
        + kube-admin
        + the user is authenticated as a specific username
        + Kubernetes uses usernames for access control decisions
    + UID
    + Groups
        + system:masters
        + some authenticators also provide the group memberships of the user, while other authenticators do not.
    + Extra fields

+ authentication methods
    + service account token
        + 为service account提供认证
    + others
        + for user authentication

+ `authenticating proxy` or `authentication webhook`
    + 可以集成其他认证协议
        + LDAP
        + SAML
        + X509
        + Kerberos

## authentication methods
<!-- X509 Client Certs -->
+ `--client-ca-file=SOMEFILE` API server启用Client certificate authentication
  + file中需包含可以验证client certificate的CA
  + verified client certificate
    + the `common name` of the subject 
      + as `user name`
    + certificate's `organization fields`(multiple)
      + as `group`
+ `openssl req -new -key jbeda.pem -out jbeda-csr.pem -subj "/CN=jbeda/O=app1/O=app2"`
  + penssl command line tool to generate a certificate signing request
  + `username`
    + jbeba
  + `groups`
    + app1
    + app2

<!-- static token file -->
+ `--token-auth-file=SOMEFILE` 
  + The API server reads bearer tokens from a file 
  + token一直存在直到重启API server
  + files
    + csv
      + token,user,uid,"group1,group2,group3"

<!-- Putting a Bearer Token in a Request  -->
+ `Authorization:Bearer <token>`

<!-- Bootstrap Tokens -->
+ 为了支持平滑地启动引导新的集群
  + 可以被kubeadm使用

+ dynamically-managed Bearer token 
  + tokens are stored as Secrets in `kube-system`

+ Controller Manager
  + TokenCleaner controller
    + 删除过期的bootstrap tokens

+ bootstrap token
  + `[a-z0-9]{6}.[a-z0-9]{16}`
    + `Authorization: Bearer 781292.db7bc3a58fc5f07e`
    + {token id}.{token secret}

+ `--enable-bootstrap-token-auth` API server启用bootstrap token
+ `--controllers=*,tokencleaner` Controller Manager启用TokenCleaner controller

+ `system:bootstrap:<Token ID>`
  + 认证结果
  + `system:bootstrappers` group

<!-- Service Account Tokens -->
+ 自动启动  
  + uses `signed bearer tokens` to verify requests
+ `--service-account-key-file`
  + A file containing a PEM encoded key for signing bearer tokens. 
  + If unspecified, the API server's TLS private key will be used.
+ `--service-account-lookup` 从 API 删除的令牌会被回收 
+ Service acount通过`ServiceAccount Admission Controller`关联到pod
+ Service account bearer tokens 
    + mount 在Pod中
      +  /var/run/secrets/kubernetes.io/serviceaccount/token
    + Pod中的进程访问API server时会用到
    + 也可以集群外使用
    + sa secret
      + public CA of the API server 
      + a signed JSON Web Token (JWT)
        + 可以用`Authorization:Bearer <token>`的形式重集群外访问
```yaml
# sa的secret
ca.crt: (APISERVER'S CA BASE64 ENCODED)
token: (BEARER TOKEN BASE64 ENCODED)
```

+ `system:serviceaccount:(NAMESPACE):(SERVICEACCOUNT)`
  + groups
    + `system:serviceaccounts`
    + `system:serviceaccounts:(NAMESPACE)`

<!-- OpenID Connect Tokens -->
+ user需要先从identity provider获取
  + access_token
  + id_token
  + refresh_token

+ id_token
    + `kubectl --token <id_token>`
      + 或把id_token加入到kubeconfig中
    + 不可被回收(revoke)，每隔几分钟就要重新获取
    + 作为bearer token(token response)访问API server

+ 访问k8s dashboard时
  + 需要kubectl proxy
  + 或能注入id_token的reverse proxy

+ OpenID Connect Identity Provider
  + k8s本身不提供
  + 可以使用已经存在的Identity Provider
  + 或者部署自己的identity provider
    + such as 
      + keycloak
      + dex
    + must support:
      + support OpenID connect discovery
      + TLS
      + Have a CA signed certificate(even if the CA is not a commercial CA or is self signed)


## ref
<!-- authentication -->
+ [Controlling Access to the Kubernetes API](https://kubernetes.io/docs/concepts/security/controlling-access/)
+ [Authenticating](https://kubernetes.io/docs/reference/access-authn-authz/authentication/)
+ [normal user 通过certificate绑定role](https://kubernetes.io/zh-cn/docs/reference/access-authn-authz/certificate-signing-requests/#normal-user)

<!-- auth method -->
+ [Generate Certificates Manually](https://kubernetes.io/docs/tasks/administer-cluster/certificates/)
+ [Authenticating with Bootstrap Tokens](https://kubernetes.io/docs/reference/access-authn-authz/bootstrap-tokens/)
+ [OpenID Connect](https://openid.net/connect/)


<!-- config -->
+ [config api server](https://kubernetes.io/docs/reference/access-authn-authz/authentication/#configuring-the-api-server)


<!-- service account -->
+ [为 Pod 配置服务账户](https://kubernetes.io/zh-cn/docs/tasks/configure-pod-container/configure-service-account/)
+ [管理 Service Accounts](https://kubernetes.io/zh/docs/reference/access-authn-authz/service-accounts-admin/)