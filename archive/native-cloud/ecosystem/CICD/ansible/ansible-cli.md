

## ansible-playbook
+ `ansible-playbook -h`
    + `-t` tags
    + `-v` `-vv` `-vvv` 详细信息

+ `ansible-playbook example.yml -i xxx.ini --tags "configuration,packages" `
    + `ansible-playbook release.yml --extra-vars '{"version":"1.23.45","other_variable":"foo"}'`


## ref
+ [Working with command line tools](https://docs.ansible.com/ansible/latest/user_guide/command_line_tools.html)