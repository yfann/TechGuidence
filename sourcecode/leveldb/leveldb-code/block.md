# leveldb block
+ Block是SSTable的一个数据块
    + 存多条按 key 排序的 key/value

+ 底层用`bytes::Bytes`实现

## Block结构
+ `[ ENTRIES ... ][ RESTARTS ... ][ N_RESTARTS (u32) ]`
    + ENTRIES 区：连续存放一条条记录。
    + RESTARTS 区：一串 u32，每个是一个 entry 开头的偏移（“重启点”）。
        + 每个restart占4B
        + restart 点的 key 是完整的(SHARED=0)，BlockIter::seek会在 restart 点之间 二分查找，然后从最近的
            + 前缀压缩后，entry 之间不好随机跳转
        + restart 越多：
            + 二分更精细，线性扫更短
            + 但多存了一些完整 key，压缩率稍差
    + N_RESTARTS：最后 4 字节，表示有多少个 restart。

+ `[SHARED varint][NON_SHARED varint][VALSIZE varint][KEY bytes][VALUE bytes]`
    + SHARED：这个 key 和前一个 key 共享的前缀长度。
    + NON_SHARED：这个 key 独有的后缀长度。
    + VALSIZE：value 长度。
    + KEY: 实际存的是NON_SHARED部分（restart对应的key存的是完整的）
    + VALUE: value内容