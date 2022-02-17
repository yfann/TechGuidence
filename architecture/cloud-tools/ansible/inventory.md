# ansible inventory

+ `/etc/ansible/hosts` 
+ ini格式

## 变量

+ 变量可以独立出ini,单独yaml文件
```yml
---
db:
  user: widgetuser
  password: 'pFmMxcyD;Fc6)6'
  name: widget_production
  primary:
    host: frankfurt.example.com
    port: 5432
  replica:
    host: london.example.com
    port: 5432
rabbitmq:
  host: johannesburg.example.com
  port: 5672
...
```

+ 使用`{{ db.primary.host }}`

+ 变量文件路径
    + `/etc/ansible/group_vars/<group name>`
      + 可以是yaml文件或目录，目录中可包含多个文件
    + `/etc/ansible/host_vars/<host name>`
    +  Ansible 1.2 及以上的版本中,group_vars/ 和 host_vars/ 目录可放在 inventory 目录下,或是 playbook 目录下. 如果两个目录下都存在,那么 playbook 目录下的配置会覆盖 inventory 目录的配置.

+ `ansible-playbook -i <xx.ini> <playbook.yml> -e "@variables.yml" --key-file "xxx.pem"`

## dynamic inventory

+ 其他软件中保存inventory配置
    + 例如从云端加载inventory

+ `chmod +x vagrant.py`
+ `ansible-doc -t inventory -l`
    + `ansible-doc -t inventory <plugin name>`
+ ` ansible-inventory -i inventory/hosts --host=vagrant2`
+ support flags
    + `--host=<hostname>`
    + `--list`

## ref

+ [Inventory文件](https://ansible-tran.readthedocs.io/en/latest/docs/intro_inventory.html)