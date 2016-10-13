# SourceCode Reading

# Tips

+ `typeof exports !== ''undefined`
+ `void 0 === undefined` void表达式只返回undefined，老的浏览器中undefined不是保留关键字
+ `Infinity`
+ apply arguments
```js
    return function(){
        func.apply(context,arguments);
    };
```
+ `(keys || obj).length`
# Ref

+ [underscore sourcecode](http://underscorejs.org/docs/underscore.html)