# Indexed View
+ SQL server
+ 索引视图
+ Materialized View(物化视图)
+ 允许创建一个唯一聚集索引，将数据物化到磁盘上
+ pro and cons
    + 提高查询
    + 对底层表的数据更改（INSERT、UPDATE、DELETE）可能需要更新索引视图。
+ limit
    + 索引视图必须是唯一聚集索引或唯一非聚集索引,不能是其他类型的索引
    + 索引视图不能包含：
        + distinct, group by, union,outer join
