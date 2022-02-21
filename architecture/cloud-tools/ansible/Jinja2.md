# Jinja2

+ 循环和条件语句
    + playbook中没有

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

## ref

+ [Builtin Filters](https://jinja.palletsprojects.com/en/3.0.x/templates/#builtin-filters)