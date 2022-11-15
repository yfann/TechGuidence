
## tips
+ k8s对存储卷(PV)的访问方式,node级别
    + ReadWriteOnce(RWO)
        + PV只能挂载到一个node上，同时挂载其他node时回报Multi-Attach错误
        + support type
            + block storage
            + file storage
    + ReadOnlyMany(ROX)
    + ReadWriteMany(RWX)
        + PV可被多node同时挂载，并被pod使用
        + support type
            + file storage
## ref
+ [Persistent Volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes)