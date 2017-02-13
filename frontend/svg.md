## tags

+ `<g>` group其他svg元素，transform作用于g可以作用于所有子元素
    - [transform](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/transform)
      `<g transform="translate(0.4,0.4)">`

+ `<svg>` svg的根元素，有自己的viewport和coordinate

+ `<defs>` 可以定义图形对象，定义的图形对象不会立即渲染，可以被`<use>`使用

+ `<use>` 引用`<defs>`中定义的元素

## 坐标体系

+ viewport,viewbox,preserveAspectRatio

```html
<!--viewport 800 600-->
<!--viewport 可视范围-->
<!--viewbox 裁剪区域，铺满viewport-->
<!--preserveAspectRatio 当viewbox和viewport宽高比不同时，强制按viewport比例显示-->
<svg width="800" height="600" viewBox="0 0 400 300"> 
</svg>
```

## ref

+ [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Element/svg)
+ [svg 坐标体系](http://www.w3cplus.com/html5/svg-coordinate-systems.html)