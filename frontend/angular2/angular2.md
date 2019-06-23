# Angular2
+ systemjs(支持AMD,CommonJS,ES6),会自动加载es6-module-loader,traceur(ES6转ES5)
+ [(ngModel)]
    - 需要导入FormsModule
    - 只支持实现了ControlValueAccessor的元素
+ sample
```ts
//site.ts
export class Site {
  constructor(
    public id: number,
    public name: string) { }
}
//app.component.ts
import { Component } from '@angular/core';
import { Site } from './site';
 
@Component({
  selector: 'my-app',
  template: `
    <h1>{{title}}</h1>
    <h2>我喜欢的网站: {{mySite.name}}</h2>
    <p>网站列表:</p>
    <ul>
      <li *ngFor="let site of sites">
        {{ site.name }}
      </li>
    </ul>
    `
})
 
export class AppComponent {
  title = '站点列表';
  sites = [
      new Site(1, '菜鸟教程'),
      new Site(2, 'Google'),
      new Site(3, 'Taobao'),
      new Site(4, 'Facebook')
      ];
  mySite = this.sites[0];
}
```

## Modules
+ angular内置库以`@angular`开头
+ AppModule根模块
+ NgModule 为其中的组件提供了一个编译上下文环境
+ declarations,该应用拥有的组件(components,directives,pipes)
+ exports(declarations的子集,其他NgModule的component要使用的,可以被其他模块import)
+ imports(当前NgModule declaraed的compoent要使用的)
+ providers,提供服务
+ bootstrap 
    - 应用的主视图，根组件（AppComponent）
    - 根模块才能设置
    - 引导过程会创建bootstrap数组中列出的组件，并把它们逐个插入到浏览器的DOM中
    - 每个被引导的组件都是自己组件树的根
+ entryComponent(根据类型加载的组件是入口组件，声明式加载(通过选择器加载)的组件不是入口组件)
    - 包括引导组件和路由中定义的组件（编译器会自动把这两者加到entryComponents中）
    - AppComponentshi入口组件(虽然它的选择器匹配了index.html的一个元素，但index.html不是组件模板)
    - 路由中用到的组件也是入口组件,根据类型来引用组件，忽略选择器
    - bootstrap 也是入口组件，引导方式和其他入口组件不同
    - 不要添加被其他模板引用过的组件
    - 使用入口组件的原因是摇树优化：编译器从入口组件开始工作，为它在入口组件的模板中找到的那些组件生成代码，然后又为在这些组件中的模板中发现的组件生成代码，以此类推。 当这个过程结束时，它就已经为每个入口组件以及从入口组件可以抵达的每个组件生成了代码。如果该组件不是入口组件或者没有在任何模板中发现过，编译器就会忽略它。
+ `@NgModule`把js导入的模块`import {...} from ...`转成angular的模块
+ 模块不允许循环依赖
+ BrowserModule导入了CommonModule,同时又导出了CommonModule,以便它所有的指令在任何导入了 BrowserModule 的模块中都可以使用CommonModule的ngIf,ngFor
+ 路由特性模块
    - 可以被惰性加载
    - 不会导出任何东西
    - 不会出现在外部组件模板中
+ Shared Module
    - 模块可以直接放入exports，不用先放入imports
    - 组件要先入declarations再exports

## Components
+ `@Input`修饰子组件属性，父组件通过属性把数据传入子组件
    - `@Input('master') masterName: string;`
    -  传入的属性变化时触发的操作
    ```js
    @Input()
    set name(name: string) {
        this._name = (name && name.trim()) || '<no name set>';
    }
    ```
    - 通过`ngOnChanges`监听属性变化
    ```js
     ngOnChanges(changes: {[propKey: string]: SimpleChange}) {
        let log: string[] = [];
        for (let propName in changes) {
        let changedProp = changes[propName];
        let to = JSON.stringify(changedProp.currentValue);
        if (changedProp.isFirstChange()) {
            log.push(`Initial value of ${propName} set to ${to}`);
        } else {
            let from = JSON.stringify(changedProp.previousValue);
            log.push(`${propName} changed from ${from} to ${to}`);
        }
        }
        this.changeLog.push(log.join(', '));
    }
    ```
