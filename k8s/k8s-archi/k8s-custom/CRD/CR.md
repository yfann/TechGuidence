# Custom Resource

## Discovery information

+ `kubectl get ats -v=7`
    + kubectl不知道ats
    + kubectl 查找  /apis discovery endpoint
    + kubectl 查找 /apis/group version discovery endpoint
    + The discovery endpoints provide all the necessary information,把ats转化为
        + group(cnat.programming-kubernetes.info)
        + version(v1alpha1)
        + resource(ats)
    + 以上为RESTMapper 的逻辑
+ kubectl CLI（~/.kubectl） 缓存了discovery information,每10min更新

+ apiextensions-apiserver
    + request handler
        + validation

## access
+ Dynamic Client(client-go)
+ controller-runtime client(Operator sdk,kubebuilder)
+ client-gen generated(as  k8s.io/client-go/kubernetes)