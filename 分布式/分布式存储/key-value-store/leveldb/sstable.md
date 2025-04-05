# leveldb sstable

## sstable block
+ 4kB
+ 物理结构
    + [data | compression type | CRC]

+ 逻辑结构
    + data block
        + key value数据
        + [entry | ... | entry | restart Point | ... | restart point length]
    + filter block
        + 布隆过滤器
    + meta index block
        + filter block 索引
    + index block
        + data block 索引
    + footer
        + meta index block和index block索引