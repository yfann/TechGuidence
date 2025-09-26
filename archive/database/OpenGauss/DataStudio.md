# Data Studio
+ omm 没有远程登录能力需要建新账号
    + `create user jamy2 identified by 'Abc123456*';`
    + `grant all privileges to jamy2;`
+ `vi /opt/openGauss/data/dn/pg_hba.conf`
    + 添加`host    all    all    0.0.0.0/0  sha256`

