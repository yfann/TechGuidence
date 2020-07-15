


## 
+ `kubectl get pods --namespace=kube-system -l k8s-app=kube-dns` DNS pod是否运行
+ `kubectl get secret regcred --output=yaml` 导出yaml
    - `kubectl get secret regcred --output="jsonpath={.data.\.dockerconfigjson}" | base64 --decode` base64解码