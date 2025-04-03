# leveldb log
+ WAL log
    + 用于恢复数据

+ log保证原子性
    + 日志的一条记录作为最小单位写入
        + 可以包含batch中的多个写操作
    + 日志写入要么成功要么失败
        + 当数据库重新启动恢复时，读到这条日志记录时，发现数据异常，直接丢弃或退出，实现了写入的原子性保障

## 日志结构

+ block
    + 32k
    + 组成日志

+ chunk
    + 一条日志包含一个或多个chunk
    + chunk format:
        + [Checksum | Length | type | data]
            + chunk head(7 bytes)
                + checksum
                    + 4字节
                + length
                    + 2字节
                    + chunk长度
                + type
                    + 1字节
                    + full
                        + 含一整条日志
                    + first
                        + 一条日志含多个chunk,排第一的chunk
                    + middle
                    + last
            + data
                + [sequence number | entry number | batch data | ... | batch data]
                    + sequence number
                        + 当前db的sequence number
                    + entry number
                        + 这条记录包含的put/del操作的个数
                    + batch data
                        + [type | key length | key | value length | value]
                            + type
                                + Put/Del
                            + key
                                + batch->memtable时，key会转成internalKey
                                + internalKey
                                    + [uKey | sequence number(7 bytes) | type(1 byte)]
                                        + type
                                            + 操作类型