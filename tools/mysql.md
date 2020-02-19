## MAC中的CMD
+ `export PATH=$PATH:/usr/local/mysql/bin`
+ `mysql --version`
+ `mysql -u root -p`
<!-- 启动MySQL服务 -->
+ `sudo /usr/local/MySQL/support-files/mysql.server start/stop/restart`  

## mysql
+ `show databases;`
- `exit`
- `reset master` 解决导入数据时的问题@@GLOBAL.GTID_PURGED问题
<!-- 修改密码 -->
+ `set global validate_password_policy=0;`
+ `alter user 'root'@'localhost' identified by '123456';`
## MAC 中卸载mysql
sudo rm /usr/local/mysql
sudo rm -rf /usr/local/mysql*
sudo rm -rf /Library/StartupItems/MySQLCOM
sudo rm -rf /Library/PreferencePanes/My*
edit /etc/hostconfig and remove the line MYSQLCOM=-YES-
rm -rf ~/Library/PreferencePanes/My*
sudo rm -rf /Library/Receipts/mysql*
sudo rm -rf /Library/Receipts/MySQL*
sudo rm -rf /private/var/db/receipts/mysql

## issues

+ 导入数据时`@@GLOBAL.GTID_PURGED cannot be changed: the added gtid set must not overlap with @@GLOBAL.GTID_EXECUTED`


## ref
+ [Mysql| 命令行模式访问操作mysql数据库.](https://blog.csdn.net/u011479200/article/details/78511073)
