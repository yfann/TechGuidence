


## cmd

+ `kubectl kustomize <kustomization_directory>`
    + 根据在kustomizeconfig.yaml中的generator生成 resource yaml文件
    + 查看资源
+ `kubectl apply -k <kustomization_directory>` 
+ `kubectl get -k <kustomization_directory>`
+ `kubectl delete -k ./`


## tips
+ <kustomization_directory> 包含kustomizeconfig.yaml的文件夹
+ ustomize is a tool for customizing Kubernetes configurations


## ref

+ [kustomize](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/kustomization/)
+ [kubernetes-sigs/kustomize](https://github.com/kubernetes-sigs/kustomize)