+　高度塌陷，父元素如果没设置高度，则高度是由子元素内容撑开的，子元素如果float之后，脱离文档流，父元素的高度会坍塌，

    解决：
    - 父元素中添加`<div style="clear:both"></div>`作为最后一个子元素
    - 父元素添加`overflow:hidden`,触发BFC
    - 使用after伪元素
    ```css
    .clear:after{
        display:block; content:''; clear:both; height:0; visibility:hidden;
    }
    ```
+ margin collapse(相邻的margin取最大，子元素的margin影响父元素的margin)
  解决：
      1. 父盒子设border
      2. 父盒子设overflow:hidden
      3. 父盒子设padding        

+ width:100%后margin-right失效
  解决：
       去掉width:100%