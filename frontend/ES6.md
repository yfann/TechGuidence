

## keywords
+ 数组
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

+ Symbol(表示独一无二的值)
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
+ Set

```js
//可以用来去重
const set = new Set([1, 2, 3, 4, 4]);
[...set]
// [1, 2, 3, 4]
```

+ WeakSet(只能放对象，不能遍历)

+ Map(Object是`字符串=>值` Map是`值=>值`)

```js
//过滤map
const map1 = new Map(
  [...map0].filter(([k, v]) => k < 3)
);
```

+ WeakMap(键只能是对象,null除外，键指向的对象不计入垃圾回收)

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

## ref
+ [ECMAScript 6 入门](http://es6.ruanyifeng.com/)