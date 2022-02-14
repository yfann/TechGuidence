## MAC command with no password

+ `sudo chmod u-w /etc/sudoers`
+ `sudo vi /etc/sudoers`
+ `%admin ALL=(ALL) NOPASSWD: ALL` admin用户组不用密码执行sudo
    + `%admin` admin用户组
    + `admin` admin单个用户