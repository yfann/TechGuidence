

## install 
```sh
os=$(go env GOOS)
arch=$(go env GOARCH)
curl -L https://go.kubebuilder.io/dl/2.3.1/${os}/${arch} | tar -xz -C /tmp/
```

## ref
+ [kuberbuilder](https://book.kubebuilder.io/introduction.html)
+ [kubernetes-sigs/kubebuilder](https://github.com/kubernetes-sigs/kubebuilder)
+ [利用 kubebuilder 优化 Kubernetes Operator 开发体验](https://zhuanlan.zhihu.com/p/67406200)

<!-- sample -->
+ [cronjob-tutorial](https://github.com/kubernetes-sigs/kubebuilder/tree/master/docs/book/src/cronjob-tutorial/testdata/project)

<!-- libs -->
+ [controller-runtime](https://godoc.org/sigs.k8s.io/controller-runtime)
+ [Scheme](https://godoc.org/k8s.io/apimachinery/pkg/runtime#Scheme)
+ [Manager](https://godoc.org/sigs.k8s.io/controller-runtime/pkg/manager#Manager)
<!-- dependency -->
+ [kubernetes-sigs/kustomize](https://github.com/kubernetes-sigs/kustomize)