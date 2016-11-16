
## [Dijit Basics](http://dojotoolkit.org/reference-guide/1.7/dijit/info.html#dijit-info)

+ `dijit.byId()`  return instance widget  `dojo.byId()` return domnode

+ place a dijit to dom

```js
var thinger = dijit.byId("foobar");
dojo.place(thinger.domNode, dojo.body(), "last");

```

+ dijit id

```js
var dialog = new dijit.Dialog({
   id:"myDialog",
   title:"Programmatic"
});
dialog.startup();
// compare them:
console.log(dijit.byId("myDialog") == dialog);
```

+  用dom创建widget

```js
var node = dojo.byId("makeADialog");
var dialog = new dijit.Dialog({ title:"From Source Node" }, node);
dialog.show();
```

+ dom和widget相互转化

```js
var w = dijit.byId("myDialog");
var node = w.domNode; // this is a bad example, but illustrates the relationship
var widget = dijit.byNode(node); // now, w == widget
widget.show();
```

+ get()/set()/watch()

+ domNode/containerNode/declaredClass

+ `dijit.getEnclosingWidget(domNode)`

+ `dijit.byNode(domNode)` //通过node找到关联的dijit instance

```js
dojo.connect(someNode, "onclick", function(e){
    var w = dijit.byNode(e.target);
    if(w){ w.show(); }
});
```