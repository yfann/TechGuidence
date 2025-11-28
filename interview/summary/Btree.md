
# B-trees(btree)
+ 为硬盘优化的tree
+ B-tree node
    + 可以有多个子node
    + 存在一个block里
    + 存多个key
        + N keys (sorted)
        + N + 1 pointers to child nodes
    + 叶子节点有数据
+ usage
    + index
    + Mysql innoDB
    + postgreSQL
    + SQLite
    + MongoDB


## binary search trees (BSTs)
+ 二叉树
+ 适合内存中使用
+ BST node
    + 只有两个子node
    + 每个node存一个key
+ 磁盘中会慢很多
    + 磁盘的读取单元是block
    + BST的每个node都在一个block上
    + 当数据很大时，BST高度就很大
        + 磁盘就会读取和高度相当的次数
    + BST fanout is too low (only 2 children per node）
    + 在硬盘上维持BST平衡需要旋转节点
        + 降低数据库的使用率

## ref
+ [B-Trees: Why Every Database Uses Them](https://mehmetgoekce.substack.com/p/b-trees-why-every-database-uses-them)