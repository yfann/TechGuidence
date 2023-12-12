
## Schema
+ 模式
+ 和授权相关

## Tablespace
+ 一个目录可以包含多个DB
+ table属于一个DB,只能对应到一个tablespace中
    

## Datafile segment
+ 数据文件
+ 一般一张表对应一个segment,如果数据大于1g,则对应多个segment
+ 每张表的数据文件只能在一个tablespace中

## block
+ 数据块
+ 8k

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

## 行列存储
+ 行存储
    + 插入一行数据占少量数据页
    + 读取时会跨多个数据页
        + 只读几列，所有数据都会被读取
    + 适用
        + 表的字段个数少，查询大部分字段
        + 返回结果少，基于索引的简单查询
        + 增删改操作多
+ 列存储
    + 一列数据占少量数据页
    + 插入数据行时跨多个数据页
    + 查询少量列时读取的数据较少
        + 速度极快
    + 适用于
        + 宽表，查询涉及的列不多
        + 统计分析类查询
        + 即席查询，查询条件不确定，行存表难使用引擎
## tips
+ checkpoint
    + 数据写入时先写事务日志，后写数据文件
        + 日志写好后commit
            + 先commit后checkpoint
        + 缓存池中的数据定时存到数据文件中
            + checkpoint

## ref
+ [openGauss doc](https://docs-opengauss.osinfra.cn/zh/docs/5.0.0/docs/GettingStarted/GettingStarted.html)


+ [Ustore](https://docs-opengauss.osinfra.cn/zh/docs/3.0.0/docs/BriefTutorial/Ustore.html)