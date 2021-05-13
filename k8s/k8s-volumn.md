
## Volume
+ 临时卷
+ 持久卷
+ 内存volumn
```yaml
volumes:
  - name: html
    emptyDir:
      medium: Memory          
```

## PV(PersistentVolumes)/PVC(PersistentVolumeClaims)

+ pod->PVC->PV->NFS(volumns)

+ 一组API

+ PV
    + 一块存储
    + 静态供应
        + admin预先定义
    + 动态供应
        + StorageClass动态供应
    + 独立于Pod的生命周期
    + cluster level
    + 删除重建releaed PV,可以重新使用
    + `claimRef`
        + 可以预留给PVC


+ PVC
    + namespaced level
    + 用户用来消费PV
    + persistentVolumeReclaimPolicy:
        + Retain
        + Delete   删除PV的内容，可以被重新claim
        + Recycle
    + StatefulSet
        + volumeClaimTemplates
            + 可以创建PVC对象

+ PV与PVC动态绑定
    + 1对1

## StorageClass

+ StorageClass
    + 管理员预先定义
    + type of PV
    + cluster level

+ PVC不指定StorageClass,用默认StorageClass(standard)

+ `storageClassName: ""` 禁止动态供应PV
    +  `volumeName: <pv name>` 通过name指定要绑定的PV

## tips

+ pod->PVC->storageClass->Provisioner->PV->instance volumns


+ emptyDir  (storing transient data)
    + 同个pod中不同container间共享数据
    + 临时存储数据(大数据排序)
    + pod删除，volume也会删除

+ hostPath (mounting directories from the worker node's filesystem into the pod)
    + pod可以访问host的node的文件
    + volume持久保存



+ nfs
    + persistent

+ gcePersistentDisk (Google Compute Engine Persistent Disk), awsElasticBlockStore (Amazon Web Services Elastic Block Store Volume), azureDisk (Microsoft Azure Disk Volume)-----mounting cloud provider-specific storage
    + persistent

+ cinder, cephfs, iscsi, flocker, glusterfs, quobyte, rbd, flexVolume, vsphere-Volume, photonPersistentDisk, scaleIO—Used for mounting other types of network storage.

+ configMap, secret, downwardAPI—Special types of volumes used to expose certain Kubernetes resources and cluster information to the pod.( they aren’t used for storing data, but for exposing Kubernetes metadata to apps running in the pod.)

+ persistentVolumeClaim—A way to use a pre- or dynamically provisioned persistent storage.


+ persistent storage
  + network-attached storage (NAS)
  + pod可能会被rescheduled到其他node上





## ref
+ [Docker Volume](https://docs.docker.com/storage/volumes/)
+ [Volume](https://kubernetes.io/zh/docs/concepts/storage/volumes/)
+ [Persistent Volume](https://kubernetes.io/zh/docs/concepts/storage/persistent-volumes/)
+ [Persistent Volume Provisioning](https://github.com/kubernetes/examples/blob/master/staging/persistent-volume-provisioning/README.md)

+ [配置 Pod 以使用 PersistentVolume 作为存储](https://kubernetes.io/zh/docs/tasks/configure-pod-container/configure-persistent-volume-storage/)