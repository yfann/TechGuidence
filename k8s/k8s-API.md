
## cmd
+ `kubectl cluster-info`
+ `kubectl get apiservices`
+ `kubectl api-versions`
+ `kubectl api-resources`
+ `kubectl proxy`
    + `curl http://localhost:8001/api/v1`

## details
<!-- core api resources:pods,services... -->
+ /api/v1   
<!-- job resource-->
+ apis/batch/v1
<!-- name:jobs -->
   + /apis/batch/v1/jobs 
<!-- kubectl get job my-job -o json -->
   + `curl http://localhost:8001/apis/batch/v1/namespaces/default/jobs/my-job`
<!-- <group>/<version> -->
+ apps/v1beta2 

## pod中访问k8s API

+ POD中访问一个service
   + tutum/curl (带curl的image)
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: curl
spec:
  containers:
  - name: main
    image: tutum/curl                ❶
    command: ["sleep", "9999999"]    ❷
```
   - `kubectl exec -it curl bash`
   - `kubectl get svc` 查看kubernetes service
   - `env | grep KUBERNETES_SERVICE` pod中通过env查看kubernetes service
   - `curl https://kubernetes` DNS的方式访问（会有认证错误）
      - `curl https://kubernetes -k` 跳过认证

+ pod中通过CA和token访问k8s API

+ default-token-xyz
   + 每个container都会mount
   + container中：/var/run/secrets/kubernetes.io/serviceaccount/
   + `ls /var/run/secrets/kubernetes.io/serviceaccount/`
      + `ca.crt    namespace    token`
   + `curl --cacert /var/run/secrets/kubernetes.io/serviceaccount/ca.crt https://kubernetes`
   + `export CURL_CA_BUNDLE=/var/run/secrets/kubernetes.io/serviceaccount/ca.crt` 把证书加入环境变量
      - `curl https://kubernetes`
   + Unauthorized
      + `TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)`
         + `curl -H "Authorization: Bearer $TOKEN" https://kubernetes`
   + disable RBAC
      + `kubectl create clusterrolebinding permissive-binding --clusterrole=cluster-admin --group=system:serviceaccounts`
         - 给所有service accounts  cluster-admin权限

+ practice
   + `NS=$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace)`
   + `curl -H "Authorization: Bearer $TOKEN" https://kubernetes/api/v1/namespaces/$NS/pods`


## ambassador container pattern
+ one pod contains
   + main container
      + connect to the ambassador throught HTTP
         + localhost:port to ambassador
   + ambassador container
      + handle the HTTPS connection to the API server
      + using the default token's secret volume
      + kubectl-proxy
+ yaml
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: curl-with-ambassador
spec:
  containers:
  - name: main
    image: tutum/curl
    command: ["sleep", "9999999"]
  - name: ambassador                         ❶
    image: luksa/kubectl-proxy:1.6.2         ❶

```

+ process
   + `kubectl exec -it curl-with-ambassador -c main bash`
   <!-- kubectl proxy----port 8001 -->
   + main:`curl localhost:8001`
      + ambassador:`https://kubernetes:443`


## client libraries to API server

## ref
+ [Kubernetes API Overview](https://kubernetes.io/docs/reference/using-api/api-overview/)
+ [Kubernetes API Reference v1.19](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.19/)
+ [Reference](https://kubernetes.io/docs/reference/)
<!-- client libraries -->
+ [Golang client](https://github.com/kubernetes/client-go)
+ [Python client](https://github.com/kubernetes-incubator/client-python)
+ [Special Interest Groups (SIGs)](https://github.com/kubernetes/community/blob/master/sig-list.md.)

+ CA authentication