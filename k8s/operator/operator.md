# Operator-SDK

+ stateless->interchangeable
    + pod -> basic unit of work and replication
+ Stateful Is Hard
+ Operators Are Software SREs(Site Reliability Engineering)
    + writing software to run your software
+ atop controller-runtime

+ Adapter Operators
    + `--type=helm` Helm Operator
        + new CR  ---values-->  values.yaml  ----> helm install
    + Ansible Operator

+ Cluster Service Version (CSV)

+ pillars
    + operator sdk
    + OLM(Operator Lifesyle Manager)   An operator that installs, manages, and upgrades other Operators.
    + Operator Metering

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
+ goland: `go build main.go`
<!-- + `export OPERATOR_NAME=<operator-name>`Start the Operator in local mode
    + `operator-sdk up local --namespace default`-->
+ `kubectl apply -f deploy/crds/*_cr.yaml` Deploy an example resource 

## tips
+ `--type=helm`
+ `--helm-chart`
+ `--helm-chart-repo`
+ `--helm-chart-version`
+ `ARGS`
    + `make run ARGS="--zap-encoder=console" ENABLE_WEBHOOKS=false` 传参
    ```sh
    # Run against the configured Kubernetes cluster in ~/.kube/config
    run: generate fmt vet manifests
	go run ./main.go $(ARGS)
    ```
<!-- args array -->
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: controller-manager
  namespace: system
spec:
  template:
    spec:
      containers:
      - name: kube-rbac-proxy
        image: gcr.io/kubebuilder/kube-rbac-proxy:v0.5.0
        args:
        - "--secure-listen-address=0.0.0.0:8443"
        - "--upstream=http://127.0.0.1:8080/"
        - "--logtostderr=true"
        - "--v=10"
        ports:
        - containerPort: 8443
          name: https
      - name: manager
        args:
        - "--metrics-addr=127.0.0.1:8080"
        - "--enable-leader-election"
        - "--zap-encoder=console"
        - "--zap-log-level=debug"
```
## packing

+ manifest(yaml)
    + static
    + templatize(helm)
    + variable input(Kustomize)
+ OLM

## running Helm Operator outside of the cluster

+ `cp watches.yaml local-watches.yaml`  更改path的路径
+ `kubectl apply -f deploy/crds/*_crd.yaml`
+ `operator-sdk up local --watches-file ./local-watches.yaml`

## ref
+ [operator framework***********](https://sdk.operatorframework.io/docs/)
+ [Operator 模式](https://kubernetes.io/zh/docs/concepts/extend-kubernetes/operator/)
+ [什么是 Kubernetes Operator](https://www.redhat.com/zh/topics/containers/what-is-a-kubernetes-operator)
+ [Kubernetes Operator 快速入门教程](https://www.qikqiak.com/post/k8s-operator-101/)
+ [Introducing Operators: Putting Operational Knowledge into Software](https://coreos.com/blog/introducing-operators.html)
+ [What is the difference between kubebuilder and operator-sdk](https://github.com/operator-framework/operator-sdk/issues/1758)
+ [Kubernetes Operators Best Practices](https://www.openshift.com/blog/kubernetes-operators-best-practices)

<!-- details -->
+ [Control Loop](https://kubernetes.io/zh/docs/concepts/architecture/controller/)
+ [kube-controller-manager](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-controller-manager/)
+ [Adding 3rd Party Resources To Your Operator](https://sdk.operatorframework.io/docs/building-operators/golang/advanced-topics/)
+ [condition](https://sdk.operatorframework.io/docs/building-operators/golang/advanced-topics/)

<!--source code -->
+ [operator docs](https://sdk.operatorframework.io/docs/installation/install-operator-sdk/)
+ [operator source code](https://github.com/operator-framework)

+ [controller-gen](https://github.com/kubernetes-sigs/controller-tools)
<!-- sample code -->
+ [sample memcached_controller](https://github.com/operator-framework/operator-sdk/tree/master/testdata/go/v3/memcached-operator)

