# ansible inventory

+ inventory host file
    + host file
        + add `localhost` by defualt


+ groups,Aliases
```
newyork.example.com
seoul.example.com
sydney.example.com
[vagrant]
vagrant1 ansible_port=2222
vagrant2 ansible_port=2200
vagrant3 ansible_port=2201
```

+ groups of groups
```
[django:children]
web
task
```

+ pets vs cattle

```ini
[web]
web[1:20].example.com

; web1.example.com
; ...
; web20.example.com
```

+ hosts and group variables
    + 可以定义任意变量，在Playbook中使用
```ini
vagrant1 ansible_host=127.0.0.1 ansible_port=2222
vagrant2 ansible_host=127.0.0.1 ansible_port=2200
vagrant3 ansible_host=127.0.0.1 ansible_port=2201
```

```ini
; group变量
; [<group name>:vars]
[all:vars]
ntp_server=ntp.ubuntu.com
[production:vars]
db_primary_host=frankfurt.example.com
db_primary_port=5432
```

+ yaml单独存放变量
    + `{{ db.primary.host }}`
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

## dynamic inventory

+ `chmod +x vagrant.py`
+ `ansible-doc -t inventory -l`
    + `ansible-doc -t inventory <plugin name>`
+ ` ansible-inventory -i inventory/hosts --host=vagrant2`
+ support flags
    + `--host=<hostname>`
    + `--list`