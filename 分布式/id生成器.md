
# 分布式id生成器
+ 多主复制
    + auto_increment 
    + n个数据库，自增加n
+ ticket server
+ 雪花算法（snowflake）
    + 0+timestamp+datacenter ID+ machine ID+ sequence number
## ref
+ [分布式系统中设计唯一 ID 生成器](https://learning-guide.gitbook.io/system-design-interview/xi-tong-she-ji-mian-shi-nei-mu-zhi-nan-di-yi-juan/chapter-07-design-a-unique-id-generator-in-distributed-systems)