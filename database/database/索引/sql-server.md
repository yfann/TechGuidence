
## cmd
+ check index
```sql
exec sp_helpindex 'Person.Address';
GO
```


## tips
+ indexed view
+ query hint

## ref
<!-- index design -->
+ [SQL Server and Azure SQL index architecture and design guide](https://learn.microsoft.com/en-us/sql/relational-databases/sql-server-index-design-guide?view=sql-server-ver16#Clustered)
+ [Nonclustered index design guidelines](https://learn.microsoft.com/en-us/sql/relational-databases/sql-server-index-design-guide?view=sql-server-ver16#Nonclustered)
+ [Filtered index design guidelines](https://learn.microsoft.com/en-us/sql/relational-databases/sql-server-index-design-guide?view=sql-server-ver16#Filtered)
<!-- others -->
+ [索引深入浅出(9/10)：过滤索引](https://www.cnblogs.com/woodytu/p/4509812.html)
+ [Use included columns to extend nonclustered indexes](https://learn.microsoft.com/en-us/sql/relational-databases/sql-server-index-design-guide?view=sql-server-ver16#Included_Columns)
+ [Tune nonclustered indexes with missing index suggestions](https://learn.microsoft.com/en-us/sql/relational-databases/indexes/tune-nonclustered-missing-index-suggestions?view=sql-server-ver16)

