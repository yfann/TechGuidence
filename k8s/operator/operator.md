## install
+ `brew install operator-sdk`


## init

+ `go mod init <domain>`
+ `operator-sdk init --domain example.com --license apache2 --owner "The Kubernetes authors"`
+ `operator-sdk create api --group ship --version v1beta1 --kind Frigate`


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

<!-- operator framework -->
+ [operator docs](https://sdk.operatorframework.io/docs/installation/install-operator-sdk/)
+ [operator source code](https://github.com/operator-framework)

