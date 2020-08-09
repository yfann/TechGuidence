## Open Service Broker API(OSB API)
+ Service Catalog
    - 使k8s上的application可以使用service broker代理的外部服务

## spring cloud OSB tips

+  catalog
    - `curl http://localhost:8080/broker/v2/catalog`

+ service instance
```sh
curl -X PUT http://localhost:8080/broker/v2/service_instances/[instance_id]
  -H 'Content-Type: application/json' 
  -d '{
    "service_id": "b92c0ca7-c162-4029-b567-0d92978c0a97", 
    "plan_id": "fd81196c-a414-43e5-bd81-1dbb082a3c55"
  }'
```
  - external name 为Catalog对象中的name
  ```yaml
  spec:
    clusterServiceClassExternalName: oss-broker
    clusterServicePlanExternalName: standard
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

+ `instances_retrievable`
  - if true
    + need to implement `getServiceInstance()`
+ `plan_updateable`
  - if true
    + need `updateServiceInstance()`
+ `bindable`
  - if true
    + need `ServiceInstanceBindingService`
## ClusterServiceBroker
- cluster scope

## ServiceBroker
- namespace scope
- url
```yml
spec:
  url: http://broker-url.com
```
## ServiceInstance
+ parameters, Service Catalog passes this metadata to the service broker
  - raw JSON
  - Secret(name and key,key in the named secret must conaint the JSON to pass to the broker)
    + UpdateRequests(Service catalog will update the broker after secret is updated)
```yml
parameters:
  max: 10
```

## ServiceBinding
+ ServiceBinding返回的内容会存在secret里
+ 如果spec.SecretName为空则secret name为metadata.name
+ secret和ServiceBinding同namespace
```yaml
apiVersion: servicecatalog.k8s.io/v1beta1
kind: ServiceBinding
metadata:
  namespace: example-ns
  name: test-database-binding
spec:
  instanceRef:
    name: test-database
  secretName: db-secret
```

## tips
+ process
  - Service Broker created
  - a corresponding ServiceClass created(Cluster matches cluster)
  - a ServiceClass may have one or more ServicePlan created
  - Service Instance use ServiceClass and ServicePlan to provision a new service(If not cluster they should be in the same namespace)
  - After ServiceBinding created, Service catalog will issue a bind request to the appropriate broker.After the broker responds, Service Catalog will write the credential it responds
  - credential(username,password,hostname,etc...), bind application pods to secret to start using the servie
+ 删除binding，secret也会被删除
## ref
+ [Serverce catalog Walkthrough](https://svc-cat.io/docs/walkthrough/#step-1---installing-the-ups-broker-server)
<!-- k8s -->
+ [*****service catalog config*****](https://svc-cat.io/docs/resources/)
+ [服务目录](https://kubernetes.io/zh/docs/concepts/extend-kubernetes/service-catalog/)
+ [Service Catalog Documentation](https://github.com/kubernetes-sigs/service-catalog/tree/master/docs)
+ [服务目录（Service Catalog）](https://jimmysong.io/kubernetes-handbook/concepts/service-catalog.html)
+ [PaaS平台的服务目录(一):Service Broker的前世今生](https://www.jianshu.com/p/52b3bc647996)
+ [PaaS平台的服务目录(二): Service Catalog in K8S/OpenShift Origin](https://www.jianshu.com/p/e4615868adac)
+ [Spring Cloud Open Service Broker](https://spring.io/projects/spring-cloud-open-service-broker#overview)

<!-- spring Cloud Open Service Broker -->
+ [Spring Cloud Open Service Broker Homepage](https://spring.io/projects/spring-cloud-open-service-broker#overview)
+ [Spring Cloud Open Service Broker](https://docs.spring.io/spring-cloud-open-service-broker/docs/3.2.0-SNAPSHOT/reference/)
+ [BookStore Service Broker Overview](https://spring.io/blog/2020/01/14/reactive-bookstore-service-broker)
+ [Spring Cloud Open Service Broker 3.2.0-SNAPSHOT API](https://docs.spring.io/spring-cloud-open-service-broker/docs/3.2.0-SNAPSHOT/apidocs/)

<!-- sourcecode -->
+ [spring-cloud/spring-cloud-open-service-broker](https://github.com/spring-cloud/spring-cloud-open-service-broker)

<!-- sample -->
+ [spring-cloud-samples/bookstore-service-broker](https://github.com/spring-cloud-samples/bookstore-service-broker)
+ [openservicebrokerapi/servicebroker](https://github.com/openservicebrokerapi/servicebroker/blob/master/gettingStarted.md#sample-service-brokers)
+ [kubernetes-sigs/minibroker](https://github.com/kubernetes-sigs/minibroker)
+ [kubernetes笔记：Service Catalog](https://ieevee.com/tech/2019/09/19/service-catalog.html)
+ [cloudfoundry-community/cf-mysql-java-broker](https://github.com/cloudfoundry-community/cf-mysql-java-broker)

+ [Cloud Foundry Service Broker and Service](https://developer.ibm.com/recipes/tutorials/cloud-foundry-service-broker-and-service/)

<!-- ali cloud -->
+ [阿里云Kubernetes服务 - Service Broker快速入门指南](https://developer.aliyun.com/article/592156)
<!-- install -->
+ [install service-catalog](https://svc-cat.io/docs/install/)
+ [install service-catalog](https://github.com/kubernetes-sigs/service-catalog/blob/master/docs/install.md)
+ [Deploy bookstore-service-broker to Kubernetes](https://github.com/spring-cloud-samples/bookstore-service-broker/blob/master/deploy/kubernetes/README.adoc)
<!-- design -->
+ [official Open Service Broker API](https://www.openservicebrokerapi.org/)
+ [openservicebrokerapi/servicebroker](https://github.com/openservicebrokerapi/servicebroker/blob/master/spec.md#catalog-management)