


## assert

```yaml
---
- hosts: all
  vars:
    foo: ""
  tasks:
    - name: fail when the 'foo' variable is undefined
      fail: 
       msg: the 'foo' variable is undefined
      when: foo is undefined

    - name: fail when the 'foo' variable is empty
      fail: 
       msg: the 'foo' variable is empty
      when: foo | length == 0

```


## if

```yaml

- set_fact:
  foo: "{% if foo == 'hello' %}Hello{% elif foo == 'world' %}World{% else %}false{% endif %}"
```


## ref

+ [Ansible - when parameter (if else statement)](http://www.freekb.net/Article?id=2251#:~:text=Ansible%20-%20when%20parameter%20%28if%20else%20statement%29%20The,when%20a%20condition%20evaluates%20to%20true%20or%20false.)