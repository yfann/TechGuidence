
# Dojo DOM

## dojo/dom

+ dom.byId(param)(=getElementById())  [param:string/DomNode]

## dojo/dom-construct

+ create()

```js
 domConstruct.create("li", {
            innerHTML: "Seven",
            className: "seven",
            style: {
                fontWeight: "bold"
            }
        }, list);

```
+ place()

```js
    var four = dom.byId("four"),
        three = dom.byId("three");

    domConstruct.place(three, four, "after");
```

+ destroy()  //clean node and its children

```js
    var list = dom.byId("list"),
        items = list.getElementsByTagName("li");
    domConstruct.destroy(items[0]);
```

+ empty() //clean node's children

+ positions:

    + before
    + after+ replace
    + only
    + first
    + last

## dojo/query

+ return a [dojo/NodeList]

```js
var odds1 = query("#list .odd");

var odds2 = query(".odd", dom.byId("list"));

var oddA = query("a.odd");

```

## [dojo/dom-class](http://dojotoolkit.org/reference-guide/1.10/dojo/dom-class.html)

## [dojo/_base/html](http://dojotoolkit.org/reference-guide/1.10/dojo/_base/html.html#dojo-base-html)

## dojo/NodeList 

+ returned by dojo/query()

+ create a node list
```js
require(["dojo/query", "dojo/dom"], function(query, dom){
  var nodelist = query.NodeList();
  nodelist.push(dom.byId("someId"));
  nodelist.push(dom.byId("someOtherId"));
  // nodelist now contains the two DOM nodes
});
```

+ add events(on is in dojo/query)
```js
require(["dojo/query", "dojo/domReady!"], function(query) {
    query(".hookUp").on("click", function(){
        alert("This button is hooked up!");
    });//doesn't return nodelist chain,return an array of handles that can be removed
});
```

+ instantiate()

```js
require(["dojo/query", "dijit/form/Button"], function(query, Button){
  // Converts all button nodes to dijit/form/Buttons
  query("button").instantiate(Button, {
    showLabel: true
  });
});
```

## Dojo/NodeList-dom

```js
require(["dojo/query", "dojo/NodeList-dom", "dojo/domReady!"], function(query) {
    query(".odd").addClass("red");
    query(".even").addClass("blue");
});

query(".odd").removeClass("red").addClass("blue");

query(".even").style("color", "white").addClass("italic");
```

## Events with Dojo

+ dojo/on(work with DOM events)

   //event delegate, need [dojo/query], on(parent element, "selector:event name",handler) 

+ dojo/topic



## Ref

+ [Dojo DOM](http://dojotoolkit.org/documentation/tutorials/1.10/dom_functions/index.html)
+ [dom-construct](http://dojotoolkit.org/reference-guide/1.10/dojo/dom-construct.html#dojo-dom-construct-place)
+ [NodeList](http://dojotoolkit.org/reference-guide/1.10/dojo/NodeList.html)
+ [dojo/NodeList-data](http://dojotoolkit.org/reference-guide/1.10/dojo/NodeList-data.html#dojo-nodelist-data)
+ [dojo events](http://dojotoolkit.org/documentation/tutorials/1.10/events/)
