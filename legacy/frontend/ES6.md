

# keywords

## proxy(修改操作的默认行为,元编程meta programming,对编程语言进行的编程,拦截器)
```js
//构造1
var proxy = new Proxy(target, handler);
//构造2
var object = { proxy: new Proxy(target, handler) };
//构造3
var proxy = new Proxy({}, {
  get: function(target, property) {
    return 35;
  }
});
let obj = Object.create(proxy);
obj.time // 35
//观察者模式
const queuedObservers = new Set();

const observe = fn => queuedObservers.add(fn);
const observable = obj => new Proxy(obj, {set});

function set(target, key, value, receiver) {
  const result = Reflect.set(target, key, value, receiver);
  queuedObservers.forEach(observer => observer());
  return result;
}
```

## reflect
  - 放置内部方法如：`defineProperty`
  - 无方法定义时返回false `Reflect.defineProperty(obj, name, desc)`可以不用try catch
  - object操作变成函数行为如:`delete obj[name]`>`Reflect.deleteProperty(obj,name)`
  - 和Proxy的方法一一对应，提供默认行为
  ```js
  var loggedObj = new Proxy(obj, {
    get(target, name) {
      console.log('get', target, name);
      return Reflect.get(target, name);
    },
    deleteProperty(target, name) {
      console.log('delete' + name);
      return Reflect.deleteProperty(target, name);
    },
    has(target, name) {
      console.log('has' + name);
      return Reflect.has(target, name);
    }
  });
  ```

## 数组
```js
//扩展运算符，任何定义了遍历器（Iterator）接口的对象，都可以用扩展运算符转为真正的数组。
let args=[1,2,3];
f(...args);
//复制数组
const a1=[1,2];
const a2=[...a1];
//解构赋值，扩展运算符只能放在最后
[a,...rest]=a1;
//字符串
[...'x\uD83D\uDE80y'].length // 3
let str = 'x\uD83D\uDE80y';
str.split('').reverse().join('')
// 'y\uDE80\uD83Dx'
[...str].reverse().join('')
// 'y\uD83D\uDE80x'
//iterator
Number.prototype[Symbol.iterator] = function*() {
  let i = 0;
  let num = this.valueOf();
  while (i < num) {
    yield i++;
  }
}
console.log([...5]) // [0, 1, 2, 3, 4]
//*********************************

Array.from()
//类似数组的对象（array-like object）和可遍历（iterable）的对象转成数组

let arrayLike = {
    '0': 'a',
    '1': 'b',
    '2': 'c',
    length: 3
};

// ES5的写法
var arr1 = [].slice.call(arrayLike); // ['a', 'b', 'c']

// ES6的写法
let arr2 = Array.from(arrayLike); // ['a', 'b', 'c']
//**************************
//把值转换为数组
Array.of(3, 11, 8) // [3,11,8]
//***********
[1, [2, [3]]].flat(Infinity)
// [1, 2, 3]
```
***
## Symbol(表示独一无二的值)
```js
//遍历
Object.getOwnPropertySymbols(obj);
//----------------------------------------
let s1 = Symbol.for('foo');
let s2 = Symbol.for('foo');
s1 === s2 // true
//---------------------------------------
let s1 = Symbol.for("foo");
Symbol.keyFor(s1) // "foo"
//---------------------------------------
//Singleton
const FOO_KEY = Symbol.for('foo');

function A() {
  this.foo = 'hello';
}

if (!global[FOO_KEY]) {
  global[FOO_KEY] = new A();
}

module.exports = global[FOO_KEY];
//---------------------------------------
//内置symbol值
class MyClass {
  [Symbol.hasInstance](foo) {
    return foo instanceof Array;
  }
}

[1, 2, 3] instanceof new MyClass() // true
//----------------------------------------
//消除魔术字符串
const shapeType = {
  triangle: Symbol()
};

 switch (shape) {
    case shapeType.triangle:
    ...
```
---
## Set

