

## ORM
+ sqlsugar
+ Entity Framework Core
+ dapper orm

## DbContext
+ .Net Core中
    + 管理应用程序和数据库之间的关系
    + 是数据库访问层和业务逻辑层间的桥梁
    + 提供了对数据库的操作和持久化能力
    + 用面向对象的方式访问和操作数据库
        + Entities   
            + DbContext会把实体和数据库间的映射转化为SQL

+ 用途：
    + 定义实体集合和数据库表之间的映射关系
    + 管理数据库连接和事务
    + 跟踪变更和处理并发冲突
    + 支持数据验证和数据操作事件

## tips
+ whereif
    + 这是一种常见的方式来动态构建分布式查询条件，根据不同的条件进行灵活的筛选。

## ref
+ [使用 Entity Framework Core 实现基础结构持久性层]()
+ [Fluent API - Configuring and Mapping Properties and Types](https://learn.microsoft.com/en-us/ef/ef6/modeling/code-first/fluent/types-and-properties)
<!-- json -->
+ [Announcing Entity Framework Core 7 RC2: JSON Columns](https://devblogs.microsoft.com/dotnet/announcing-ef7-release-candidate-2/)
+ [How to Store JSON in an Entity Field With EF Core](https://code-maze.com/efcore-store-json-in-an-entity-field/)
<!-- 动态模型 -->
+ [https://www.cnblogs.com/94cool/p/5849523.html](https://www.cnblogs.com/94cool/p/5849523.html)
+ [Creating and Configuring a Model](https://learn.microsoft.com/en-us/ef/core/modeling/)