
## issues
+　高度塌陷，父元素如果没设置高度，则高度是由子元素内容撑开的，子元素如果float之后，脱离文档流，父元素的高度会坍塌

解决([Ref](http://kayosite.com/remove-floating-style-in-detail.html))：

    - 父元素中添加`<div style="clear:both"></div>`作为最后一个子元素
    - 父元素添加`overflow:hidden`,触发BFC
    - 使用after伪元素,父元素设置clearfix样式

    ```css
    .clearfix:after{
        display:block; content:''; clear:both; height:0; visibility:hidden;
    }
    ```
+ margin collapse(相邻的margin取最大，子元素的margin影响父元素的margin)

解决：

      1. 父盒子设border
      2. 父盒子设overflow:hidden
      3. 父盒子设padding    
      4. BFC    

+ width:100%后margin-right失效
  解决：
       去掉width:100%

## 垂直居中
+ `vertical-align:middle` 只对inline,inline-block起作用，样式添加在元素上而不是容器上,`line-height`于`height`一致
+ `flex`
```css
    display: flex;
    align-items: center;/*垂直居中*/
    height:300px;
```

## Tips
+ `text-align:center`
+ `white-space:nowrap`
+ `display:inline`width,height,top,bottom无效，*-left/*-right有效
+ `box-sizing:border-box`
    可解决widht:100%后再设置border或padding时的益出问题。
    - `box-sizing:content-box` element实际宽度=width(css中设置的宽度)+border+padding
    - `box-sizing:padding-box` element实际宽度=width(css中设置的宽度)+border
    - `box-sizing:border-box` element实际宽度=width(css中设置的宽度)
+ `width:20%` 可以对document上的元素设置百分比，对离线dom设置完百分比再加回document时百分比会转换为pixel
+ `pointer-events: none;` 可用于触发下层元素的hover事件
+ `content: attr(data-before-content)` 通过属性伪元素动态显示内容
+ `calc`
```css
/* viewport 可视窗口
1vw viewport 宽度的1%
1vh viewport 高度的1% */

/* 当前窗口高度-100px */
div{
    height:calc(100vh-100px)
    /* height:calc(100%-100px) */
}
```