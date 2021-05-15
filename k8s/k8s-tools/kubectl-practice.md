


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

+ template 中的name有hyphen时
    - `oc get secret logging-elasticsearch --template='{{index .data "admin-ca"}}' |base64 -d > ca`会报错
    - `oc get secret logging-elasticsearch --template='{{index .data "admin-ca"}}' |base64 -d > ca`

## 动态语句

export VAULT_SA_NAME=$(kubectl -n default get sa vault-auth -o jsonpath="{.secrets[*]['name']}")
export SA_JWT_TOKEN=$(kubectl -n default get secret $VAULT_SA_NAME -o jsonpath="{.data.token}" | base64 --decode; echo)
export SA_CA_CRT=$(kubectl -n default get secret $VAULT_SA_NAME -o jsonpath="{.data['ca\.crt']}" | base64 --decode; echo)

vault write auth/kubernetes/config \
    token_reviewer_jwt="$SA_JWT_TOKEN" \
    kubernetes_host="https://$K8S_HOST" \
    kubernetes_ca_cert="$SA_CA_CRT"

echo "apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: demo
  annotations:
    kubernetes.io/ingress.class: kong
spec:
  rules:
  - http:
      paths:
      - path: /
        backend:
          serviceName: grpcbin
          servicePort: 9001" | kubectl apply -f -
ingress.extensions/demo created

## test service
+ `kb run nginx --image=nginx --replicas=2`
+ `kubectl expose deployment nginx --port=80`
    + `--type="NodePort"`
    + `--name="..."`
+ `kubectl run busybox --rm -ti --image=busybox /bin/sh`
    + `wget --spider --timeout=1 nginx`


<!-- search role binding -->
+ kubectl get rolebindings,clusterrolebindings \
  --all-namespaces  \
  -o custom-columns='KIND:kind,NAMESPACE:metadata.namespace,NAME:metadata.name,SERVICE_ACCOUNTS:subjects[?(@.kind=="ServiceAccount")].name' | grep "<SERVICE_ACCOUNT_NAME>"