#MongoDB

##概念

   集合，文档，索引，服务端存取JavaScript的函数和值

###文档 
　　
   类似行，默认有特殊键_id    

+ 键值对有序
+ 类型、大小写区分
+ 键不能重复

##命令

###启动

    1. 新建路径C:\data\db
    2. cmd:  安装路径\mongod.exe   （Ctrl+C 停止执行）
	3. 查看http://localhost:27017/
	
	打开restful服务[#](https://docs.mongodb.org/ecosystem/tools/http-interfaces/
	mongod.exe --rest
	http://localhost:28017)
	
	
###mongo shell  
    
    + mongo(打开shell)
	+ use [database name]
	+ db(指向当前数据库)  db.[集合名]
	+ db.[collection].insert(obj)  (插入文档)
	+ db.[collection].find()/findOne()
	+ db.[collection].update(obj1,obj2)  //obj1 更新条件 obj2 要替换的文档
	+ db.[collection].remove(obj)  //obj 删除条件 可以为空
	
	
	
	   
