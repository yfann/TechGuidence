
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

## tips
+ include(可以带参数)
    + tasks
    + handlers
    + play

+ 如果 `roles/x/tasks/main.yml` 存在, 其中列出的 tasks 将被添加到 play 中
    + 所有 include tasks 可以引用 `roles/x/tasks/` 中的文件，不需要指明文件的路径。

## ref
+ [Roles](https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html)  
+ [Playbook 角色(Roles) 和 Include 语句](https://ansible-tran.readthedocs.io/en/latest/docs/playbooks_roles.html)

+ [Ansible Galaxy](https://galaxy.ansible.com/)


+ [share vars between roles](https://stackoverflow.com/questions/29305335/how-can-i-persist-an-ansible-variable-across-ansible-roles)
