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
+ exports(declarations的子集,其他NgModule的component要使用的)
+ imports(当前NgModule declaraed的compoent要使用的)
+ providers,提供服务
+ bootstrap 应用的主视图，根组件，根模块才能设置

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

## Dependency Injection

## build

+ angular.json

## ref
+ [angular china](https://angular.cn/guide/quickstart)
+ [Angular CLI](https://cli.angular.io/)
+ [angularjs2](http://www.runoob.com/angularjs2/angularjs2-tutorial.html)
+ [angular material](https://material.angular.io/)
+ [angular universal](https://github.com/angular/universal) *服务端渲染*
+ [ngrx/store](https://github.com/ngrx/store)
+ [awesome angular list](https://github.com/AngularClass/awesome-angular)
+ [angular_风格指南](https://angular.cn/guide/styleguide)
+ [Angular 2 Directive]()