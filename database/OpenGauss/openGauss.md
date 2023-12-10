
## Ustore
+ In-place Update存储引擎（原地更新
+ Ustore存储引擎将最新版本的“有效数据”和历史版本的“垃圾数据”分离存储。将最新版本的“有效数据”存储在数据页面上，并单独开辟一段UNDO空间，用于统一管理历史版本的“垃圾数据”，因此数据空间不会由于频繁更新而膨胀，“垃圾数据”集中回收效率更高。
## MOT

## 表空间


## FDW
+ 跨库访问
+ 通过创建外部表映射其他地方的文件系统
    + 可做查询
+ 需要拉取数据


## 自动分区
+ 提高查询效率
+ tips
    + 查询不宜夸太多分区
    + 管理太多分区也会效率低
+ period
+ ttl
    + 淘汰时间
    + 不会丢数据


## 日志
+ logging_collector

## vs postgresql
+ OpenGauss
    + 一个访问一个线程
    + 单台万并发
+ postGresql
    + 一个访问一个进程
    + 单台150并发

## tips
+ checkpoint
    + 数据写入时先写事务日志，后写数据文件
        + 日志写好后commit
        + 

## ref
+ [openGauss doc](https://docs-opengauss.osinfra.cn/zh/docs/5.0.0/docs/GettingStarted/GettingStarted.html)


+ [Ustore](https://docs-opengauss.osinfra.cn/zh/docs/3.0.0/docs/BriefTutorial/Ustore.html)