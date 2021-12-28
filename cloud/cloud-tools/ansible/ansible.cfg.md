## ansible.cfg

+ `~/.ansible.cfg`

+ `/etc/ansible/hosts` default location for the inventory file



## samples of ansible.cfg

```ini
[defaults]
inventory = inventory

[inventory]
enable_plugins = host_list, script, auto, yaml, ini, toml
```