


## 
+ `kubectl get pods --namespace=kube-system -l k8s-app=kube-dns` DNS pod是否运行
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




+ 查看容器环境变量??
    - `kubectl exec <pod name> env -n namespace`

+ 查询
    - `kb get po --all-namespaces| grep olm`

+ template 中的name有hyphen时
    - `oc get secret logging-elasticsearch --template='{{index .data "admin-ca"}}' |base64 -d > ca`会报错
    - `oc get secret logging-elasticsearch --template='{{index .data "admin-ca"}}' |base64 -d > ca`


## secret 

+ secret 解码
    - `kubectl get secret regcred --output="jsonpath={.data.dockerconfigjson}" | base64 --decode`
    - `kubectl  get secret  $(kubectl  get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"`

+ `kubectl get secrets prometheus-user-workload -o 'go-template={{index .data "prometheus.yaml.gz"}}'`
  + key中包含点的处理

+ `kubectl get secret argocd-secret  --output="jsonpath={.data['oidc\.keycloak\.clientSecret']}" -n argo | base64 -d`

+ `kubectl create secret generic additional-scrape-configs --from-file=prometheus-additional.yaml --dry-run -oyaml > additional-scrape-configs.yaml`
  + create secret from file

+ copy secret between different namespace
```sh
kubectl get secret <secret-name> \
  --namespace=<source-nemespace> \
  --export -o yaml | \
  kubectl apply --namespace=<new-namespace> -f -
```

## 动态语句
<!-- 根据name删除 -->
+ `kubectl delete pod $(kubectl get pods -n hsc-logging | grep dashboard |  awk '{ print $1 }') -n hsc-logging`


<!-- 变量赋值,jsonpath -->
+ `export VAULT_SA_NAME=$(kubectl -n default get sa vault-auth -o jsonpath="{.secrets[*]['name']}")`
+ `export SA_JWT_TOKEN=$(kubectl -n default get secret $VAULT_SA_NAME -o jsonpath="{.data.token}" | base64 --decode; echo)`
+ `export SA_CA_CRT=$(kubectl -n default get secret $VAULT_SA_NAME -o jsonpath="{.data['ca\.crt']}" | base64 --decode; echo)`
  + dot 转义

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


+ kubectl apply -n default -f - <<EOT
apiVersion: v1
kind: ResourceQuota
metadata:
  name: mem-cpu-demo
spec:
  hard:
    requests.cpu: "1"
    requests.memory: 1Gi
    limits.cpu: "2"
    limits.memory: 2Gi
EOT


+ cat kubectl apply
```yaml
cat <<EOF | kubectl apply -f -
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: developer
spec:
  ...
  signerName: kubernetes.io/kube-apiserver-client
  usages:
  - client auth
EOF
```

## patch

+ `kubectl patch deployment/nginx-deployment --patch "$(cat patch.yaml)"`


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


## init container

```yaml
# use init container to modify configmap
  extraInitContainers:
    - name: init
      image: registry.kubeoperator.io:8083/bitnami/kubectl:latest
      command: ['sh','-c','SECRET=$(kubectl -n keycloak get secret/opensearch-client-secret -o jsonpath="{.data.client_secret}" | base64 --decode; echo);kubectl get configmap/logging-opensearch-dashboards-config -n logging -o yaml | sed "s/{client_secret}/$SECRET/" | kubectl -n logging apply -f -']
  
```

## kubeconfig

+ `... --kubeconfig {{ kubeconfig }}`

## jsonpath

+ `kubectl get svc istio-ingressgateway -n istio-system -o jsonpath="{.status.loadBalancer.ingress[0].ip}"`


## file output
+ `kubectl exec -it busy-box-558d7bfbcb-7kjcg -n istio-system -- cat /etc/myca/ca-cert.pem > ca-cert.pem`

## ref

+ [使用 kubectl 管理 Secret](https://kubernetes.io/zh/docs/tasks/configmap-secret/managing-secret-using-kubectl/)
+ [JSONPath 支持](https://kubernetes.io/zh/docs/reference/kubectl/jsonpath/)