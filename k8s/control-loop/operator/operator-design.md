# operator

## Operator Framework
+ operator SDK
+ Operator lifecycle Manager
+ Operatror metering

## tips

+ metrics collection for operator
    + Kubernetes Audit Logs
        + kubeprovenance 

+ support for kube openapi:`+k8s:openapi-gen=true`

## ref

<!-- design -->
+ [Kubernetes Operator Development Guidelines for improved Usability](https://itnext.io/kubernetes-operator-development-guidelines-for-improved-usability-222390b00dc4)
+ [Kubernetes Operator Maturity Model](https://github.com/cloud-ark/kubeplus/blob/master/Guidelines.md)
+ [kubernetes/kube-openapi](https://github.com/kubernetes/kube-openapi)

<!-- practice -->
+ [A complete guide to Kubernetes Operator SDK](https://banzaicloud.com/blog/operator-sdk/)
+ [Building an Kubernetes Operator for Prometheus and Thanos](https://robszumski.com/building-an-operator/)


<!-- samples -->
+ [coreos/etcd-operator](https://github.com/coreos/etcd-operator)
+ [oracle/mysql-operator](https://github.com/oracle/mysql-operator/blob/master/pkg/resources/services/service.go#L34)
+ [robszumski/prometheus-replica-operator](https://github.com/robszumski/prometheus-replica-operator/blob/master/pkg/stub/handler.go#L32)


<!-- tools -->
+ [kube-reporting/metering-operator](https://github.com/kube-reporting/metering-operator)