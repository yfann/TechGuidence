# distributed lock
+ single machine lock
    + lock
        + local memory
        + assembly instruction

+ distributed lock
    + lock
        + distributed key-value store
            + etcd
            + zookeeper
            + consul
        + compare and swap
        + ttl
        + renew
            + hold lock
        + version unlock
            + 防止释放他人的锁
        + double check(有的master丢失了锁，任然认为自己还是master)
            + 分布式锁要保存获得锁的master名字
        + byzantine problem
            + 收到request后同时检查current owner和resource version
## code
```go
func (Lock l) simpleLock() boolean {
  // compare and swap "1" for "0"
  locked, error = compareAndSwap(l.lockName, "1", "0")
  // lock doesn't exist, try to write "1" with a previous value of
  // non-existent
  if error != nil {
    locked, _ = compareAndSwap(l.lockName, "1", nil)
  }
  return locked
}

// ttl 防止分布式的锁永远无法释放
func (Lock l) simpleLock() boolean {
  // compare and swap "1" for "0"
  locked, error = compareAndSwap(l.lockName, "1", "0", l.ttl)
  // lock doesn't exist, try to write "1" with a previous value of
  // non-existent
  if error != nil {
    locked, _ = compareAndSwap(l.lockName, "1", nil, l.ttl)
  }
  return locked
}

//renew lock
func (Lock l) renew() boolean {
  locked, _ = compareAndSwap(l.lockName, "1", "1", l.version, ttl)
  return locked
}

// Hold the lock
for {
  if !l.renew() {
    handleLockLost() //重启pod
  }
  sleep(ttl/2)
}

// master需要double check 锁是否还存在， cpu挂起,锁超时可能会释放锁
// isLocked()调用后和代码执行前的间隙也可能会释放锁，这种情况需要work在收到请求后检查是否是master发来的，如果不是reject the request
func (Lock l) isLocked() boolean {
  return l.locked && l.lockTime + 0.75 * l.ttl > now()
}


//version 防止释放其他进程获得的分布式锁
func (Lock l) simpleLock() boolean {
  // compare and swap "1" for "0"
  locked, l.version, error = compareAndSwap(l.lockName, "1", "0", l.ttl)
  // lock doesn't exist, try to write "1" with a previous value of
  // non-existent
  if error != null {
    locked, l.version, _ = compareAndSwap(l.lockName, "1", null, l.ttl)
  }
  return locked
}

func (Lock l) unlock() {
  compareAndSwap(l.lockName, "0", "1", l.version)
}


```

<!-- etcd lock -->
```sh
# 设置key: my-lock,value: unlocked
kubectl exec my-etcd-cluster-0000 -- sh -c \
  "ETCD_API=3 etcdctl --endpoints=${ETCD_ENDPOINTS} set my-lock unlocked"

# alice 写入自己的name到my-lock，获得了lock
kubectl exec my-etcd-cluster-0000 -- sh -c \
  "ETCD_API=3 etcdctl --endpoints=${ETCD_ENDPOINTS} \
      set --swap-with-value unlocked my-lock alice"
# bob再执行写入会失败
kubectl exec my-etcd-cluster-0000 -- sh -c \
  "ETCD_API=3 etcdctl --endpoints=${ETCD_ENDPOINTS} \
      set --swap-with-value unlocked my-lock bob"


# leased lock
# 10s 后过期
kubectl exec my-etcd-cluster-0000 -- \
    sh -c "ETCD_API=3 etcdctl --endpoints=${ETCD_ENDPOINTS} \
        --ttl=10 mk my-lock alice"
# alice需要不断续租
kubectl exec my-etcd-cluster-0000 -- \
    sh -c "ETCD_API=3 etcdctl --endpoints=${ETCD_ENDPOINTS} \
        set --ttl=10 --swap-with-value alice my-lock alice"
```

## ref
+ [Chapter 9. Ownership Election](https://learning.oreilly.com/library/view/designing-distributed-systems/9781491983638/ch09.html#idm139824736711552)