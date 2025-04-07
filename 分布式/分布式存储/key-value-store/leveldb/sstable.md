# levelDB sstable


## 物理结构block
+ 4k
+ [data | Compression Type | CRS]

## 逻辑结构
+ data block
    + key value
+ filter block
    + 布隆过滤器
+ meta index block
    + 存储filter block的索引信息
+ index block
    + 存储data block的索引信息
+ footer
    + 存储meta index block和index block的索引信息