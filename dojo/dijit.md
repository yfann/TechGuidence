# Dojo Widget

## Custom Widget

创建自定义widget时，一般会继承以下类

+ _WidgetBase
+ _TemplatedMinxin
+ _WidgetsIntemplateMixin

## Widget

+ [dijit/_WidgetBase](https://dojotoolkit.org/api/)

+ [dijit/_AttrachMixin](https://dojotoolkit.org/reference-guide/1.10/dijit/_AttachMixin.html#dijit-attachmixin)

data-dojo-attach-event: 建立DOM event到widget method的连接

```js
 require([
     "dojo/_base/declare", "dojo/parser",
     "dijit/_WidgetBase", "dijit/_TemplatedMixin", "dojo/domReady!"
 ], function(declare, parser, _WidgetBase, _TemplatedMixin){

      declare("FancyCounter", [_WidgetBase, _TemplatedMixin], {
             
             // counter
             _i: 0,

             templateString:
                 "<div>" +
                     "<button data-dojo-attach-event='onclick: increment'>press me</button>" +
                     "&nbsp; count: <span data-dojo-attach-point='counter'>0</span>" +
                 "</div>",

              increment: function(evt){
                  this.counter.innerHTML = ++this._i;
              }
      });
      parser.parse();
});
```

attachScope

+ [dijit/_TemplatedMixin](https://dojotoolkit.org/reference-guide/1.10/dijit/_TemplatedMixin.html)  根据字符串模板 创建DOM tree

Use template to create Widget

```js
require(["dojo/declare", "dijit/_WidgetBase", "dijit/_TemplatedMixin"], function(_WidgetBase, _TemplatedMixin)
   declare("MyWidget", [_WidgetBase, _TemplatedMixin], {
      templateString: "<div>hello world</div>"
   });
});

```


+ [dijit/_WidgetsInTemplateMixin](https://dojotoolkit.org/reference-guide/1.10/dijit/_AttachMixin.html#dijit-attachmixin)

Use template(including widgets) to create Widget

```js
//template

<div class="combinedDateTime">
   <div data-dojo-type="dijit/form/DateTextBox" data-dojo-attach-point="start"></div>
   <div data-dojo-type="dijit/form/TimeTextBox" data-dojo-attach-point="end"></div>
</div>

//code
this.start.set('value', new Date());

```


## Create Widget

+ [dijit/Declaration](https://dojotoolkit.org/reference-guide/1.10/dijit/Declaration.html#dijit-declaration)

  Declares a widget from markup

```js
<div data-dojo-type="dijit/Declaration" data-dojo-props="widgetClass:'Employee', defaults:{empid:123, name:''}">
    <span>${name}</span>
    <a href="#update.php?id=${empid}">update</a>
    <a href="#delete.php?id=${empid}">delete</a>
</div>
<div data-dojo-type="Employee" data-dojo-props="empid:100, name:'Alan Allen'"></div>
<div data-dojo-type="Employee" data-dojo-props="empid:101, name:'Bob Brown'"></div>
<div data-dojo-type="Employee" data-dojo-props="empid:102, name:'Cathy Cameron'"></div>

```


+ programmatic


## 获取页面上的Widget

+ dom.byId() //返回domNode

+ data-dojo-attach-point
    - refer to widget instance rather than the Dom Node
    - 避免id重复问题
    - _AttachMixin 设置属性 attachScope[yourVariableNameHere]= refNode, 所以在代码中可以直接使用this.yourVariableNameHere

+ registry.byId()  //返回widget instance, dijit/registry stores a collection of all the dijit widgets within a page

+ data-dojo-id //全局使用this.dojoId, 返回结果和registry.byId()相同, 全局不会垃圾回收

```js
var widget=registry.byId('xxx') //widget instance
var dom=widget.domNode


var widget=registry.byNode(domNode)

var formWidgets=registry.findWidgets(formDomNode) //查找domnode下的所有widgets,嵌套除外

registry.getEnclosingWidget(dom.byId('xxx')) //查找嵌套widgets

registry.toArray() //返回所有widgets

```
## [life cycle](https://dojotoolkit.org/documentation/tutorials/1.10/understanding_widgetbase/index.html)

+ constructor
+ postscript(declare)
    - create
        + postMixInProperties
        + buildRendering
        + customer setter  _setXXXXAttr()
        + postCreate(渲染然前的最后一步，可以添加自定义属性)
+ startup(控件包括所有子控件的DOM生成后会调用，可以layout)
+ destroy/own

## [Themes](https://dojotoolkit.org/reference-guide/1.10/dijit/themes.html)

## Trouble shooting Flicker

在渲染的时候可以显示widget隐藏来避免闪烁

+ css display:none
+ 先把widget放在视区之外
+ 把widget的height,width设为0
+ z-index

## tips

+ `watch()/_set()`  _set() will trigger watch() handler

## ref

+ [setter/getter life cycle](http://dojotoolkit.org/reference-guide/1.10/quickstart/writingWidgets.html)
