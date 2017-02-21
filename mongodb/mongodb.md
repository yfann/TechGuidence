# MongoDB

## 概念

   集合，文档，索引，服务端存取JavaScript的函数和值

## document 
　　
+ 类似sql中的row，默认有特殊键_id    
+ 键值对有序
+ 类型、大小写区分
+ 键不能重复

## 启动

+ `mongod --dbpath  [path]`	 默认`C:\data\db`, 启动后查看 `http://localhost:27017/`
+ `mongod --dbpath [dbpath] --logpath [logpath] --install --serviceName "MongoDB"`
+ `mongod --rest` 打开restful服务，查看`http://localhost:28017`
+ `net start MongoDB`  启动win service服务

## mongo shell  
    
+ `mongo`(打开shell)
+ `show dbs` //查看所有数据库
+ `use [database name]`
+ `db.dropDatabase()`  //删除当前数据库
+ `show collections()`             //查看当前数据库的所有集合
+ db.[集合名]                 //db(指向当前数据库)  
+ db.[collection].insert(obj)      //插入文档
+ db.[collection].find()/findOne() 
    
	 find({},{'column':1}) //1只显示column,0排除column列

+ db.[collection].update(obj1,obj2)        //obj1 更新条件 obj2 要替换的文档
+ db.[collection].remove(obj)        //obj 删除条件    db.[collection].remove({}) 删除所有

## auth

+ `mongod --auth` 数据库开启权限认证
+ admin中的用户可以访问所有数据库，也可为每个数据库建立权限认证(选择数据库，创建用户)
+ root用户有最高权限
```js
use admin
db.createUser({"user":"super","pwd":"super","roles":["root"]})

use admin
db.auth("super","super")
```
+ `mongo -u "myUserAdmin" -p "abc123" --authenticationDatabase "admin"` client端认证
+ connectionstring认证 mongodb://[username:password@]host1[:port1][,host2[:port2],...[,hostN[:portN]]][/[database][?options]]

        [database]是用于认证的数据库，如果没有则[username:password@]会向admin认证



## install windows service for mongo

+ `"C:\Program Files\MongoDB\Server\3.2\bin\mongod.exe" --auth --logpath "C:\Data\logs\mongodb.log" --logappend --dbpath "C:\Data\db" --serviceName "MongoDB Service" --serviceDisplayName "MongoDB Service" --install`

## tools

+ Robomongo

## ref

+ [mongo restful](https://docs.mongodb.org/ecosystem/tools/http-interfaces/)
+ [tutorialspoint](http://www.tutorialspoint.com/mongodb/mongodb_drop_database.htm)
+ [createuser](https://docs.mongodb.com/manual/reference/command/createUser/)
+ [connection string url format](https://docs.mongodb.com/manual/reference/connection-string/)	
+ [mongodb聚合](http://www.runoob.com/mongodb/mongodb-aggregate.html)
+ [mongodb aggregation](https://docs.mongodb.com/manual/aggregation/)
+ [mongodb aggregation quick reference](https://docs.mongodb.com/manual/meta/aggregation-quick-reference/)



	
	   
