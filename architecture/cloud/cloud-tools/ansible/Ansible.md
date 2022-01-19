# Ansible

+ configuration management tool
+ deployment tool
+ orchestrate deployment
    + in order
+ provisioning
    + spin up new virtual machine or SaaS
+ convergence(eventual consistent state)
    + the system may run multiple times to put a server into its desired state,with each run bringing the server closer to that state
    + Ansible runs a playbook a single time to put each server into the desired state.

## install
<!-- mac -->
+ `brew install ansible`
<!-- linux -->
+ `pip3 install --user ansible==2.9.20`
    + `python3 -m venv .venv --prompt A`
    + `source .venv/bin/activate`

+ Vagrant (for test server)


## cmd
+ `ansible <server name> -i <xxx.ini> -m ping -vvvv`
    + `ansible <server name> -m ping`
        + set defaults in ansible.cfg
    + `-m <module> -a <arguments>`
        + `-m command -a <cmd>`
            + command module is default module
            + `ansible <server> -a <cmd>`
                + `<cmd>`
                    + `"tail /var/log/dmesg"`
                        + 命令中有空格要加引号
        + `-a <arguments>`
            + arguments
                + 多个参数空格隔开，外面加引号

    + `-b`
        + root user
    + `ansible <server> -b -m package -a name=nginx`
        + 安装nginx

+ `ansible all -a "date"`
    + 向所有hosts发命令

<!-- inventory -->
+ `ansible-inventory --graph`

<!-- playbook -->
+ `ansible-playbook xxx.yml`
+ `ansible-playbook --list-tasks xxx.yml`

<!-- module -->
+ `ansible-doc <module>`
+ `ansible-doc -l | grep ^apt`

<!-- lookup -->
+ `ansible-doc -t lookup -l`
    + `ansible-doc -t lookup <plugin name>`

## modules

+ are scripts

+ modules
    + package
    + copy
    + file
    + service
    + template
    + uri
    + apt

## variables

+ 可以在task和template files中使用

+ `command: "{{ myapp }} -a foo"`
    + 使用变量时加引号

## handlers

+ 所有task执行完，才执行
    + `meta: flush_handlers`
        + run int the middle of play

+ state change 触发handler

+ 只执行一次（notify multiple times）

+ 按定义顺序执行

+ 一般用来重启服务



## playbook

+ yaml file
```yaml
#!/usr/bin/env ansible-playbook
# 可以直接执行yaml, ./xxx.yaml
---

...
```



## tips

+ domain-specific language (DSL)

+ remote hosts
    + linux
        + SSH
        + python
    + windows
        + WinRM

+ playbook中的task在多个hosts中同步执行

## ref
<!-- docs -->
+ [Ansible](https://ansible-tran.readthedocs.io/en/latest/docs/intro.html)
+ [User Guide](https://docs.ansible.com/ansible/latest/user_guide/index.html#getting-started)

+ [Ansible Configuration Settings](https://docs.ansible.com/ansible/latest/reference_appendices/config.html)
+ [Ansible的配置文件](https://ansible-tran.readthedocs.io/en/latest/docs/intro_configuration.html)
+ [ansible filters](https://github.com/ansiblebook/ansible-filter-plugins)