+ `@Output`子组件暴露事件,可让父组件监听
```js
//app-voter.js
  @Output() voted = new EventEmitter<boolean>();
  vote(agreed: boolean) {
    this.voted.emit(agreed);
  }
// <app-voter *ngFor="let voter of voters"
//       [name]="voter"
//       (voted)="onVoted($event)">
```

+ 父组件通过`模板引用子组件`的属性和方法(父组件不能通过数据绑定来访问子组件)
```html
  <button (click)="timer.start()">Start</button>
  <button (click)="timer.stop()">Stop</button>
  <div class="seconds">{{timer.seconds}}</div>
  <app-countdown-timer #timer></app-countdown-timer>
```

+ `ViewChild`,父组件代码引用子组件(必须引入生命周期钩子AfterViewInit，被注入的组件只有在 Angular 显示了父组件视图之后才能访问)
```JS
export class CountdownViewChildParentComponent implements AfterViewInit {
  @ViewChild(CountdownTimerComponent)
  private timerComponent: CountdownTimerComponent;
  seconds() { return 0; }
  ngAfterViewInit() {
    // Redefine `seconds()` to get from the `CountdownTimerComponent.seconds` ...
    // but wait a tick first to avoid one-time devMode
    // unidirectional-data-flow-violation error
    setTimeout(() => this.seconds = () => this.timerComponent.seconds, 0);//单向数据流规则会阻止在同一个周期内更新父组件视图，用timeout等待下一轮更新
  }
 
  start() { this.timerComponent.start(); }
  stop() { this.timerComponent.stop(); }
}
```

+ 父子组件通过服务来通讯(父组件配置`providers`,子组件可以直接注入父组件的service实例)

## Templates

+  属性绑定
    - `<img src="{{imageUrl}}">` 插值
    - `<img [src]="imageUrl">`
    - `<div [ngClass]="classes">[ngClass]绑定到classes 属性</div>`
    - `<user-detail [user]="currentUser"></user-detail>` 绑定自定义属性，用于父子组件通讯
+ Attribute(非属性)

```html
<!-- 会报错，td没有colspan属性 -->
<tr><td colspan="{{1 + 1}}">Three-Four</td></tr>
<!-- 正确做法 -->
<tr><td [attr.colspan]="1 + 1">One-Two</td></tr>
```

+ 样式绑定
```html
<!-- 添加或移除special样式 -->
<div [class.special]="isSpecial">这个样式比较特殊</div>
<button [style.color] = "isSpecial ? 'red': 'green'">红色</button>
<button [style.font-size.%]="!isSpecial ? 150 : 50" >小</button>
<div [ngStyle]="setStyles()">
```

+ 事件绑定
```html
<button (click)="onSave()">保存</button>
<button on-click="onSave()">On Save</button>
<!-- 事件传值 -->
<input (keyup)="onKey($event)">
 <!-- onKey(event: KeyboardEvent) {
    this.values += (<HTMLInputElement>event.target).value + ' | ';
  } -->
<!-- 事件传值 -->
<input #box (keyup)="onKey(box.value)">
<!-- 事件过滤 -->
<input #box
    (keyup.enter)="values=box.value"
    (blur)="values=box.value">
<p>{{values}}</p>
```

+ NgModel双向绑定,`<input [(ngModel)]="currentUser.firstName">`,`[]`数据流组件->模板,`()`模板->组件

+ 指令
    - ngIf
    - ngSwitch
    - ngFor  `<user-detail *ngFor="let user of users" [user]="user"></user-detail>`
    - NgForTrackBy 提升性能
    ```js
        //判断是否为同一个user,如果是则更新dom,不会建立新的dom
        trackByUsers(index: number, user: User){return user.id}
        <div *ngFor="let user of users; trackBy:trackByUsers">({{user.id}}) {{user.fullName}}</div>
    ```
