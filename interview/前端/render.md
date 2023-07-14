## Browser Render Process

1. HTML->DOM CSS Object Model
2. DOM + CSS Object Model -> Render tree
3. layout
4. paint

## Reflow & Repaint

+ flow + paint = render

+ repaint不一定reflow,reflow一定repaint

+ 重新render
    + 修改DOM
    + 修改样式表
    + 用户事件


## 性能

+ 读写批量操作
```css
    //渲染一次
    div.style.color = 'blue';
    div.style.marginTop = '30px';

    //渲染两次
    div.style.color = 'blue';
    var margin = parseInt(div.style.marginTop);
    div.style.marginTop = (margin + 10) + 'px';

    // bad
    div.style.left = div.offsetLeft + 10 + "px";
    div.style.top = div.offsetTop + 10 + "px";

    // good
    var left = div.offsetLeft;
    var top  = div.offsetTop;
    div.style.left = left + 10 + "px";
    div.style.top = top + 10 + "px";
```

+ 通过class批量更改样式

+ 离线修改DOM

+ 修改display:none的元素不会重新渲染,修改visibility:hidden的元素只会repaint

+ positin:absolute/fixed元素开销小

+ 使用react

+ 使用 window.requestAnimationFrame()、window.requestIdleCallback() 这两个方法调节重新渲染


## [Ref](http://www.ruanyifeng.com/blog/2015/09/web-page-performance-in-depth.html)
