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

## Tips

+ `setTimeout(fn,0)`  使任务延后执行，javascript是单线程会把fn放在队尾执行
+ `!!12`  其他类型转bool
+ `~~4.9`  ~按位非取反码(~num = -(num + 1))，~~取整数部分(floor)
+ input事件对contenteditable起作用
+ `{[id]:''}`  变量值做属性
+ `JSON.parse(JSON.stringify(obj))` clone

## Think

+ 函数返回函数的形式是交出函数的控制权，控制反转