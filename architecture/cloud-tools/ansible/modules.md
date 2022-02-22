
## cmd
+ `ansible-doc <module>`
    + 查询模块
+ `ansible-doc -l`
    + 列出模块

## apt
+ update_cache: true
+ `apt-cache policy <lib>`
+ `apt-get install libssl-dev`
+ `apt-get update`

## modules

+ `ansible web -m command -a "chdir=/ ls ./"`
+ `ansible web -m shell -a "echo hello world "`

+ `ansible web -m copy -a "src=/etc/hosts  dest=/root/a1.hosts mode=777 owner=root group=root"`
    + 本机复制到远程web
+ `ansible 192.168.100.20 -m hostname -a "name=test"`
    + 更改远程主机名

+ `ansible web -m yum -a "name=httpd  state=present"`
+ `ansible web -m service -a "name=httpd enabled=yes state=restarted"`
    + 重启remote host的服务
+ `ansible web -m user -a "name=user01system=yes uid=502 group=root groups=root shell=/etc/nologinhome=/home/user01 password=pwd@123"`
    + 给remote host创建用户

## tips

+ command
+ shell

## ref

+ [Module index](https://docs.ansible.com/ansible/2.9/modules/modules_by_category.html)

+ [ansible.builtin.package](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/package_module.html#ansible-collections-ansible-builtin-package-module)