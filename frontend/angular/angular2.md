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



## Dependency Injection

## build

+ angular.json

## CLI
+ `ng new [customer-app] --routing` 创建customer-app应用，包含app-routing.module.ts
+ `ng generate module [CustomerDashboard]` 创建模块，生成文件夹customer-dashboard
+ `ng generate component [customer-dashboard/CustomerDashboard]` declare CustomerDashboardComponent
+ `ng generate service [User]`create UserService

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