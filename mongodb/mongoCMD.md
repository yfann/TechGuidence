## mongodb备份，还原，导出
+ `mongodump -h <IP> --port <端口> -u <用户名> -p <密码> -d <数据库> -o <备份路径>` 备份数据库，去掉-d是所有数据
+ `mongorestore -h <IP> --port <端口> -u <用户名> -p <密码> -d <数据库> --drop <还原路径>`还原数据库
+ `mongoexport -h <IP --port <端口> -u <用户名> -p <密码> -d <数据库> -c <表名> -f <字段> -q <查询条件> -o <导出路径> --csv`导出表或表中的字段

>example:
>-f name,email,age
>-q '{uid:{$gt:1}}'

+ `mongoimport -h <IP> --port <端口> -u <用户名> -p <密码> -d <数据库> -c <表名> --upsert --drop <导入文件>`导入表
>--upsert 插入或者更新现有数据
>--upsertFields <字段名> 类似于upsert，更新只作用于字段
>`mongoimport -d test -c users --type csv --headerline --file users.csv`还原csv