# playbook

+ hosts：任务的目标主机，多个主机用冒号分隔，一般调用/etc/ansible/hosts中的分组信息；remote_user：远程主机上，运行此任务的默认身份为root；

+ tasks：任务，即定义的具体任务，由模块定义的操作列表；

+ handlers：触发器，类似tasks，只是在特定的条件下才会触发的任务。某任务的状态在运行后为changed时，可通过“notify”通知给相应的handlers进行触发执行；

+ roles：角色，将hosts剥离出去，由tasks、handlers等所组成的一种特定的结构集合

+ playbook
    + play
        + hosts
        + vars
        + remote_user
        + tasks
        + handlers

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

## 条件语句

+ When
    + Jinjia2 表达式
```yaml
tasks:
  - name: "shutdown Debian flavored systems"
    command: /sbin/shutdown -t now
    when: ansible_os_family == "Debian"
```

+ Jinjia2过滤器
```yaml
tasks:
  - command: /bin/false
    register: result
    ignore_errors: True
  - command: /bin/something
    when: result|failed
  - command: /bin/something_else
    when: result|success
  - command: /bin/still/something_else
    when: result|skipped
```

+ 类型转换
```yaml
tasks:
  - shell: echo "only on Red Hat 6, derivatives, and later"
    when: ansible_os_family == "RedHat" and ansible_lsb.major_release|int >= 6
```

+ `when: bar is not defined`

+ 客户事件
```yaml
tasks:
    - name: gather site specific fact data
      action: site_facts
    - command: /usr/bin/thingy
      when: my_custom_fact_just_retrieved_from_the_remote_system == '1234'
```

+ roles
```yaml
- hosts: webservers
  roles:
     - { role: debian_stock_config, when: ansible_os_family == 'Debian' }
```

+ registry
```yaml

  tasks:

      - shell: cat /etc/motd
        register: motd_contents

      - shell: echo "motd contains the word hi"
        when: motd_contents.stdout.find('hi') != -1

        # with_items: home_dirs.stdout_lines
        # # same as with_items: home_dirs.stdout.split()
```

+ until
```yaml
- action: shell /usr/bin/foo
  register: result
  until: result.stdout.find("all systems go") != -1
  retries: 5
  delay: 10
```

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
```yaml
- name: add several users
  user: name={{ item.name }} state=present groups={{ item.groups }}
  with_items:
    - { name: 'testuser1', groups: 'wheel' }
    - { name: 'testuser2', groups: 'root' }
```

+ when
    + 会为每个item单独执行

+ with_nested

+ loop
+ with_lines

+ with_dict
```yaml
tasks:
  - name: Print phone records
    debug: msg="User {{ item.key }} is {{ item.value.name }} ({{ item.value.telephone }})"
    with_dict: "{{users}}"
```
+  with_fileglob



## playbook

+ yaml file
```yaml
#!/usr/bin/env ansible-playbook
# 可以直接执行yaml, ./xxx.yaml
---

...
```

## task

+ tasks
    + name
    + moudle: options

```yaml
tasks:
  - name: make sure apache is running
    service: name=httpd state=running
```



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

+ task在role之后执行
    + pre_tasks，post_tasks

+ tags可以部分运行playbook


## ref

+ [Playbooks 介绍](https://ansible-tran.readthedocs.io/en/latest/docs/playbooks_intro.html)
+ [samples](https://github.com/ansible/ansible-examples)

+ [Patterns](https://ansible-tran.readthedocs.io/en/latest/docs/intro_patterns.html)