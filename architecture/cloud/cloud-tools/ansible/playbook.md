# playbook

+ hosts：任务的目标主机，多个主机用冒号分隔，一般调用/etc/ansible/hosts中的分组信息；remote_user：远程主机上，运行此任务的默认身份为root；
+ tasks：任务，即定义的具体任务，由模块定义的操作列表；
+ handlers：触发器，类似tasks，只是在特定的条件下才会触发的任务。某任务的状态在运行后为changed时，可通过“notify”通知给相应的handlers进行触发执行；
+ roles：角色，将hosts剥离出去，由tasks、handlers等所组成的一种特定的结构集合

## vars

```yaml
vars:
  tls_dir: /etc/nginx/ssl/
  key_file: nginx.key
```

+ vars_files
```yaml
vars_files:
  - nginx.yml

# nginx.yml
# key_file: nginx.key
# cert_file: nginx.crt
```

+ `- debug: var=myvarname`
    + viewing the values of variables

+ register (获取命令的结果)
```yaml
- name: Capture output of whoami command
  command: whoami
  register: login

# 不同moduel的返回值不同，debug状态查看
# ---
# - name: Show return value of command module
#   hosts: fedora
#   gather_facts: false
#   tasks:
#     - name: Capture output of id command
#       command: id -un
#       register: login

#     - debug: var=login
#     - debug: msg="Logged in as user {{ login.stdout }}"
# ...


# result['stat']['mode']
# result['stat'].mode
# result.stat['mode']
# result.stat.mode

```

+ Built-in vaariables
    + hostvars  
        + `{{ hostvars['db.example.com'].ansible_eth1.ipv4.address }}`

+ `gather_facts: true`

+ host info
    + ansible_os_family
    + ansible_distribution 

+ `ansible ubuntu -m setup`
    + get all facts
    + filter
        + `ansible all -m setup -a 'filter=ansible_all_ipv6_addresses'`

+ key words
    + ansible_facts

+ modules
    + service_facts
    + set_fact
        + `nginx_state: "{{  ansible_facts.services[' nginx.service']['state'] }}"`

+ /etc/ansible/facts.d/xx.fact
    + ini or JSON
    + remote hosts
    + key words
        + ansible_local
```ini
; /etc/ansible/facts.d/example.fact

[book]
title=Ansible: Up and Running
authors=Meijer, Hochstein, Moser
publisher=OReilly

; plyabook可以被读取
; {{ ansible_local.example.book.title }}
```

## roles

+ 可复用的playbook
+ `dependencies:`
    + <project-top-level-directory>/roles/requirements.yml
+ Ansible Galaxy 
    + is an open-source repository of Ansible roles
    + `ansible-galaxy role init --init-path playbooks/roles web`
    + `ansible-galaxy install oefenweb.ntp`
        + `ansible-galaxy remove oefenweb.ntp`
    + `ansible-galaxy list`

## Jinja2 template

+ default filter
    + `{{ database_host | default('localhost') }}`
        + if database_host is not defined then 'localhost' it is
+ Filters for Registered Variables
    + failed
        + `failed_when: result|failed`
    + changed
    + success
    + skipped
+ Filters That Apply to File Paths
    + basename
        + `files/{{ homepage | basename }}`
    + dirname
    + expanduser
    + realpath

+ `{{ domains|surround_by_quotes|join(", ") }}`


+ FilterModule
    + ~/.ansible/plugins/filter
    + /usr/share/ansible/plugins/filter
    + filter_plugins

## lookup
+ read in configuration data from various sources
    + ~/.ansible/plugins/lookup
+ `{{ lookup('file', '~/.ssh/id_ed25519.pub') }}`
+ `{{ lookup('env', 'SHELL') }}`
+ `{{ lookup('template', 'message.j2') }}`
+ `{{ lookup('redis', 'weather','temp') }}`

## loop

+ `until: <result> is success`
    + ` register: <result> `
+ with_items
+ loop
+ with_lines


## tips

+ `"changed": true`
    + cmd,shell module will always set to `true`

+ `ignore_errors: true`

+ `failed_when: false`
    + the execution doesn't stop if the module returns failure
    + ` failed_when: result|failed`

+ `changed_when`
    + when condition is met then changed is reported
    + `changed_when: '"Creating tables" in result.out|default("")'`
        + default value

+ `-e`
    + `ansible-playbook 4-12-greet.yml -e greeting="hiya sss"`
        + set variables in command line
    + `ansible-playbook 4-12-greet.yml -e @4-13-greetvars.yml`
        + 4-13-greetvars.yml contents
            + `greeting: hiya`
    + `{{ variable }}`
        + display any vars given with `-e`

+ precedence of vars

+ `become: true`
    + run as ot

+ `delegate_to: localhost`
    + 可以创建remotehost to localhost的fact

## ref

+ [Playbooks 介绍](https://ansible-tran.readthedocs.io/en/latest/docs/playbooks_intro.html)