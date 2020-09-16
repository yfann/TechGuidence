


## 
+ `kubectl get pods --namespace=kube-system -l k8s-app=kube-dns` DNS pod是否运行
+ `kubectl get secret regcred --output=yaml` 导出yaml
    - `kubectl get secret regcred --output="jsonpath={.data.\.dockerconfigjson}" | base64 --decode` base64解码
+ `kubectl scale rc kubia --replicas=3`
+ `kubectl get pods -o wide`

+ variable
```sh
pods=$(kubectl get pods --selector=job-name=pi --output=jsonpath='{.items[*].metadata.name}')
echo $pods
kubectl logs $pods
```



+ `docker exec -t $(docker ps -f name=blog-web_blog-web -q | head -1) curl 127.0.0.1/metrics | grep http_requests_received_total`
+ `export POD_NAME=$(kubectl get pods --namespace monitor -l "app=prometheus,component=server" -o jsonpath="{.items[0].metadata.name}")`
