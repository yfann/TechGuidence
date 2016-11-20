# Dojo

+ dojo
+ dijit
+ dojox
+ util
+ dgrid
+ gridx

## [AMD loader](https://dojotoolkit.org/documentation/tutorials/1.10/modules/)(加载dojo.js或require.js时会得到AMD loader)

```js
//require的处理过程：
//1. 解析出模块的url
//2. 在页面创建新的script,并设置url到src
//3. 模块脚本加载后调用define函数
//4. 把模块的引用指向返回的value

//tips：
//dojo默认是同步加载模块的
//异步开启配置：
<script data-dojo-config="async: true" src="js/lib/dojo/dojo.js"></script>
```


+ define() 

```js
define(5);
//不能引用其他模块
define({
    library: 'dojo',
    version: 1.10
});
// 可以引用其他模块,function只执行一次，返回值会被loader缓存
define(['others'],function(other){
    var privateValue = 0;
    return {
        getValue: function(){
            return privateValue;
        }
    };
});

```

+ require() 

```js
//模块路径

require({
    baseUrl: "/js/",
    packages: [
        { name: "dojo", location: "//ajax.googleapis.com/ajax/libs/dojo/1.10.4/" },
        { name: "my", location: "my" }
    ]
}, [ "my/app" ]);
//条件加载模块
define([
    "dojo/dom",
    "dojo/dom-construct",
    "dojo/on",
    "require"//不会丢失上下文，Context-sensitive require
], function(dom, domConstruct, on, require){
    on(dom.byId("debugButton"), "click", function(){
        require([ "./debug/console" ], function(console){
            domConstruct.place(console, document.body);
        });
    });
});
```
+ declare()

```js
define([
    "dojo/_base/declare",
    "dojo/dom",
    "app/dateFormatter"
], function(declare, dom, dateFormatter){
    return declare(null, {
        showDate: function(id, date){
            dom.byId(id).innerHTML = dateFormatter.format(date);
        }
    });
});

require([
    "app/DateManager"
], function(DateManager){
    var dm = new DateManager();
    dm.showDate('dateElementId', new Date());
});
```
+ pulgin

```js
// in "my/app.js"
define(["dojo/dom", "dojo/domReady!"], function(dom){
    // This function does not execute until the DOM is ready
    dom.byId("someElement");
});
```

## Tips

+ `lang.mixin()` //可以保持同一个引用对象

## Ref

+ [official](https://dojotoolkit.org/)
+ [guidance](https://dojotoolkit.org/reference-guide/1.10/)
+ [Creating Classes](https://dojotoolkit.org/documentation/tutorials/1.10/declare/)
+ [Configureing Dojo](https://dojotoolkit.org/documentation/tutorials/1.10/dojo_config/)
+ [Advanced AMD](https://dojotoolkit.org/documentation/tutorials/1.10/modules_advanced/)
+ [Dojo loader](https://dojotoolkit.org/reference-guide/1.10/loader/)
+ [parser](https://dojotoolkit.org/reference-guide/1.10/dojo/parser.html)
