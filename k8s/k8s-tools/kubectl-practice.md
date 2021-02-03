


## 
+ `kubectl get pods --namespace=kube-system -l k8s-app=kube-dns` DNS pod是否运行
+ `kubectl get secret regcred --output=yaml` 导出yaml
+ `kubectl scale rc kubia --replicas=3`
+ `kubectl get pods -o wide`

+ variable
```sh
pods=$(kubectl get pods --selector=job-name=pi --output=jsonpath='{.items[*].metadata.name}')
echo $pods
kubectl logs $pods


 kubectl logs \
    $(kubectl get pod -l app=orgchart -o jsonpath="{.items[0].metadata.name}") \
    --container vault-agent
```

+ `docker exec -t $(docker ps -f name=blog-web_blog-web -q | head -1) curl 127.0.0.1/metrics | grep http_requests_received_total`
+ `export POD_NAME=$(kubectl get pods --namespace monitor -l "app=prometheus,component=server" -o jsonpath="{.items[0].metadata.name}")`

+ exec
    + `kubectl exec fortune-configmap-volume -c web-server ls /etc/nginx/conf.d`
    + `kubectl exec fortune-configmap-volume -c web-server cat /etc/nginx/conf.d/my-nginx-config.conf`


+ secret 解码
    - `kubectl get secret regcred --output="jsonpath={.data.\.dockerconfigjson}" | base64 --decode`

+ 查看容器环境变量??
    - `kubectl exec <pod name> env -n namespace`

+ 查询
    - `kb get po --all-namespaces| grep olm`