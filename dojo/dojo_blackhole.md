## issues
+ _WidgetsInTemplateMixin 中引入的控件使用 set('value') 会出现错误 'Cannot use 'in' operator to search for 'innerHTML' in null'

+ 可以继承DndFromDojo及重写它的方法，在重新注册时需要解绑事件

```js
    if(dojox.mdnd.adapter._dndFromDojo && dojox.mdnd.adapter._dndFromDojo.unsubscribeDnd){
        dojox.mdnd.adapter._dndFromDojo.unsubscribeDnd();
    }

    dojox.mdnd.adapter._dndFromDojo = null;
    dojox.mdnd.adapter._dndFromDojo = new mdfd();
```