# Pod uses env or volume to get data




## tips

+ `kubectl exec -it [podname] -- sh` 看不到启动Pod时source的环境变量
    + 进入时相当于开启新的shell(没有source环境变量)


## ref
+ [Using environment files over injected environment variables in Kubernetes](https://mglaman.dev/blog/using-environment-files-over-injected-environment-variables-kubernetes)
    + mount secret to pod
    + mount configMap to pod
    + env from configmap

<!-- env -->
+ [EnvVarSource](https://v1-16.docs.kubernetes.io/docs/reference/generated/kubernetes-api/v1.16/#envvarsource-v1-core)
<!-- volumn -->
+ [Configure a Pod to Use a Volume for Storage](https://kubernetes.io/docs/tasks/configure-pod-container/configure-volume-storage/)


<!-- secret -->
+ [使用 Secret 安全地分发凭证](https://kubernetes.io/zh/docs/tasks/inject-data-application/distribute-credentials-secure/)


<!-- sample -->
+ [Using Kubernetes ConfigMap Resources for Dynamic Apps](https://medium.com/capital-one-tech/using-kubernetes-configmap-resources-for-dynamic-apps-9e23ef589121)
    + go read mount path for configmap