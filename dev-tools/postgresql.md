+ `select current_database();`
+ `select user;`
<!-- 模式 -->
+ `CREATE SCHEMA myschema;`
    + `CREATE SCHEMA schemaname AUTHORIZATION username;`
+ `DROP SCHEMA myschema;`
    + `DROP SCHEMA myschema CASCADE;` 删除模式以及其中的对象
+ `SHOW search_path;` 当前的模式上下文
    + 写sql语句表名不用加模式,`DROP TABLE mytable;`,会在当前上下文中查找
+ `SET search_path TO myschema,public;`

## 模式

+ 数据库包含多个模式,模式包含表。
+ 同名对象在不同模式中不冲突
+ database.schema.table
+ `CREATE TABLE products ( ... );`等同于`CREATE TABLE public.products ( ... );`



## ref
+ [PostgreSQL 9.4.4 中文手册](http://www.postgres.cn/docs/9.4/index.html)
+ [PostgreSQL 教程](https://www.runoob.com/postgresql/postgresql-tutorial.html)

+ [Connection Parameters](https://jdbc.postgresql.org/documentation/head/connect.html)
+ [pq - A pure Go postgres driver for Go's database/sql package](https://pkg.go.dev/github.com/lib/pq#hdr-Connection_String_Parameters)


+ [postgresql SSL Support](https://www.postgresql.org/docs/9.1/libpq-ssl.html)