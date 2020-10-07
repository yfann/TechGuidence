## volume types

+ emptyDir  (storing transient data)
    + 同个pod中不同container间共享数据
    + 临时存储数据(大数据排序)
    + pod删除，volume也会删除
+ gitRepo 
    + 更新git后，更新gitRepo volume
        + 删除原Pod后，replicationController会创建新的pod并拉取最新的git代码
    + pod删除，volume也删除

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


## persistent storage

+ network-attached storage (NAS)
+ pod可能会被rescheduled到其他node上


## PersistentVolumes and PersistentVolumeClaims
+ admin定义PV
+ pod通过PVC消费PV
+ pod->PVC->PV->NFS(volumns)
+ PV 
    + is cluster level
    + 删除重建releaed PV,可以重新使用
+ PVC is namespaced level
+ PV: persistentVolumeReclaimPolicy:
    + Retain
    + Delete   删除PV的内容，可以被重新claim
    + Recycle

## Dynamic provisioning
+ pod->PVC->storageClass->Provisioner->instance volumns
+ PV provisioner
+ StorageClass
    + type of PV
    + cluster level
```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: fast
provisioner: kubernetes.io/gce-pd        ❶
parameters:
  type: pd-ssd                           ❷
  zone: europe-west1-b                   ❷
```
    - ❷ The parameters passed to the provisioner

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: mongodb-pvc
spec:
  storageClassName: fast             ❶
  resources:
    requests:
      storage: 100Mi
  accessModes:
    - ReadWriteOnce
```
+ PVC不指定StorageClass,用默认StorageClass(standard)
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: mongodb-pvc2
spec:                        ❶
  resources:                 ❶
    requests:                ❶
      storage: 100Mi         ❶
  accessModes:               ❶
    - ReadWriteOnce          ❶
```

+ storageClassName: ""   ----使用pre-provisioned PV

```yaml
kind: PersistentVolumeClaim
spec:
  storageClassName: ""                   ❶

```
  + ❶ Specifying an empty string as the storage class name ensures the PVC binds to a pre-provisioned PV instead of dynamically provisioning a new one.



## tips

+ craete volume on memory
```yaml
volumes:
  - name: html
    emptyDir:
      medium: Memory              ❶
```
