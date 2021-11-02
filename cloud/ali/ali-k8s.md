
## 集群扩容
+ 弹性节点池
    + 会在集群中部署cluster-autoscaler
+ 弹性伸缩组(ESS)


## cluster-autoscaler
+ 节点水平伸缩组件
+ 监听pending pod
+ 只管理弹出的节点
   + 弹出的节点被缩容
+ 调用ESS api来调整规模
    + 需要授权


## auto scaling
+ 伸缩组
    + ECS

## ref
+ [节点池](https://help.aliyun.com/document_detail/197279.html?spm=a2c4g.11186623.6.734.5bf62200XUDsHe)

+ [阿里云上弹性伸缩kubernetes集群 - autoscaler](https://developer.aliyun.com/article/392170)
+ [弹性伸缩概述](https://help.aliyun.com/document_detail/176660.html?spm=a2c4g.11186623.6.913.267d4908hwvi9u)
<!-- 弹性伸缩ESS -->
+ [弹性伸缩](https://help.aliyun.com/document_detail/25857.html?spm=5176.14215439.J_3034963950.2.34086fc0oVKz5E)
<!-- detail -->
+ [autoscaler授权](https://help.aliyun.com/document_detail/119099.html?spm=a2c4g.11186623.6.914.1fe159adlgCms1)
+ [通过Annotation配置负载均衡](https://www.alibabacloud.com/help/zh/doc-detail/86531.htm)
    + SLB
        + 公网/私网