+ 模板引用
    ```html
    <!-- phone 引用了 input 元素，并将 `value` 传递给事件句柄 -->
    <input #phone placeholder="phone number">
    <button (click)="callPhone(phone.value)">Call</button>
    
    <!-- fax 引用了 input 元素，并将  `value` 传递给事件句柄  -->
    <input ref-fax placeholder="fax number">
    <button (click)="callFax(fax.value)">Fax</button>
    ```
## Metadata

## Data binding

## Directives

## Services

+ providedIn
```js
import { UserModule } from './user.module';

@Injectable({
  providedIn: UserModule,
})
```
+ 模块使用（导入模块会产生新的服务实例）
```js
@NgModule({
  providers: [UserService],
})
```

+ 组件使用
```js
@Component({
/* . . . */
  providers: [UserService]
})
```

+ 单例,root为单例服务
```js
@Injectable({
  providedIn: 'root',
})
export class UserService {
}
```

+ forRoot 单例

## Event
+ EventEmitter派生自observable
+ `$event`标准DOM事件对象都有target,下面例子target指向`<input>`

```html
<input (keyup)="onKey($event)">
  <p>{{values}}</p>

<!-- onKey(event: any) { // without type info
    this.values += event.target.value + ' | ';
  } -->

<!-- onKey(event: KeyboardEvent) { // with type info
    this.values += (<HTMLInputElement>event.target).value + ' | ';
  } -->
```
+ 模板引用要绑定事件才生效
```js
@Component({
  selector: 'app-loop-back',
  template: `
    <input #box (keyup)="0">
    <p>{{box.value}}</p>
  `
})
export class LoopbackComponent { }
```

+ 绑定按键`<input #box (keyup.enter)="onEnter(box.value)">`

## Dependency Injection

+ `providedIn:'root'` AppModule的Injector
+ injector(`@Injectable`) 创建服务实例，并注入实例到component
+ root injector在bootstrap过程创建
+ provider(`providedIn`)告诉injector如何创建service
+ injector 只生成一个服务实例
+ module,component的injector彼此独立，生成不同的service实例
+ injector可继承，可以查找parent component的Injector直到 root injector(AppModule)
+ `Optional() private logger: Logger`注入可以不存在
+ root provide提供单例服务实例,root provider全局只有一个,每个provider只产生一个服务实例
+ scope
  - root `providedIn:'root'`
  - module`providedIn:NgModule`
  - component 
  ```js
  @Component({
  selector: 'app-heroes',
  providers: [ HeroService ],
  ...
  ```
+ `[{ provide: Logger, useClass: BetterLogger }]`注入Logger类型时，如何创建实例(useClass,useValue,useFactory)



## Observable

+ `Observer`含有`subscriber`,调用subscribe()会触发Observer的执行
```js
// Create an Observable that will start listening to geolocation updates
// when a consumer subscribes.
const locations = new Observable((observer) => {
  // Get the next and error callbacks. These will be passed in when
  // the consumer subscribes.
  const {next, error} = observer;
  let watchId;
 
  // Simple geolocation API check provides values to publish
  if ('geolocation' in navigator) {
    watchId = navigator.geolocation.watchPosition(next, error);
  } else {
    error('Geolocation not available');
  }
 
  // When the consumer unsubscribes, clean up data ready for next subscription.
  return {unsubscribe() { navigator.geolocation.clearWatch(watchId); }};
});
 
// Call subscribe() to start listening for updates.
const locationsSubscription = locations.subscribe({
  next(position) { console.log('Current Position: ', position); },
  error(msg) { console.log('Error Getting Location: ', msg); }
});
 
// Stop listening for location after 10 seconds
setTimeout(() => { locationsSubscription.unsubscribe(); }, 10000);
```

