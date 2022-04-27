
## vars

+ yaml
```yaml

- hosts: app_servers
  vars:
       app_path: "{{ base_path }}/22"
```

## Facts

+ Facts通过访问远程系统获取相应的信息

+ `ansible hostname -m setup`
    + `{{ ansible_devices.sda.model }}`

+ 自定义facts
    + `/etc/ansible/facts.d/perferences.fact`
        + {{ ansible_local.preferences.general.asdf }}
```ini
[general]
asdf=1
bar=2

; return
; "ansible_local": {
;         "preferences": {
;             "general": {
;                 "asdf" : "1",
;                 "bar"  : "2"
;             }
;         }
;  }
```

## register

+ 命令结果存储到一个变量中
```yaml
  tasks:
     - shell: /usr/bin/foo
       register: result
       ignore_errors: True

# result['stat']['mode']
# result['stat'].mode
# result.stat['mode']
# result.stat.mode

# result.json

# 使用
# password: "{{user_pwd.stdout}}"

```



## 变量文件
```yaml
- hosts: all
  remote_user: root
  vars:
    favcolor: blue
  vars_files:
    - /vars/external_vars.yml
```
+ external_vars.yml
```yaml
---
# in the above example, this would be vars/external_vars.yml
somevar: somevalue
password: magic
```


## 命令行传vars
+ `ansible-playbook –e varname=value`
+ `ansible-playbook release.yml --extra-vars "version=1.23.45 other_variable=foo"`
    + `--extra-vars '{"pacman":"mrs","ghosts":["inky","pinky","clyde","sue"]}'`
        + Ansible 1.2
    + `--extra-vars "@some_file.json"`
        + Ansible 1.3



## 变量优先级
+ extra vars (在命令行中使用 -e)优先级最高
+ 然后是在inventory中定义的连接变量(比如ansible_ssh_user)
+ 接着是大多数的其它变量(命令行转换,play中的变量,included的变量,role中的变量等)
+ 然后是在inventory定义的其它变量
+ 然后是由系统发现的facts
+ 然后是 "role默认变量", 这个是最默认的值,很容易丧失优先权

## tips

+ `loop: "{{clientIds}}"` 变量读取有时需要引号

+ `gather_facts: no`
    + 关闭facts获取

+ `{{ ansible_eth0["ipv4"]["address"] }}`
    + `{{ ansible_eth0.ipv4.address }}`

+ `- debug: var=myvarname`
    + viewing the values of variables

+ vars_prompt
    + CLI输入的变量

+ Built-in vaariables
    + hostvars
        + 可以访问其他主机的变量
        + `{{ hostvars['test.example.com']['ansible_distribution'] }}`
    + group_names
        + 主机所在所有组的列表
        + `{% if 'webserver' in group_names %}xxx{% endif %}`
    + inventory_hostname
        + 主机名称
    + groups
        + inventory中全部组
        + `{% for host in groups['app_servers'] %}`
    + play_hosts
        + play范围中的主机名
    + delegate_to
    + role_path
    + inventory_file
    + inventory_hostname
    + ansible_play_hosts

## ref
+ [Magic variables](https://docs.ansible.com/ansible/latest/reference_appendices/special_variables.html)
+ [facts](https://docs.ansible.com/ansible/latest/user_guide/playbooks_vars_facts.html)
+ [The Basics of Ansible Variables](https://www.mydailytutorials.com/the-basics-of-ansible-variables/)