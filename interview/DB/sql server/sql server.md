## interview
+ 调优的手段

+ 什么是SQL Server的查询执行计划（Query Execution Plan）？如何查看和分析查询执行计划以优化查询性能
    + 查询执行计划（Query Execution Plan）是SQL Server执行查询时生成的一组操作指令。它描述了SQL查询的执行方式，包括数据的获取、连接和筛选等操作的顺序和方法。可以通过使用EXPLAIN语句或查看查询执行计划工具来查看和分析查询执行计划。优化查询性能的方法包括使用合适的索引、优化查询语句、避免全表扫描等。

+ 解释SQL Server中的事务隔离级别（Transaction Isolation Levels）是什么？分别讨论每个隔离级别的特点和适用场景。
    + SQL Server的事务隔离级别（Transaction Isolation Levels）定义了在并发事务环境下如何处理数据一致性和隔离性。包括读未提交（Read Uncommitted）、读已提交（Read Committed）、可重复读（Repeatable Read）和串行化（Serializable）四个隔离级别。每个隔离级别具有不同的隔离程度和性能开销，选择适当的隔离级别取决于应用程序的要求和并发访问模式。

+ 什么是索引（Index）？解释聚集索引和非聚集索引之间的区别，并讨论何时应使用每种索引类型。
    + 索引（Index）是用于提高查询性能的数据库对象，它存储了数据的排序和快速查找所需的结构。聚集索引（Clustered Index）指定了数据行在磁盘上的物理排序顺序，一个表只能有一个聚集索引。非聚集索引（Non-clustered Index）创建了一个单独的数据结构来加速数据查找，一个表可以有多个非聚集索引。选择使用聚集索引还是非聚集索引取决于查询的类型、数据访问模式和表的大小。

+ 什么是数据库范式化（Database Normalization）？解释第一范式（1NF）、第二范式（2NF）和第三范式（3NF）的概念，并讨论在设计数据库时如何应用它们。
    + 数据库范式化（Database Normalization）是一种设计数据库的方法，旨在消除数据冗余并提高数据的一致性和完整性。第一范式（1NF）要求每个列具有原子性，即每个列都包含一个不可再分的数据项。第二范式（2NF）要求表中的每个非主键列都完全依赖于主键。第三范式（3NF）要求表中的每个非主键列都不依赖于其他非主键列。通过范式化可以提高数据的规范性和查询性能，但也会增加数据处理的复杂性。

+ 请解释SQL Server中的锁（Lock）是什么？讨论不同类型的锁，如共享锁、排它锁等，以及它们在并发控制中的作用。
    + 锁（Lock）在SQL Server中用于管理并发访问数据库对象的机制。共享锁（Shared Lock）允许多个事务并发地读取数据，而排它锁（Exclusive Lock）则只允许一个事务独占地修改数据。在并发环境中，锁的使用可以防止数据冲突和保证数据的一致性。不同类型的锁包括行级锁、页级锁和表级锁，选择合适的锁取决于数据访问模式、事务粒度和性能要求。

+ 什么是SQL Server的执行计划缓存（Execution Plan Cache）？解释执行计划缓存的作用以及如何管理和优化执行计划缓存的性能。
    + 执行计划缓存（Execution Plan Cache）是SQL Server中存储查询执行计划的内存区域。它可以提高查询性能，避免对相同查询的重复优化。执行计划缓存的性能可以通过适当的内存配置、定期清理过期计划和使用参数化查询等技术进行优化。

+ 解释SQL Server中的表连接（Join）操作，包括内连接、外连接和交叉连接。讨论在查询中如何选择和优化连接操作。
    + 表连接（Join）是在SQL查询中使用多个表关联的操作。内连接（Inner Join）根据两个表之间的匹配条件返回匹配的行。外连接（Outer Join）允许返回匹配和不匹配的行。交叉连接（Cross Join）返回两个表的笛卡尔积。在查询中，正确选择和优化连接操作可以提高查询性能和数据的完整性。

+ 请解释SQL Server中的查询优化器（Query Optimizer）是什么？讨论查询优化器如何评估和选择最佳执行计划以提高查询性能。
    +  查询优化器（Query Optimizer）是SQL Server中的组件，它负责评估和选择最佳的查询执行计划，以提高查询性能。查询优化器使用统计信息、索引信息和查询成本等因素来生成最佳的执行计划。可以通过正确的索引设计、更新统计信息、使用查询提示和优化查询语句等方法来管理和优化查询优化器的性能。

