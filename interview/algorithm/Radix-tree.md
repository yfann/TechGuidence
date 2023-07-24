# Radix tree
+ 基数树，Patricia tree(前缀树)，Trie(字典树

+ 通常用于处理大量字符串数
    + 如在字符串搜索、路由表、编译器、网络协议等领域

+ 共享相同前缀的字符串键在树中共享相同的节点
    + 有效地压缩存储空间并减少搜索时间复杂度

# Adaptive Radix Tree (ART)
+ ART 是为高性能键值对存储而设计的数据结构，适用于各种应用，如数据库、文件系统、内存缓存等。

+ 紧凑的内存使用
    + 4位节点、8位节点、16位节点等

+ 自适应：
    + ART 在插入和删除键值对时可以自适应地选择节点类型，根据实际情况动态调整树的结构，从而减少冗余节点，提高树的紧凑性。

+ key在节点路径上
    + 叶子节点存储value


## tips
+ unsigned char
    + 0~255
    + 8 bit
    + 1 byte
## ref
+ [高效内存索引：Adaptive Radix Tree](https://zhuanlan.zhihu.com/p/644667990)