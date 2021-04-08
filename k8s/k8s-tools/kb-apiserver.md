
## kubectl proxy
+ `kubectl proxy`
+ 查看所有api
    + http://127.0.0.1:8001/


## API & resources
+ `kubectl get apiservice`
+ `kubectl api-versions`
+ `kubectl api-resources`
    + `kubectl api-resources -o wide`
    + `kubectl api-resources --namespaced=false`查看不在命名空间中的资源
+ `kubectl cluster-info`
+ `kubectl proxy  [--port=8080]`  用代理访问kubernetes API
    + `curl http://localhost:8080/api/`
+ `kubectl explain <k8s obj>`
    - `kubectl explain pods`  
        + `kubectl explain pods.spec` 

## debug
+ `kb get --raw /apis/networking.k8s.io/v1`