+ 什么是SQL Server的数据库备份和恢复？讨论不同类型的备份（完整备份、差异备份、事务日志备份）以及在灾难恢复情况下如何使用它们。
    + 备份和恢复是用于保护和恢复数据的重要任务。在SQL Server中，可以使用完整备份、差异备份和事务日志备份等备份类型来创建数据库备份。在灾难恢复情况下，可以使用这些备份来还原数据库和恢复数据。

+ 解释SQL Server中的存储过程（Stored Procedure）和触发器（Trigger）的概念和作用。讨论何时应使用存储过程和触发器，以及它们对性能和安全性的影响。
     +存储过程（Stored Procedure）是一组预定义的SQL语句集合，可以作为单个单位进行执行。它们可以接收输入参数和返回输出参数，提供了封装和复用SQL逻辑的能力。触发器（Trigger）是与表相关联的特殊类型的存储过程，当满足特定条件时会自动触发。存储过程和触发器可以提高数据的安全性和完整性，但过度使用可能会导致性能问题。

+ 请解释SQL Server中的锁定粒度（Locking Granularity）是什么？讨论不同的锁定粒度（如表级锁、页级锁和行级锁）以及选择合适的锁定粒度的考虑因素。
     +锁定粒度（Locking Granularity）指定锁应用的粒度级别。表级锁定（Table-level Locking）、页级锁定（Page-level Locking）和行级锁定（Row-level Locking）是SQL Server中常用的锁定粒度。选择适当的锁定粒度取决于数据访问模式、事务粒度和并发要求。较细粒度的锁定可以提高并发性能，但也会增加锁的开销和管理复杂性。

+ 什么是SQL Server的分区表（Partitioned Table）？解释分区表的概念和优势，并讨论何时应考虑使用分区表。
    + 分区表（Partitioned Table）是将大型表分割为多个较小的逻辑部分的表。分区表可以根据特定的分区方案对数据进行水平分割，从而提高查询性能和数据维护的效率。使用分区表时，可以根据查询的条件仅扫描相关分区，从而减少不必要的数据访问和存储开销。

+ 请解释SQL Server中的查询提示（Query Hints）是什么？列举并解释一些常用的查询提示，以及它们在查询优化中的作用和适用场景。
    + 查询提示（Query Hints）允许开发者向查询优化器提供额外的指导，以干预查询的执行计划。一些常用的查询提示包括INDEX提示、FORCESEEK提示和MAXDOP提示。查询提示的使用应谨慎，只在必要时才使用，并根据具体情况进行性能测试和分析。

+ 解释SQL Server中的跨数据库查询（Cross-Database Query）和跨服务器查询（Linked Server Query）的概念和用法。讨论在不同数据库和服务器之间进行查询时的注意事项和性能考虑。
    + 跨数据库查询（Cross-Database Query）允许在不同的数据库之间进行查询操作。跨服务器查询（Linked Server Query）允许在不同的SQL Server实例之间进行查询操作。在进行跨数据库和跨服务器查询时，需要考虑安全性、性能和访问权限等方面的问题，并使用合适的连接方式和查询语法。

+ 什么是SQL Server的列存储索引（Columnstore Index）？解释列存储索引的原理和优势，并讨论何时应使用列存储索引。
    + 列存储索引（Columnstore Index）是SQL Server中的一种索引类型，用于高效地存储和查询大量数据列。与传统的行存储索引相比，列存储索引以列为单位进行数据存储，提供了更好的数据压缩率和查询性能。列存储索引适用于大数据仓库和分析型应用程序，可以显著提高查询的执行速度和吞吐量。

## 联合索引
+ 它将多个列的值组合成一个键，并以此键值作为索引的存储结构
+ 最左前缀


## tips
+ view vs indexed view
+ Key Lookup: Sometimes, the query requires additional columns that are not part of the index. In such cases, SQL Server may also perform a "Key Lookup" (also known as "Bookmark Lookup") operation to fetch the additional data from the table using the clustered index or a heap (if there is no clustered index).

## ref
+ [一文搞定联合索引](https://zhuanlan.zhihu.com/p/110427099)