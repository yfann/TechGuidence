
## rxjs

+ `Observer`订阅`Observable`(`Rx.Observable.create`创建,通过`next`,`error`,`complete`向Observer传值)，Observable通过`next`发送消息到Observer

+ `Observable`,单播，每个已订阅的Observer都拥有 Observable 的独立执行

||单个值|多个值|
|--|--|--|
|拉取|Function|Iterator|
|推送|Promise|Observable|

+ `Observer` 观察者只是一组回调函数的集合,使用`observable.subscribe(observer);`

```js
var observer = {
  next: x => console.log('Observer got a next value: ' + x),
  error: err => console.error('Observer got an error: ' + err),
  complete: () => console.log('Observer got a complete notification'),
};
```

+ `Subscription`调用subscribte()执行的函数

```js
var observable = Rx.Observable.interval(1000);
var subscription = observable.subscribe(x => console.log(x));
// 这会取消正在进行中的 Observable 执行
// Observable 执行是通过使用观察者调用 subscribe 方法启动的
subscription.unsubscribe();
```
+ subject 多播，即是Observable又是Observer,Subjects 是将任意 Observable 执行共享给多个观察者的唯一方式

```js
var subject = new Rx.Subject();

subject.subscribe({
  next: (v) => console.log('observerA: ' + v)
});
subject.subscribe({
  next: (v) => console.log('observerB: ' + v)
});
subject.next(1);
// observerA: 1
// observerB: 1

var observable = Rx.Observable.from([1, 2, 3]);
observable.subscribe(subject); // 你可以提供一个 Subject 进行订阅
// observerA: 1
// observerB: 1
//...
```

## tips
+ pull consumer->producer
+ push producer->consumer
+ func.call() 意思是 "同步地给我一个值"
+ `observable.subscribe()` 意思是 "给我任意数量的值，无论是同步还是异步",可以出发Observable的执行
+ `next()`Obervable调用向Observer传值
+ 订阅 Observable 像是调用函数, 并提供接收数据的回调函数。
+ Observable 甚至不会去维护一个附加的观察者列表
+ `Obserable->Subscription(subscribe())->Observer(next())`
+ obervable原理
```js
function subscribe(observer) {
  var intervalID = setInterval(() => {
    observer.next('hi');
  }, 1000);

  return function unsubscribe() {
    clearInterval(intervalID);
  };
}

var unsubscribe = subscribe({next: (x) => console.log(x)});

// 稍后：
unsubscribe(); // 清理资源
```

## ref

+ [RxJS](https://cn.rx.js.org/manual/overview.html)
+ [用 RxJS 连接世界](https://zhuanlan.zhihu.com/p/23464709)
+ [RxJS中文版文档](https://buctwbzs.gitbooks.io/rxjs/content/)