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

1. inline
2. !important
3. IDs
4. class
5. element selector


## [Responsive Web Design](http://www.ruanyifeng.com/blog/2012/05/responsive_web_design.html)

+ viewport
+ css中不使用px,width使用百分比，font使用em单位
+ float布局
+ 用media queries为不同屏幕加载和使用css
+ 图片自适应 max-width:100%


## layout



## Tips

+ `vertical-align:top` 只对inline,inline-block起作用，样式添加在元素上而不是容器上
+ `text-align:center`