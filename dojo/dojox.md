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
## dojox.form.uploader

+ 会截断所在 click submit button时(form.submit()会跳过自己的submit)，做自己的submit(收集form的fields,用ajax提交到form.action或自己的url属性)
    - _Base.js 中的`this.connect(this.form, "onsubmit", function(evt)`

+ 所在form需要加`enctype="multipart/form-data"`

+ 不用plugin(Flash,HTML5,IFrame),就会是form mode象普通的file input一样


## reference

+ [dojo/Stateful](https://dojotoolkit.org/reference-guide/1.10/dojo/Stateful.html#dojo-stateful)
+ [dojox.form.uploader](http://dojotoolkit.org/reference-guide/1.10/dojox/form/Uploader.html)