```js
//可以用来去重
const set = new Set([1, 2, 3, 4, 4]);
[...set]
// [1, 2, 3, 4]
```

## WeakSet(只能放对象，不能遍历)
***
## Map(Object是`字符串=>值` Map是`值=>值`)

```js
//过滤map
const map1 = new Map(
  [...map0].filter(([k, v]) => k < 3)
);
```
***
## WeakMap(键只能是对象,null除外，键指向的对象不计入垃圾回收)

```js
//可以存dom节点
let myElement = document.getElementById('logo');
let myWeakmap = new WeakMap();

myWeakmap.set(myElement, {timesClicked: 0});

myElement.addEventListener('click', function() {
  let logoData = myWeakmap.get(myElement);
  logoData.timesClicked++;
}, false);
//-------------------------------------
//可以存私有属性
const _counter = new WeakMap();
const _action = new WeakMap();

class Countdown {
  constructor(counter, action) {
      //如果实例删除则，WeakMap中存的值也会删除，不会内存泄漏
    _counter.set(this, counter);
    _action.set(this, action);
  }
  dec() {
    let counter = _counter.get(this);
    if (counter < 1) return;
    counter--;
    _counter.set(this, counter);
    if (counter === 0) {
      _action.get(this)();
    }
  }
}

const c = new Countdown(2, () => console.log('DONE'));

c.dec()

```
***
## Module

+ ES6模块 vs CommonJS模块
  - CommonJS模块是对象,输入时查找对象属性,可以解构对象
  - CommonJS模块输出是值拷贝，ES6模块输出是值引用S
  - CommonJS是运行时加载,ES6模块是编译时输出（静态解析）
  - CommonJS模块加载时执行
```js
  // CommonJS模块
let { stat, exists, readFile } = require('fs');

// 等同于
let _fs = require('fs');
let stat = _fs.stat;
let exists = _fs.exists;
let readfile = _fs.readfile;
```
- ES6模块不是对象，通过`export`输出代码,再通过`import`输入
```js
//从fs模块加载3个方法，其他方法不加载，编译时加载或静态加载
import { stat, exists, readFile } from 'fs';
```
- ES6模块是严格模式`use strict`
- 一个模块就是一个独立的文件，外部无法访问，除非`export`声明
```js
// 写法一
export var m = 1;

// 写法二
var m = 1;
export {m};

// 写法三
var n = 1;
export {n as m};
//export default
export default function...
```
- import(编译时引入，只能放在开头，不能条件加载)
```js
import {firstName, lastName, year} from './profile.js';
//*************************************
foo();
import { foo } from 'my_module';//不会报错，import编译阶段执行
//*********************************************
import 'lodash';//多次加载，模块只执行一次
import 'lodash';
//***************************************
//整体加载
import * as circle from './circle';
console.log('圆面积：' + circle.area(4));
//***********************************************
//复合写法
export { foo, bar } from 'my_module';
// 可以简单理解为
import { foo, bar } from 'my_module';
export { foo, bar };
//*******************************
//模块继承
//circleplus.js继承了circle.js
export * from 'circle';
export var e = 2.71828182846;
export default function(x) {
  return Math.exp(x);
}
```
- `import()`运行时加载，返回promise
```js
import('./myModule.js')
.then(({default: theDefault}) => {
  console.log(theDefault);
});
//**************************************
//条件加载
if (condition) {
import('moduleA').then(...);
} else {
  import('moduleB').then(...);
}
//***************************************
Promise.all([
import('./module1.js'),
import('./module2.js'),
import('./module3.js'),
])
.then(([module1, module2, module3]) => {
  ···
});
```
+ defer(浏览器渲染完执行),按照定义顺序执行
```js
<script src="path/to/myModule.js" defer></script
```
+ async(下载完执行)，顺序不能保证
+ module,类似defer
```js
<script type="module" src="./foo.js"></script>
//******************************************
<script type="module">
  import utils from "./utils.js";

  // other code
</script>
```


## ref
+ [ECMAScript 6 入门](http://es6.ruanyifeng.com/)