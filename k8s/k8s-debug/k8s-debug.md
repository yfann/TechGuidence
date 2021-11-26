

## cmd

+ `kubectl version --short`
+ `kubectl cluster-info`
+ `kubectl get componentstatus`
+ `kubectl get --raw /apis/metrics.k8s.io/v1beta1/nodes`
    + ` kubectl get --raw /healthz?verbose`
+ `kubectl api-resources -o wide --sort-by name`
+ `kubectl get events -A`

+ `kubectl get nodes -o wide`
    + `kubectl get pods -o wide`

+ `kubectl run d –image alpine –command — /bin/sleep 1d`

## tips

+ docker k8s->local host
    - https://host.docker.internal/



## ref
+ [Debug Running Pods](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-running-pod/)