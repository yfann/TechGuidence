## install
+ `brew install operator-sdk`


## cmd

+ `operator-sdk init --domain=example.com --repo=github.com/example-inc/memcached-operator`
    + 会生成go.mod
    + --repo=<path>(如果项目在$GOPATH/src之外，则参数是必要的的)
+ `operator-sdk create api --group ship --version v1beta1 --kind Frigate`


<!-- make -->
+ `make docker-build docker-push IMG=<some-registry>/<project-name>:<tag>` build push镜像
+ `make install` install CRD to k8s(kubectl apply)
+ `make deploy IMG=<some-registry>/<project-name>:<tag>` 安装镜像到k8s
+ `make run ENABLE_WEBHOOKS=false` locally run 
        + 根据 ~/.kube/config 关联k8s

+ `make generate` 修改*_types.go后运行，用于更新 generated code
    + 调用controller-gen 更新zz_generated.deepcopy.go,确保Go type实现了runtime.Object
+ `make manifests` 更新crd,各种yaml
    + config/crd/bases/....yaml


<!-- Uninstall the operator and its CRDs: -->
+ `kustomize build config/default | kubectl delete -f -` 




## debug
+ `kubectl apply -f deploy/crds/*_crd.yaml` Deploy CRD
+ `export OPERATOR_NAME=<operator-name>`Start the Operator in local mode
    + `operator-sdk up local --namespace default`
+ `kubectl apply -f deploy/crds/*_cr.yaml` Deploy an example resource

## tips
+ `--type=helm`
+ `--helm-chart`
+ `--helm-chart-repo`
+ `--helm-chart-version`



## running Helm Operator outside of the cluster

+ `cp watches.yaml local-watches.yaml`  更改path的路径
+ `kubectl apply -f deploy/crds/*_crd.yaml`
+ `operator-sdk up local --watches-file ./local-watches.yaml`

## ref
+ [operator framework](https://sdk.operatorframework.io/docs/)
+ [Operator 模式](https://kubernetes.io/zh/docs/concepts/extend-kubernetes/operator/)
+ [什么是 Kubernetes Operator](https://www.redhat.com/zh/topics/containers/what-is-a-kubernetes-operator)
+ [Kubernetes Operator 快速入门教程](https://www.qikqiak.com/post/k8s-operator-101/)
+ [Introducing Operators: Putting Operational Knowledge into Software](https://coreos.com/blog/introducing-operators.html)
+ [What is the difference between kubebuilder and operator-sdk](https://github.com/operator-framework/operator-sdk/issues/1758)


<!-- details -->
+ [Control Loop](https://kubernetes.io/zh/docs/concepts/architecture/controller/)
+ [kube-controller-manager](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-controller-manager/)
+ [Adding 3rd Party Resources To Your Operator](https://sdk.operatorframework.io/docs/building-operators/golang/advanced-topics/)

<!--source code -->
+ [operator docs](https://sdk.operatorframework.io/docs/installation/install-operator-sdk/)
+ [operator source code](https://github.com/operator-framework)

+ [controller-gen](https://github.com/kubernetes-sigs/controller-tools)
<!-- sample code -->
+ [sample memcached_controller](https://github.com/operator-framework/operator-sdk/blob/master/testdata/go/memcached-operator/controllers/memcached_controller.go)
