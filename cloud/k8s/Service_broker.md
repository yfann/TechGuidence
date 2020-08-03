## Open Service Broker API(OSB API)
+ Service Catalog
    - 使k8s上的application可以使用service broker代理的外部服务

## spring cloud OSB tips
+  catalog
    - `curl http://localhost:8080/broker/v2/catalog`
+ service instance
```
curl -X PUT http://localhost:8080/broker/v2/service_instances/[instance_id]
  -H 'Content-Type: application/json' 
  -d '{
    "service_id": "b92c0ca7-c162-4029-b567-0d92978c0a97", 
    "plan_id": "fd81196c-a414-43e5-bd81-1dbb082a3c55"
  }'
```
+ service binding
```
curl -X PUT 
  http://localhost:8080/broker/v2/service_instances/[instance_id]/service_bindings/[binding_id]
  -H 'Content-Type: application/json' 
  -d '{ 
    "service_id": "b92c0ca7-c162-4029-b567-0d92978c0a97", 
    "plan_id": "fd81196c-a414-43e5-bd81-1dbb082a3c55" 
  }'
 
```

## ref
+ [official Open Service Broker API](https://www.openservicebrokerapi.org/)
+ [openservicebrokerapi/servicebroker](https://github.com/openservicebrokerapi/servicebroker/blob/master/spec.md#catalog-management)
<!-- k8s -->
+ [服务目录](https://kubernetes.io/zh/docs/concepts/extend-kubernetes/service-catalog/)
+ [service-catalog](https://github.com/kubernetes-sigs/service-catalog)
+ [服务目录（Service Catalog）](https://jimmysong.io/kubernetes-handbook/concepts/service-catalog.html)
+ [PaaS平台的服务目录(一):Service Broker的前世今生](https://www.jianshu.com/p/52b3bc647996)
+ [PaaS平台的服务目录(二): Service Catalog in K8S/OpenShift Origin](https://www.jianshu.com/p/e4615868adac)
+ [Spring Cloud Open Service Broker](https://spring.io/projects/spring-cloud-open-service-broker#overview)

<!-- blogs -->
+ [kubernetes笔记：Service Catalog](https://ieevee.com/tech/2019/09/19/service-catalog.html)
<!-- spring Cloud Open Service Broker -->
+ [Spring Cloud Open Service Broker Homepage](https://spring.io/projects/spring-cloud-open-service-broker#overview)
+ [Spring Cloud Open Service Broker](https://docs.spring.io/spring-cloud-open-service-broker/docs/3.2.0-SNAPSHOT/reference/)
+ [BookStore Service Broker Overview](https://spring.io/blog/2020/01/14/reactive-bookstore-service-broker)
+ [Spring Cloud Open Service Broker 3.2.0-SNAPSHOT API](https://docs.spring.io/spring-cloud-open-service-broker/docs/3.2.0-SNAPSHOT/apidocs/)
<!-- sample -->
+ [spring-cloud-samples/bookstore-service-broker](https://github.com/spring-cloud-samples/bookstore-service-broker)
+ [openservicebrokerapi/servicebroker](https://github.com/openservicebrokerapi/servicebroker/blob/master/gettingStarted.md#sample-service-brokers)
+ [kubernetes-sigs/minibroker](https://github.com/kubernetes-sigs/minibroker)
<!-- ali cloud -->
+ [阿里云Kubernetes服务 - Service Broker快速入门指南](https://developer.aliyun.com/article/592156)
<!-- install -->
+ [install service-catalog](https://svc-cat.io/docs/install/)
+ [install service-catalog](https://github.com/kubernetes-sigs/service-catalog/blob/master/docs/install.md)
+ [Deploy bookstore-service-broker to Kubernetes](https://github.com/spring-cloud-samples/bookstore-service-broker/blob/master/deploy/kubernetes/README.adoc)
+ [Serverce catalog Walkthrough](https://svc-cat.io/docs/walkthrough/#step-1---installing-the-ups-broker-server)