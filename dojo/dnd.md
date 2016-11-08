# drag and drop [dojo/dnd](http://dojotoolkit.org/reference-guide/1.10/dojo/dnd.html)

## event

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

## ref
+ [购物车](http://blog.csdn.net/dojotoolkit/article/details/7371849)