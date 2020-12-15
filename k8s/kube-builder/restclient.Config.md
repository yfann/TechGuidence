# restclient.Config

+ `restclient.InClusterConfig()`
    + 通过环境变量和内置路径构建出config
    + KUBERNETES_SERVICE_HOST
    + KUBERNETES_SERVICE_PORT
    + "/var/run/secrets/kubernetes.io/serviceaccount/token"
    + "/var/run/secrets/kubernetes.io/serviceaccount/ca.crt"