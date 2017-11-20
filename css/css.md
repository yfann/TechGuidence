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

+ 两边单元格高度同步，一边div高度变化时，另一边div高度也变化

    margin-bottom: -1000px;
    padding-bottom: 1000px;

## BFC/IFC(block format context/inline format context)

## position

+ `position:static` 不能用z-index
+ `position:relative` 相对于元素原先在流的位置偏移
+ `position:absolute` 相对于最近的已定位(position非static)的祖先偏移，如果没有则相对于浏览器偏移，脱离流，流中的元素填补空缺
+ `position:fixed` 相对于浏览器窗口偏移

## line-height && vertical-align

+ 文本元素是匿名内联元素
+ `font-size:100px` 文字因字体不同而大小不同,会影响content-area(background作用的范围)
+ line-box是由它所有子元素的高度（不是子元素的content-area高度）计算得出的，即line-height
+ line-height不是baseline间的距离
+ content-area处于line-height中间
+ inline 元素 height:auto 时，height==line-height,content-area==line-height



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


## z-index
+ 只能作用于`position:relative/absolute/fixed`
+ 只能同级比较，父级之外要父级之间比较

## width & height

+ height:100%

```html
<div class='position:relative;height:800px'>
    <div style='position:absolute;height:100%'>
    </div>
</div>
```

+ 水平居中
    - 父容器block,子元素inline
```css
.center-children {
  text-align: center;
}
```
    - block元素居中(无法用float居中)
```css
.center-me {
  margin: 0 auto;
}
```
    - 多个元素居中用flex

+ 垂直居中(须设有height)
    - inline元素居中(单行或多行)
```css
<!--使用padding-->

.link {
  padding-top: 30px;
  padding-bottom: 30px;
}

<!--设置行高等于高度-->

.center-text-trick {
  height: 100px;
  line-height: 100px;
  white-space: nowrap;
}

<!--使用table和vertical-align-->

.center-table {
  display: table;
  height: 250px;
}
.center-table p {
  display: table-cell;
  vertical-align: middle;
}

<!--使用flex-->

.flex-center-vertically {
  display: flex;
  justify-content: center;
  flex-direction: column;
  height: 400px;
}


<!--使用伪元素-->
.ghost-center {
  position: relative;
}
.ghost-center::before {
  content: " ";
  display: inline-block;
  height: 100%;
  width: 1%;
  vertical-align: middle;
}
.ghost-center p {
  display: inline-block;
  vertical-align: middle;
}
```
   - block元素居中

```css
<!--子元素高度确定-->
.parent {
  position: relative;
}
.child {
  position: absolute;
  top: 50%;
  height: 100px;
  margin-top: -50px; /* account for padding and border if not using box-sizing: border-box; */
}

<!--子元素高度未知-->
.parent {
  position: relative;
}
.child {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
}

<!--flex-->
.parent {
  display: flex;
  flex-direction: column;
  justify-content: center;
}
```

## props list

+ box-shadow
+ box-sizing

## Ref

+ [box-sizing](http://www.w3chtml.com/css3/properties/user-interface/box-sizing.html)
+ [垂直居中6法](http://vanseodesign.com/css/vertical-centering/)
+ [flex](http://www.ruanyifeng.com/blog/2015/07/flex-grammar.html)
+ [CSS box model](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Box_Model/Introduction_to_the_CSS_box_model)
+ [Centering in CSS](https://css-tricks.com/centering-css-complete-guide/)
+ [CSS的垂直居中和水平居](https://zhuanlan.zhihu.com/p/24070633)
+ [CSS Transforms](https://drafts.csswg.org/css-transforms/)
+ [CSS font](https://zhuanlan.zhihu.com/p/25808995)
+ [z-index](https://webdesign.tutsplus.com/zh-hans/articles/what-you-may-not-know-about-the-z-index-property--webdesign-16892)