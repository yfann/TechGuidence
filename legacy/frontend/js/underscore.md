# SourceCode Reading

# Implement

+ _.isObject

```js
 _.isObject = function(obj) {
    var type = typeof obj;
    return type === 'function' || type === 'object' && !!obj;
  };
```

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

+ `hasOwnProperty.call(obj, key)`

# Ref

+ [underscore sourcecode](http://underscorejs.org/docs/underscore.html)