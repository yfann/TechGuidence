# Oracle


## query
+ `like "sss%"`



## create user
+ tips
    + 默认创建的用户名都会大写，除非引号括起来

+ `CREATE USER <username> IDENTIFIED BY <pwd>;`
    + `ALTER USER <username> IDENTIFIED BY <pwd>;`

+ `GRANT DBA TO your_user;`

<!-- 赋予查询权限 -->
+ `GRANT CONNECT, RESOURCE TO <username>;`
    + `GRANT SELECT ANY TABLE TO <username>;`

<!-- 查看所有用户状态 -->
+ `SELECT USERNAME, ACCOUNT_STATUS FROM DBA_USERS WHERE USERNAME = 'DICOM_USER';`
<!-- 查看DBA用户 -->
+ `SELECT USERNAME FROM DBA_USERS;`



## sqlplus
+ tips
    + 只有dba可以登录sqlplus
+ `sqlplus sys/sys as sysdba;`


## 测试
+ `tnsping <ip>:1521/<server name>`
    + server name在文件（C:\Oracle\product\19\db\network\admin\tnsnames.ora）中找到
        + SERVICE_NAME or sid


## connection string
+ `OracleConnection con = new OracleConnection("Data Source=<ip>:1521/<server name>;User Id=<user>;Password=<pwd>;")`