+ subscriber负责如何调用observer
```js
// This function runs when subscribe() is called
function sequenceSubscriber(observer) {
  // synchronously deliver 1, 2, and 3, then complete
  observer.next(1);
  observer.next(2);
  observer.next(3);
  observer.complete();
 
  // unsubscribe function doesn't need to do anything in this
  // because values are delivered synchronously
  return {unsubscribe() {}};
}
 
// Create a new Observable that will deliver the above sequence
const sequence = new Observable(sequenceSubscriber);
 
// execute the Observable and print the result of each notification
sequence.subscribe({
  next(num) { console.log(num); },
  complete() { console.log('Finished sequence'); }
});
```

+ form事件
```js
function fromEvent(target, eventName) {
  return new Observable((observer) => {
    const handler = (e) => observer.next(e);
 
    // Add the event handler to the target
    target.addEventListener(eventName, handler);
 
    return () => {
      // Detach the event handler from the target
      target.removeEventListener(eventName, handler);
    };
  });
}

const ESC_KEY = 27;
const nameInput = document.getElementById('name') as HTMLInputElement;

const subscription = fromEvent(nameInput, 'keydown')
  .subscribe((e: KeyboardEvent) => {
    if (e.keyCode === ESC_KEY) {
      nameInput.value = '';
    }
  });
```

+ 多播(每次订阅都是一个独立的执行，比如计数，每次订阅都是从1开始。`多播`可以共享执行，比如计数，会从当前数字开始)

## build

+ angular.json

## tips

+ 单向数据流
+ {{expression}} 不支持`=`
+ (event)="statement" statement支持`=` `;`
+ HTML attribute/DOM property`模板绑定是property`
    - html 定义attribute,dom 定义 property
    - attribute初始化property, property值会变,attribute值不变
    ```js
    <input type="text" value="Bob">
    //value attribute "Bob" 初始化 value property "Bob"
    //input 输入 sam时
    //value property "sam"
    //value attribute 还是"Bob"  input.getAttribute('value')
    ```
+ `[(ngModel)]` 需要mport { FormsModule } from '@angular/forms'，只支持实现了ControlValueAccessor的元素
```html
<input [value]="currentHero.name"
       (input)="currentHero.name=$event.target.value" >

<input
  [ngModel]="currentHero.name"
  (ngModelChange)="currentHero.name=$event">
```
+ 管道`{{currentHero | json}}`
+ 安全导航操作符`{{currentHero?.name}}`currentHero为空时不会报错
+ 非空断言操作符`{{hero!.name}}` 告诉 TypeScript 的类型检查器对特定的属性表达式，不做 "严格空值检测"。
+ `{{$any(hero).marker}}`$any 转换函数来把表达式转换成 any 类型。
+ ViewChild
+ElementRef

## issues

+ "Can't bind to 'x' since it isn't a known property of 'y'"
    - 这个错误通常意味着你或者忘了声明指令“x”，或者你没有导入“x”所属的模块。
    - 如果“x”其实不是属性，或者是组件的私有属性（比如它不带 @Input 或 @Output 装饰器），那么你也同样会遇到这个错误。

## ref
+ [angular china](https://angular.cn/guide/quickstart)
+ [Angular CLI](https://cli.angular.io/)
+ [angularjs2](http://www.runoob.com/angularjs2/angularjs2-tutorial.html)
+ [angular material](https://material.angular.io/)
+ [angular universal](https://github.com/angular/universal) *服务端渲染*
+ [ngrx/store](https://github.com/ngrx/store)
+ [awesome angular list](https://github.com/AngularClass/awesome-angular)
+ [angular_风格指南](https://angular.cn/guide/styleguide)
+ [NgModules](https://angular.cn/guide/ngmodules)
+ [Shared Module](https://angular.cn/guide/sharing-ngmodules)
+ [lifecycle-hooks](https://angular.cn/guide/lifecycle-hooks)
<!-- best practice -->
+ [Creating Reusable Components with NgTemplateOutlet in Angular](https://alligator.io/angular/reusable-components-ngtemplateoutlet/)
+ [Angular ng-template, ng-container and ngTemplateOutlet - The Complete Guide To Angular Templates](https://blog.angular-university.io/angular-ng-template-ng-container-ngtemplateoutlet/)