

## tips

+ `dict={}`
    + `dict['xxx']` 访问不存在的key时会报错

+ `dict=defaultdict(<factory_function>)`
    + `<factory_function>`
        + list
            + []
        + set
            + set()
        + str
            + ""
        + int
            + 0
    + key不存在时返回<factory_function>的默认值