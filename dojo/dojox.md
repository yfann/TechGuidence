# dojox

## [dojox/mvc](https://dojotoolkit.org/reference-guide/1.10/dojox/mvc.html)
ways of binding(only support dojo/Stateful);
+ [dojox/mvc/sync](https://dojotoolkit.org/reference-guide/1.10/dojox/mvc/sync.html#dojox-mvc-sync)
+ [dojox/mvc/at](https://dojotoolkit.org/reference-guide/1.10/dojox/mvc/at.html#dojox-mvc-at)

```html
<span data-dojo-id="model"
 data-dojo-type="dojo/Stateful"
 data-dojo-props="value: 'Foo'"></span>

<input type="text"
 data-dojo-type="dijit/form/TextBox"
 data-dojo-props="value: at(model, 'value')">
 
<span data-dojo-type="dijit/_WidgetBase"
 data-dojo-props="_setValueAttr: {node: 'domNode', type: 'innerText'}, value: at(model, 'value')">
 </span>
```

## reference

+ [dojo/Stateful](https://dojotoolkit.org/reference-guide/1.10/dojo/Stateful.html#dojo-stateful)
