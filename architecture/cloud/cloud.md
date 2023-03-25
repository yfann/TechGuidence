
## tips
+ 主流Pass平台是面向Contianer的（container as a service）
+ Scalability is the ability of the system to accommodate larger loads just by adding resources either making hardware stronger (scale up) or adding additional nodes (scale out). 
+ Elasticity is the ability to fit the resources needed to cope with loads dynamically usually in relation to scale out.


## redshift vs snowflake
Redshift是基于传统的共享磁盘（Shared Disk）架构，它通过将数据分片存储在不同节点的磁盘上，来实现高性能查询。
而Snowflake采用了一种全新的架构，它将数据存储在云存储服务（如Amazon S3）中，而计算资源则在独立的虚拟层中运行。这种分离架构的优点是可以实现更好的扩展性和弹性。


## ref

+ [Terraform](https://www.jianshu.com/p/0aebea117cae)
+ [RDS](https://help.aliyun.com/document_detail/67687.html)
+ [Consul](https://blog.csdn.net/u010046908/article/details/61916389)
+ [Consul gitbook](https://book-consul-guide.vnzmi.com/02_compare_with_other_software.html)
+ [VPC](https://zhuanlan.zhihu.com/p/33658624)
<!-- cloud -->
+ [Cloud Foundry](https://www.cloudfoundry.org/)
+ [IBM Bluemix](https://link.jianshu.com/?t=https://console.bluemix.net/)
<!-- 基于k8s的PaaS -->

+ [蜂巢](https://www.163yun.com/?h=fc)










