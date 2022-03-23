
## OpenSSH
+ `ssh user@host`
    + 默认端口22
    + `ssh -p 2222 user@host`

<!-- 公钥登录 -->
+ `ssh-keygen` 生成公钥
    + HOME/.ssh/
        + id_rsa.pub
        + id_rsa
+ `ssh-copy-id user@host`上传公钥
    + 公钥会被放在远程主机的`$HOME/.ssh/authorized_keys`
    + `ssh user@host 'mkdir -p .ssh && cat >> .ssh/authorized_keys' < ~/.ssh/id_rsa.pub`
        + 登录远程主机，在远程主机执创建authorized_keys，本地公钥重定向输出到authorized_keys中
+ `service ssh restart` 重启远程主机的ssh服务(ubuntu)



## 登录

+ 密码登录
    + 客户端发送登录请求，服务端发送公钥给客户端
    + 客服端发送公钥加密后的密码给服务端
    + 服务端私钥解密密码
    + ssh的公钥没有CA认证，自己签发
        + Man-in-the-middle attack（中间人攻击,冒充服务端发公钥以获取密码）
    + `$HOME/.ssh/known_hosts`保存接收的公钥

+ 公钥登录
    + 用户提交自己的公钥到服务器
    + 服务器向用户发随机字符串
    + 用户私钥加密后发给服务端
    + 服务端用用户的公钥解密对比

## 远程操作
+ `cd && tar czv src | ssh user@host 'tar xz'` $HOME/sr/下的所有文件 copy到 远程主机的 $HOME/src下
    + 单引号中间的操作表示在远程服务器执行
+ `ssh user@host 'mkdir -p .ssh && cat >> .ssh/authorized_keys' < ~/.ssh/id_rsa.pub`

## scp
+ `scp -i C:/app/OpenVPN/hsc-operation-key/id_rsa -r ***@****:/home/hscadmin/fan C:\backup\ali_ssh `
    + `-r` copy folder
    
+ `scp local_file remote_username@remote_ip:remote_folder`
    + from local_file to remote
    
## tips
+ PuTTY(windows)
+ OpenSSH


## issues

+ `Permissions 0777 for 'xxx.pem' are too open.`
    + chmod 600 ./xxx.pem
        + xxx.pem should not be accessed by others

+ disconnect issue
```sh

# $HOME/.ssh/config 

TCPKeepAlive yes
ServerAliveInterval 30
```

## ref

+ [SSH原理与运用（一）：远程登录](http://www.ruanyifeng.com/blog/2011/12/ssh_remote_login.html)
+ [PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/)
+ [SSH 教程](https://wangdoc.com/ssh/)