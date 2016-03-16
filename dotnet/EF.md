##EntityFramework

+ PM> Install-Package EntityFramework

##Migration [#](http://www.cnblogs.com/panchunting/p/entity-framework-code-first-migrations.html)

+ PM> Enable-Migrations   //生成migrations文件
+ PM> Add-Migration [name]     //代码变动后基于上一次的迁移生成新的迁移文件
+ PM> Update-Database [-TargetMigration:name]   //更新到数据库
+ PM> Update-Database –TargetMigration: $InitialDatabase //到空数据库