
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

## ref
+ [Roles](https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html)  
