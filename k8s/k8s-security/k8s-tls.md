
## tips
+ API server
    + --tls-cert-file
        + CA certificate
            + signed using a private certificate authority
                + you need a copy of that CA certificate configured into your ~/.kube/config
    + --tls-private-key-file

## ref
+ [管理集群中的 TLS 认证](https://kubernetes.io/zh/docs/tasks/tls/managing-tls-in-a-cluster/)
+ [Providing sensitive data to pods](https://docs.openshift.com/container-platform/4.1/nodes/pods/nodes-pods-secrets.html)