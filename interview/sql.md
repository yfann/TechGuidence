
# mysql 

+ select for update
    + 高并发场景
    + 事物中才会生效
        + COMMIT后释放锁
    + 查询时，查询条件有主键，锁行。否则锁表

+ InnoDB
    + 默认是行锁
    + 

+ 数据库隔离级别

+ 幻读


+ 高并发下，如何安全的修改同一行数据

## ref

+ [关"SELECT FOR UPDATE"的一些概念](https://www.huaweicloud.com/articles/2941282344610781fd8418a7947a027d.html)