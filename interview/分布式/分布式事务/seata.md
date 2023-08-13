# Seata
+ 优势
    + 对业务无入侵
    + 高性能
+ TC(Transaction Coordinator)
    + 管理全局分支事务的状态，用于全局事务的提交和回滚

+ TM(Transaction Manager) 
    + 用于开启，提交或回滚事务

+ RM(Resource Manager)
    + 向TC注册分支事务，上报分支事务状态，接收TC的命令来提交或回滚分支事务

## AT模式
+ 业务无侵入
+ 2PC

## ref
+ [深度解析！-- 阿里开源分布式事务框架 Seata](https://xie.infoq.cn/article/f5800e3e602cf60054ed97ef5)