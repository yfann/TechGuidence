# Connection Pooling
+ Connection pooling reduces the number of times that new connections must be opened.
+  The pooler maintains ownership of the physical connection. 
+ connection.Open()
    +  the pooler looks for an available connection in the pool
+ connection.Close()
    + the pooler returns it to the pooled set of active connections instead of closing it

+ ADO.NET会创建一些pools
    + 每个configuration对应一个pool
        + 主要通过connection string区分
    + 每个SqlCredential实例对应一个pool
+ 禁用connection pool
    + connection string中添加`Pooling=false;`

## ref
+ [SQL Server Connection Pooling](https://learn.microsoft.com/en-us/dotnet/framework/data/adonet/sql-server-connection-pooling)