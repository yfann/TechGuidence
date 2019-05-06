# Dojo Lib

## dojo/_base/lang

+ hitch(scope.method) 绑定函数执行上下文

```js
var foo = { bar: function(a, b, c){ console.log(a, b, c); } };
var fn = lang.hitch(foo, "bar", 1, 2);
fn(3); // logs "1, 2, 3"

var foo = { bar: 2 };
lang.hitch(foo, function(){ this.bar = 10; })();
```


