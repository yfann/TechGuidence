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
+ `cd ~`
+ `find . | grep ansible`
+ `export PATH="<bin/ansible path>:$PATH"`
    + add to .zshrc
    + `source ~/.zshrc`

<!-- test -->
+ Vagrant (for test server)

<!-- kubectl config-->
+ `export KUBECONFIG=/etc/rancher/k3s/k3s.yaml`
+ `kubectl get pods --all-namespace`

## cmd
+ `ansible + [Tab] + [Tab]`
+ `ansible <server name> -i <xxx.ini> -m ping -vvvv`
    + `ansible <server name> -m ping`
        + set defaults in ansible.cfg
    + `-m <module> -a <arguments>`
        + `-m <module> -a <cmd>`
            + command module is default module
            + `ansible <server> -a <cmd>`
                + `<cmd>`
                    + `"tail /var/log/dmesg"`
                        + 命令中有空格要加引号
        + `-a <arguments>`
            + 多个参数空格隔开，外面加引号
            + 模块参数
    + `-b`
        + root user
    + `ansible <server> -b -m package -a name=nginx`
        + 安装nginx

<!-- all -->
+ `ansible all -a "date"`
    + 向所有hosts发命令

+ `ansible all -m ping -u <user> --sudo --sudo-user <sudo user>`
+ `ansible all -a "/bin/echo hello"`

<!-- inventory -->
+ `ansible-inventory --graph`

<!-- playbook -->
+ `ansible-playbook -i hosts playbook.yml -e "@var.yml" --key-file "~/.ssh/mykey.pem"`
+ `ansible-playbook --list-tasks xxx.yml`
    + -C
        + 检查，不真实执行
    + --list-hosts
    + --list-tasks
    + -t [TAGS]
        + 只执行指定标签任务
    + --skip-tags=[TAGS]
        + 跳过tag
    + --start-at-task=[TAGS]
        + 指定任务开始执行

<!-- 模块说明文档 -->
+ `ansible-doc <module>`
+ `ansible-doc -l | grep ^apt`
+ `ansible-doc -t lookup -l`
    + `ansible-doc -t lookup <plugin name>`


## variables

+ 可以在task和template files中使用

+ `command: "{{ myapp }} -a foo"`
    + 使用变量时加引号

## handlers

+ 根据task的执行结果执行（state change）
    + 所有task执行完后才执行
    + 只执行一次
    + 按定义顺序执行
    + 一般用来重启服务

+ `meta: flush_handlers`
    + run in the middle of play

## config

+ `/etc/ansible/ansible.cfg`  主配置文件,配置ansible工作特性(一般无需修改)
+ `/etc/ansible/hosts`        主机清单(将被管理的主机放到此文件)
+ `/etc/ansible/roles/`       存放角色的目录

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
+ [ansible使用教程](https://python.iitter.com/other/94867.html#1.Ansible%E5%8F%91%E5%B1%95%E5%8F%B2)

+ [Ansible Configuration Settings](https://docs.ansible.com/ansible/latest/reference_appendices/config.html)
+ [Ansible的配置文件](https://ansible-tran.readthedocs.io/en/latest/docs/intro_configuration.html)
+ [ansible filters](https://github.com/ansiblebook/ansible-filter-plugins)