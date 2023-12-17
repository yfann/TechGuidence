
# k8s quota

+ request(field)
    + 决定了pod能否被调度到node上
    + 用户设置
+ limit(field)
    + pod最大使用resource的上限
    + 用户设置

+ ResourceQuota(k8s resource)
    + 给namespace添加request,limit
        + pod的request,limit总和不能超过namespace的request,limit
    + 创建的pod必须带有request,limit
    + 管理员设置

+ LimitRange(k8s resource)
    + 每个pod/container的资源使用量最大最小值
    + 默认值
        + 没有设定request,limit的pod/container添加默认值
    + 管理员设置


## ref
+ [Kubernetes 资源分配之 Request 和 Limit 解析](https://cloud.tencent.com/developer/article/1004976)
+ [K8s集群稳定性提升手段](https://zhuanlan.zhihu.com/p/485716536)