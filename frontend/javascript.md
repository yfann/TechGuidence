# Javascript 基础



## Method
+ `window.onload` dom tree加载完和所有文件加载完之后执行
+ `window.requestAnimationFrame(callback)` 绘制动画，repaint之前调用[#](https://developer.mozilla.org/en-US/docs/Web/API/window/requestAnimationFrame)
+ `window.getComputedStyle([element],[Pseudo classes])` 只读,获取所有应用在元素上的css (element.style可读写,只获取style属性中的css)

        window.getComputedStyle(element, null).getPropertyValue("float");

+ `var element=document.elementFromPoint(x,y)` 返回坐标位置最顶层元素
+ `window.getSelection()` [#](https://developer.mozilla.org/en-US/docs/Web/API/Window/getSelection)

## ES6

+ `Object.assign({},{id:11})`

+ `Object.keys({a:1,b:2,c:3})` return ["a","b","c"]

## Tips

+ `setTimeout(fn,0)`  使任务延后执行，javascript是单线程会把fn放在队尾执行
+ `!!12`  其他类型转bool
+ `~~4.9`  ~按位非取反码(~num = -(num + 1))，~~取整数部分(floor)
+ input事件对contenteditable起作用
+ `{[id]:''}`  变量值做属性
+ `JSON.parse(JSON.stringify(obj))` clone
+ `'abc'.split('')`  `['a','b','c'].join('')`

## javascript[内存优化]((http://lifemap.in/javascript-memory-optimize/))

+ 使用函数块，尽量少定义全局变量。局部变量会在执行完后释放，全局变量会活到页面关闭

```js
;(function(win, doc, $, undefined) {
        // 主業務代碼
})(window, document, jQuery);
```

+ 不需要的变量置null,解除变量引用

```js
var data = { /* some big data */ };
// blah blah blah
data = null;
```

## Event

+ [Event Model,Event Delegate](https://zhuanlan.zhihu.com/p/22718822)

+ [Event loop queue$$Job queue](https://zhuanlan.zhihu.com/p/22710155)

+ 非阻塞(Console里的交互式输入为阻塞)

## Thinking

+ 函数返回函数的形式是交出函数的控制权，控制反转
+ [Monkey Patch](http://cn.redux.js.org/docs/advanced/Middleware.html)

