


## perpose
+ 构建高效存储和数据处理


## 存储与检索

+ 日志结构的存储引擎
    - LSM-tree(Log-Structured Merge-Tree)
        + SSTable,Lucene,Hbase,BigTable
        + 磁盘顺序写，支持高写入吞吐量,读取不如B-tree
        + 可变大小段
+ 面向页的存储引擎
    - B-tree
        + 写入固定大小页
        + 每个页引用其他页
        + 页节点包含value

## 数据编码
+ JSON(文本)
    - BSON(JSON的二进制编码)
    - MessagePack
+ XML（文本）
    - WBXML
+ Protocol Buffers(二进制编码)
+ Thrift(二进制)
+ Avro(二进制)