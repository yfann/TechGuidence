# leveldb WAL log
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
    + 避免频繁IO,读取时整个读取
        + SSD,HDD使用page(4k)作为最小读写单位，LevelDB 的 Block 设计匹配磁盘存储的特性
    + The log file contents are a sequence of 32KB blocks.  The only exception is that
the tail of the file may contain a partial block.
        + Each block consists of a sequence of records(chunk)
```c++
    block := record* trailer?
    record :=
      checksum: uint32     // crc32c of type and data[] ; little-endian
      length: uint16       // little-endian
      type: uint8          // One of FULL, FIRST, MIDDLE, LAST
      data: uint8[length]
```

+ chunk
    + 一条日志包含一个或多个chunk
        + 本质上一条日志(user record),可能落在一个block上(一条日志对应一个chunk),可能落在多个block上（一条日志对应多个chunk）
    + 每次读取一个chunk
    + chunk format:
        + [Checksum | Length | type | data]
            + chunk head(7 bytes)
                + checksum
                    + 4字节
                    + 数据完整性校验,确保读取的数据没有被损坏或篡改。
                    + 当读取数据时，LevelDB 会计算读取内容的校验值，并与存储的 checksum 进行对比。如果两者不匹配，就说明数据可能损坏，LevelDB 会返回错误，而不会使用可能已损坏的数据。
                + length
                    + 2字节
                    + chunk长度
                + type(1字节)
                    + 用于应对block boundaries
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