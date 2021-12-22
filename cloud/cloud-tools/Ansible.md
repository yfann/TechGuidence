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
    + `vagrant init ubuntu/focal64`
    + `vagrant up`
    + `vagrant ssh`
    + `vagrant ssh-config`
    + `ssh vagrant@127.0.0.1 -p 2222 -i .vagrant/machines/default/virtualbox/private_key`
+ `ssh vagrant@127.0.0.1 -p 2222 -i .vagrant/machines/default/virtualbox/private_key`
+ `vagrant destroy -f`

## cmd

+ `ansible-playbook xxx.yml`

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
+ [Ansible](https://ansible-tran.readthedocs.io/en/latest/docs/intro.html)