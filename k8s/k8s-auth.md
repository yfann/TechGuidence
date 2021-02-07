

# kubernetes Auth
+ users
    + service account
    + normal user

+ API request authenticate 
    + normal user
    + service account
    + anonymous reqeust

## service account
+ Kubernetes API管理和创建Service account
+ bound to specific namespaces
+ service account通过Admission Controller关联pod
```yaml

apiVersion: apps/v1 # this apiVersion is relevant as of Kubernetes 1.9
kind: Deployment
metadata:
  name: nginx-deployment
  namespace: default
spec:
  replicas: 3
  template:
    metadata:
    # ...
    spec:
      serviceAccountName: bob-the-bot
      containers:
      - name: nginx
        image: nginx:1.14.2
```
+ `kubectl create serviceaccount <name>`
+ `kubectl get serviceaccounts <name> -o yaml` 查看相应的secret

+ secret
    + 创建serviceaccount时会创建相应的secret
    + seret包含
        + API server的pulibc CA
        + JWT(bearer token)
    + secret mounted into pods
    + 可在k8s集群外使用
```yaml
apiVersion: v1
data:
  ca.crt: (APISERVER'S CA BASE64 ENCODED)
  namespace: ZGVmYXVsdA==
  token: (BEARER TOKEN BASE64 ENCODED)
kind: Secret
metadata:
  # ...
type: kubernetes.io/service-account-token
```

+ system:serviceaccount:(NAMESPACE):(SERVICEACCOUNT)
    + system:serviceaccounts
    + system:serviceaccounts:(NAMESPACE)

## Service Account Tokens
+ `--service-account-key-file`
+ `--service-account-lookup` token从API删除时会被revok
+ bearer token
    + mount 在Pod中
      +  /var/run/secrets/kubernetes.io/serviceaccount/token
    + Pod中的进程访问API server时会用到


## OpenID Connect Tokens
+ OpenID connect
    + OAuth2 suppored

+ ID token
    + returned by OAuth2 providers
    + JWT
    + 作为bearer token(token response)访问API server

## tips
+ cluster's certificate authority (CA)
+ role based access control (RBAC)
+ enable Client certificate authentication
    + `--client-ca-file=SOMEFILE` 启动API server时传入

+ 命令行从文件中读取bear token
    + `--token-auth-file=SOMEFILE`
    + tokens last indefinitely
    + the token list cannot be changed without restarting API server
    + token file is a csv
        + token,user,uid,"group1,group2,group3"

+ Bootstrap Tokens

## ref
+ [Authorization Overview](https://kubernetes.io/docs/reference/access-authn-authz/authorization/)
+ [Authenticating](https://kubernetes.io/docs/reference/access-authn-authz/authentication/)


+ [normal user](https://kubernetes.io/docs/reference/access-authn-authz/certificate-signing-requests/#normal-user)
+ [Certificates](https://kubernetes.io/docs/concepts/cluster-administration/certificates/)
+ [Admission Controllers](https://kubernetes.io/docs/reference/access-authn-authz/admission-controllers/)

<!-- Open ID -->
+ [OpenID Connect](https://openid.net/connect/)