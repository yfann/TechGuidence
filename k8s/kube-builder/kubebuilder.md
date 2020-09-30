

## install 
+ brew install kustomize
+ kubebuilder
```sh
os=$(go env GOOS)
arch=$(go env GOARCH)
curl -L https://go.kubebuilder.io/dl/2.3.1/${os}/${arch} | tar -xz -C /tmp/
```


## create project

+ `go mod init xxx`
+ `kubebuilder init --domain vcap.domain`
+ `kubebuilder create api --group hsc.philips.com --version v1 --kind VcapServicesConverter`
+ `make install` generate CRD and install CRD to k8s(proxy,mac verification->mac ->security&privacy->General->allow apps download from ...) 
    + `make` generate CRD
+ `make run ENABLE_WEBHOOKS=false` running webhooks locally needs to generate certificate for the webhooks`/tmp/k8s-webhook-server/serving-certs/tls.{crt,key}` and proxy traffic from remote cluster to your local webhook server
+ `kubectl create -f config/samples/xxx.yaml`
+ `make docker-build docker-push IMG=<some-registry>/<project-name>:tag`
+ `make deploy IMG=<some-registry>/<project-name>:tag`


## cmd
+ `controller-gen -h`
    + `controller-gen -hhh`
+ `make manifests` generates CRD under `config/crd/bases` also webhook,RBAC
+ `make generate` generate code


## controller tool
+ object generator
+ controller-gen


## controller-runtime
+ controller manager
    + reconciler注册到manager
    + manager watching for changes to the obj
    + caching retrieved obj
    + queuing and rate limiting reconciliations
    + call registered reconciler
    + run controllers and webhooks
    + setting up shared cache and clients, managing leader election

+ controllers
    +  events->reconcile requests

+ reconcilers
    + controler logic
    + take reconcile request(name,namespace of the object)

+ clients
    + use by reconciler
    + write object to API objects
+ cache
    + read object

## ref
+ [kuberbuilder](https://book.kubebuilder.io/introduction.html)
+ [kubernetes-sigs/kubebuilder](https://github.com/kubernetes-sigs/kubebuilder)
+ [利用 kubebuilder 优化 Kubernetes Operator 开发体验](https://zhuanlan.zhihu.com/p/67406200)
+ [《 Kubebuilder v2 使用指南 》-P3-认识Kubebuilder](https://blog.csdn.net/ywq935/article/details/106311583)


<!-- controller runtime -->
+ [controller-runtime](https://godoc.org/sigs.k8s.io/controller-runtime)
+ [kubernetes-sigs/controller-runtime](https://github.com/kubernetes-sigs/controller-runtime)
+ [controller-runtime/FAQ.md](https://github.com/kubernetes-sigs/controller-runtime/blob/master/FAQ.md)


<!-- sample -->
+ [cronjob-tutorial](https://github.com/kubernetes-sigs/kubebuilder/tree/master/docs/book/src/cronjob-tutorial/testdata/project)


<!-- libs -->
+ [Scheme](https://godoc.org/k8s.io/apimachinery/pkg/runtime#Scheme)
+ [Manager](https://godoc.org/sigs.k8s.io/controller-runtime/pkg/manager#Manager)
+ [reconciler](https://godoc.org/sigs.k8s.io/controller-runtime/pkg/reconcile)
+ [context](https://golang.org/pkg/context/)
+ [logr](https://github.com/go-logr/logr)


<!-- markers -->
+ [Markers for Config/Code Generation](https://book.kubebuilder.io/reference/markers.html)
+ [kubebuilder:rbac](https://book.kubebuilder.io/reference/markers/rbac.html)
+ [package markers](https://godoc.org/sigs.k8s.io/controller-tools/pkg/markers)

<!-- controller-gen for building controller -->
+ [controller-tools](https://github.com/kubernetes-sigs/controller-tools)
+ [controller-gen CLI](https://book.kubebuilder.io/reference/controller-gen.html)

***

<!-- dependency -->
+ [kubernetes-sigs/kustomize](https://github.com/kubernetes-sigs/kustomize)
+ [install kustomize](https://kubernetes-sigs.github.io/kustomize/installation/homebrew/)


<!-- cert manager -->
+ [Deploying the cert manager](https://book.kubebuilder.io/cronjob-tutorial/cert-manager.html#deploying-the-cert-manager)
+ [cert-manager ](https://cert-manager.io/docs/installation/kubernetes/)


<!-- test -->
+ [fake](https://godoc.org/sigs.k8s.io/controller-runtime/pkg/client/fake)
+ [envtest](https://godoc.org/sigs.k8s.io/controller-runtime/pkg/envtest#Environment)
+ [How we built a controller using KubeBuilder with test-driven development, Part 2](https://engineering.pivotal.io/post/gp4k-kubebuilder-tdd/)

<!-- webhook -->
+ [使用 Kubebuilder 创建自定义 K8s AdmissionWebhooks](https://blog.hdls.me/15708754600835.html)