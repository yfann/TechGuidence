# CSS

## 样式文件的引入

+ link (会在页面加载的同时加载)

```html
<link href="blue.css" rel="stylesheet" type="text/css" />  
```

+ import (会在页面全部被下载完后被加载)

```html
<style type="text/css">  
@import url(blue.css);  
</style> 
```


## priority

1. !important
2. inline
3. IDs
4. class
5. element selector


## [Responsive Web Design](http://www.ruanyifeng.com/blog/2012/05/responsive_web_design.html)

+ viewport
+ css中不使用px,width使用百分比，font使用em单位
+ float布局
+ 用media queries为不同屏幕加载和使用css
+ 图片自适应 max-width:100%


## table(div)

+ `display:table`


## float
+ `float:left|right|none|inherit`
+ 文字环绕，对已有流的影响
+ 设置float后，元素升级为block元素
+ 父元素设置为float后，会包含子float元素，子float元素高度，宽度不会超出
+ `clear:none|left|right|both` clear的某侧会不会出现浮动元素，clear只会影响添加的元素本身，不会影响其他元素

```html
<div style="float:left"/>
<div style="float:left;clear:left"/> <!--第二行换行-->
<div style="float:left"/>
```

+ 高度塌陷，父元素如果没设置高度，则高度是由子元素内容撑开的，子元素如果float之后，脱离文档流，父元素的高度会坍塌，

    解决：
    - 父元素中添加`<div style="clear:both"></div>`作为最后一个子元素
    - 父元素添加`overflow:hidden`,触发BFC
    - 使用after伪元素
    ```css
    .clear:after{
        display:block; content:''; clear:both; height:0; visibility:hidden;
    }
    ```
+ 两边单元格高度同步，一边div高度变化时，另一边div高度也变化

    margin-bottom: -1000px;
    padding-bottom: 1000px;

## BFC

## position

+ `position:static` 不能用z-index
+ `position:relative` 相对于元素原先在流的位置偏移
+ `position:absolute` 相对于最近的已定位(position非static)的祖先偏移，如果没有则相对于浏览器偏移，脱离流，流中的元素填补空缺
+ `position:fixed` 相对于浏览器窗口偏移

## Tips

+ `vertical-align:top` 只对inline,inline-block起作用，样式添加在元素上而不是容器上
+ `text-align:center`
+ `white-space:nowrap`
+ `display:inline`width,height,top,bottom无效，*-left/*-right有效
+ `box-sizing:border-box`
    可解决widht:100%后再设置border或padding时的益出问题。
    - `box-sizing:content-box` element实际宽度=width(css中设置的宽度)+border+padding
    - `box-sizing:padding-box` element实际宽度=width(css中设置的宽度)+border
    - `box-sizing:border-box` element实际宽度=width(css中设置的宽度)
+ `width:20%` 可以对document上的元素设置百分比，对离线dom设置完百分比再加回document时百分比会转换为pixel


## Ref

+ [w3chtml](http://www.w3chtml.com/css3/properties/user-interface/box-sizing.html)