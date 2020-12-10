

## mac install 
+ brew install kustomize
+ kubebuilder
```sh
os=$(go env GOOS)
arch=$(go env GOARCH)
curl -L https://go.kubebuilder.io/dl/2.3.1/${os}/${arch} | tar -xz -C /tmp/
```

## linux install
+ download https://raw.githubusercontent.com/\
kubernetes-sigs/kustomize/master/hack/install_kustomize.sh
+ chmod +x ./install_kustomize.sh 
+ sudo mv kustomize /usr/local/bin
+ curl -L https://go.kubebuilder.io/dl/2.3.1/linux/amd64 | tar -xz -C /tmp/

## create project

+ `go mod init xxx`
+ `kubebuilder init --domain vcap.domain`
+ `kubebuilder create api --group hsc.philips.com --version v1 --kind VcapServicesConverter`

+ `make install` generate CRD and install CRD to k8s(mac的环境配置proxy,mac verification->mac ->security&privacy->General->allow apps download from ...) 
    + `make` generate CRD
<!-- under project dir -->
+ `make uninstall`

+ `make run ENABLE_WEBHOOKS=false` running webhooks locally needs to generate certificate for the webhooks`/tmp/k8s-webhook-server/serving-certs/tls.{crt,key}` and proxy traffic from remote cluster to your local webhook server

+ `kubectl create -f config/samples/xxx.yaml`
<!-- docker build -->
+ `make docker-build docker-push IMG=<some-registry>/<project-name>:tag`
    + `make docker-build IMG=<project-name>:tag`
+ `make deploy IMG=<some-registry>/<project-name>:tag`


## cmd
+ `controller-gen -h`
    + `controller-gen -hhh`
+ `make manifests` generates CRD under `config/crd/bases` also webhook,RBAC
+ `make generate` generate code


## controller tool
+ object generator
+ controller-gen

## concept
+ GVK(GroupVersionKind)
    + 创建GVR，一般1：1
    + scale kind 可能会1:n
+ GVR(GroupVersionResource)
+ Scheme
    + 提供GVK与go type的映射

+ reconcile
    + controler logic
    + take reconcile request(name,namespace of the object)
```go
for {
actualState := GetResourceActualState(rsvc)
expectState := GetResourceExpectState(rsvc)
if actualState == expectState {
// do nothing
} else {
Reconcile(rsvc)
}
}
```
+ manager
    + 运行controller
    + 初始化cache,listAndWatch
    + 初始化clients
    + reconciler注册到manager
    + manager watching for changes to the obj
    + caching retrieved obj
    + queuing and rate limiting reconciliations
    + call registered reconciler
    + run controllers and webhooks
    + setting up shared cache and clients, managing leader election

+ controllers
    +  events->reconcile requests
    + 只需关注reconcile的实现

+ clients
    + use by reconciler
    + write object to API objects
+ cache
    + read object
    + GVK -> Informer 映射
    + 监听对GVR的更改,触发reconcile
    + index提供索引

+ Finalizer
    + 不为空时可以在cache中获取要删除的对象
    + 处理完后设置为空,可以删除对象
+ OwnerReference
    + 删除对象时，会把OwnerReference是该对象的对象一并删除

## debug

+ 需要先安装对应的crd

## tips

+ schema
    + 注册schema后，cache才会为schema中的每个GVK创建对应的informer
```go
// main中注册对应GV的Scheme可以获取对应的GVK
// v1beta1.ServiceInstance
_ = v1beta1.AddToScheme(scheme)
```

+ watch(A watch indicates that Kubernetes should invoke this controller when changes to the “watched” resources occur.)
```go
// watch defined type
err = c.Watch(&source.Kind{Type: &examplev1.VisitorsApp{}},
              &handler.EnqueueRequestForObject{})
if err != nil {
    return err
}
// watch child type 
err = c.Watch(&source.Kind{Type: &appsv1.Deployment{}},
              &handler.EnqueueRequestForOwner{
    IsController: true,
    OwnerType:    &examplev1.VisitorsApp{},
})
if err != nil {
    return err
}
```

## ref
+ [深入解析 Kubebuilder：让编写 CRD 变得更简单****************](https://juejin.im/post/6844903952241131534)
+ [kuberbuilder****************](https://book.kubebuilder.io/introduction.html)


+ [kubernetes-sigs/kubebuilder](https://github.com/kubernetes-sigs/kubebuilder/blob/master/docs/book/getting_started/hello_world.md)
+ [利用 kubebuilder 优化 Kubernetes Operator 开发体验](https://zhuanlan.zhihu.com/p/67406200)
+ [《 KUBEBUILDER V2 使用指南 》](https://blog.upweto.top/gitbooks/kubebuilder/)
+ [yinwenqin/kubeSourceCodeNote](https://github.com/yinwenqin/kubeSourceCodeNote/tree/master/controller)

<!-- controller runtime -->
+ [controller-runtime](https://godoc.org/sigs.k8s.io/controller-runtime)
+ [kubernetes-sigs/controller-runtime](https://github.com/kubernetes-sigs/controller-runtime)
+ [controller-runtime/FAQ.md](https://github.com/kubernetes-sigs/controller-runtime/blob/master/FAQ.md)


<!-- sample -->
+ [cronjob-tutorial](https://github.com/kubernetes-sigs/kubebuilder/tree/master/docs/book/src/cronjob-tutorial/testdata/project)
+ [Controller Example](https://book-v1.book.kubebuilder.io/basics/simple_controller.html)

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