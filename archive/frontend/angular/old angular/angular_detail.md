

## $templateCache

```html
<!--创建模板 必须在ng-app根下-->
<script type="text/ng-template" id="templateId.html">
  <p>This is the content of the template</p>
</script>
```

```js
//代码形式
 $templateCache.put('templateId.html', 'This is the content of the template');

 //使用模板
 myApp.component('myComponent', {
   templateUrl: 'templateId.html'
});
//or
$templateCache.get('templateId.html')
```
## data-binding

+ `ngAttr` 任意属性的数据绑定(解决svg中的限制)

```html
<!--svg不支持-->
<svg>
  <circle cx="{{cx}}"></circle>
</svg>
<!--svg支持-->
<svg>
  <circle ng-attr-cx="{{cx}}"></circle>
</svg>
```



## ref

+ [official](https://docs.angularjs.org/api/ng/service/$templateCache)
+ [data-binding](https://docs.angularjs.org/guide/interpolation)