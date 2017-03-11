

## Components

Data Store –> Model –> Tree

+ [dijit/Tree](https://dojotoolkit.org/reference-guide/1.10/dijit/tree/Model.html#dijit-tree-model)
    - getChildren()
    - mayHaveChildren()
    - pasteItem()  //drop item on tree and update store
    - onChildrenChange()

## Tips

+ 用Markup写的Tree，没有用Observable()包装store，store更新不会更新tree
+ update store to update tree
```js
var myStore=new Memory({data:[...])
myStore = new Observable(myStore);//update memory refresh tree
myModel = new ObjectStoreModel({
        store: myStore,
        query: { id: "world" }
    });

```
+ [_nodePixelIndent](https://dojotoolkit.org/api/?qs=1.7/dijit/Tree)  子节点缩进的像素

## Ref
+ [offical doc](https://dojotoolkit.org/reference-guide/1.10/dijit/Tree.html)
+ [dijit/Tree API](https://dojotoolkit.org/api/)
+ [dijit.tree.ObjectStoreModel](https://dojotoolkit.org/reference-guide/1.10/dijit/tree/ObjectStoreModel.html#dijit-tree-objectstoremodel)
+ [dijit.tree.Model](https://dojotoolkit.org/reference-guide/1.10/dijit/tree/Model.html#dijit-tree-model)
+ [dojo/store](https://dojotoolkit.org/reference-guide/1.10/dojo/store.html#dojo-store)
+ [dijit/tree/ForestStoreModel](https://dojotoolkit.org/reference-guide/1.10/dijit/tree/ForestStoreModel.html#dijit-tree-foreststoremodel)
+ [dnd sample](https://dojotoolkit.org/reference-guide/1.10/dijit/tree/ObjectStoreModel.html#dijit-tree-objectstoremodel)