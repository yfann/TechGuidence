
## issues
+ `kubectl logs po/backend-app-678598cd5b-vfzws`
    + `Error from server: Get "https://10.0.2.15:10250/containerLogs/default/backend-app-678598cd5b-vfzws/backend": EOF`
<!-- debbug -->
+ `curl -v https://10.0.2.15:10250/containerLogs`


## ref
+ [k3s kubectl logs pod failed behind proxy](https://github.com/k3s-io/k3s/issues/5712)