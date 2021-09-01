# drag and drop [dojo/dnd](http://dojotoolkit.org/reference-guide/1.10/dojo/dnd.html)

+ Container

+ Selector

+ source

+ Manager

+ Avatar

## property

+ `withhandles=true`

## supported widget

+ [dojox/layout/GridContainer](http://dojotoolkit.org/reference-guide/1.10/dojox/layout/GridContainer.html)

## event

+ `onDropInternal`
+ `onDndCancel`

+ aspect

```js
function setListCount(){  
    query(".count", this.node)[0].innerHTML = this.getAllNodes().length;  
}  
aspect.after(cart, "onDrop", setListCount);  
```


+ topic

```js
topic.subscribe("/dnd/drop", glowTarget); 
function glowTarget(source, nodes, copy, target){  
    domClass.add(target.node, "glow");  
    setTimeout(lang.hitch(domClass, "remove",  
        target.node, "glow"), 1000);  
} 
```
## [GridContainer](http://dojotoolkit.org/reference-guide/1.10/dojox/layout/GridContainer.html)


## ref
+ [购物车](http://blog.csdn.net/dojotoolkit/article/details/7371849)
+ [dragable todo list](http://localhost:8004/lib/dgrid/demos/todo/)
+ [dnd theme](http://localhost:8004/lib/dijit/themes/themetester-orig.html)
+ [dragable pane](http://localhost:8004/lib/dojox/gfx/demos/roundedpane.html)