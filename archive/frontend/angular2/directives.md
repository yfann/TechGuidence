
## ng-template 
+ ngIf, ngFor and ngSwitch都使用了ng-template,可以访问外部template的变量

```html
<div class="lessons-list" *ngIf="lessons else loading">
  ... 
</div>

<ng-template #loading>
    <div>Loading...</div>
</ng-template>

<!-- equals to -->
<ng-template [ngIf]="lessons" [ngIfElse]="loading">
   <div class="lessons-list">
     ... 
   </div>
</ng-template>

<ng-template #loading>
    <div>Loading...</div>
</ng-template>

```
+  模板的context
```js
// context
// let- define property
@Component({
  selector: 'app-root',
  template: `      
<ng-template #estimateTemplate let-lessonsCounter="estimate">
    <div> Approximately {{lessonsCounter}} lessons ...</div>
</ng-template>
<ng-container 
   *ngTemplateOutlet="estimateTemplate;context:ctx">
</ng-container>
`})
export class AppComponent {

    totalEstimate = 10;
    ctx = {estimate: this.totalEstimate};
  
}
```
+ ViewChild模板引用
```js
@Component({
  selector: 'app-root',
  template: `      
      <ng-template #defaultTabButtons>
          <button class="tab-button" (click)="login()">
            {{loginText}}
          </button>
          <button class="tab-button" (click)="signUp()">
            {{signUpText}}
          </button>
      </ng-template>
`})
export class AppComponent implements OnInit {

    @ViewChild('defaultTabButtons')
    private defaultTabButtonsTpl: TemplateRef<any>;

    ngOnInit() {
        console.log(this.defaultTabButtonsTpl);
    }

}
```
+ 模板引用作为参数
```js
@Component({
  selector: 'app-root',
  template: `      
<ng-template #customTabButtons>
    <div class="custom-class">
        <button class="tab-button" (click)="login()">
          {{loginText}}
        </button>
        <button class="tab-button" (click)="signUp()">
          {{signUpText}}
        </button>
    </div>
</ng-template>
<tab-container [headerTemplate]="customTabButtons"></tab-container>      
`})
export class AppComponent implements OnInit {

}
```

```js
@Component({
    selector: 'tab-container',
    template: `
<ng-template #defaultTabButtons>
    <div class="default-tab-buttons">
        ...
    </div>
</ng-template>
<ng-container 
  *ngTemplateOutlet="headerTemplate ? headerTemplate: defaultTabButtons">
</ng-container>
... rest of tab container component ...
`})
export class TabContainerComponent {
    @Input()
    headerTemplate: TemplateRef<any>;
}
```

## Component Style

+ styles(只作用于模块本身)
```js
@Component({
  selector: 'app-root',
  template: `
    <h1>Tour of Heroes</h1>
    <app-hero-main [hero]="hero"></app-hero-main>
  `,
  styles: ['h1 { font-weight: normal; }'],
  styleUrls: ['./hero-app.component.css']
})
...
```

+ `:host` `:host-context`

+ 模板内联样式
```js
@Component({
  selector: 'app-root',
  template: `
      <style>
      button {
        background-color: white;
        border: 1px solid #777;
      }
    </style>
     <link rel="stylesheet" href="../assets/hero-team.component.css">
    <h1>Tour of Heroes</h1>
    <app-hero-main [hero]="hero"></app-hero-main>
  `
})
```

+ Css 外联
```css
/* xxx.css */
@import './hero-details-box.css';
```

+ 引入sass,less
```js
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
...
```

+ 组件封装模式(`ShadowDom`样式不进不出，`Emulated`样式只进不出,全局样式可进,`None`Angular把css加到全局样式)
```js
@Component({
encapsulation: ViewEncapsulation.Native
...
```



## 指令
+ `@directive`可复用的行为,不包含template,需要加到已有元素上
+ 类型
    - 组件
    - 属性指令(改变DOM的外观或行为,如NgStyle)
    - 结构型指令(改变DOM布局,如ngif)
+ 属性指令
```html
<!-- 传递变量到属性指令 -->
<p appHighlight [highlightColor]="'orange'">Highlighted in orange</p>

<!-- @Input('appHighlight') highlightColor: string; -->
<!-- 指定别名，指令属性和属性名相同 -->
<p [appHighlight]="color">Highlight me!</p>
```

+ 结构指令
    - `*ngIf` microsyntax
    ```html
    <div *ngIf="hero" class="name">{{hero.name}}</div>
    <!-- 翻译成 -->
    <ng-template [ngIf]="hero">
      <div class="name">{{hero.name}}</div>
    </ng-template>
    ```
   - 微语法
      + `let a`->`let-a`
      + `trackby`->`ngForTrackBy`
      + NgFor 会在每次循环的context中添加隐式变量($implicit),如index,odd
      + `let-i`->`let i=index`
      + `let-hero`会重$implicit中找相应的值

   - 模板输入变量(let开头，The variable's scope is limited to a single instance of the repeated template)
   - 结构型指令不能在同一个元素上
   - `<ng-container>`可以做指令容器，分组元素，不会加到DOM中
   - 单独用`<ng-template>`不可见，结构指令可以让它正常工作


## pipe

+ `{{ birthday | date:"MM/dd/yy" }`值的转换
+ 自定义管道(必须在 AppModule 的 declarations 数组中包含这个管道)
```js
mport { Pipe, PipeTransform } from '@angular/core';
/*
 * Raise the value exponentially
 * Takes an exponent argument that defaults to 1.
 * Usage:
 *   value | exponentialStrength:exponent
 * Example:
 *   {{ 2 | exponentialStrength:10 }}
 *   formats to: 1024
*/
@Pipe({name: 'exponentialStrength'})
export class ExponentialStrengthPipe implements PipeTransform {
  transform(value: number, exponent: string): number {
    let exp = parseFloat(exponent);
    return Math.pow(value, isNaN(exp) ? 1 : exp);
  }
}
```
+ 管道做filter
```html
<div *ngFor="let hero of (heroes | flyingHeroes)">
  {{hero.name}}
</div>

<!-- 数组引用更改时才会更新
reset() { this.heroes = HEROES.slice(); } -->
```
+ pure/impure
  - pure:值变更时(或引用)才会执行pure pipe,使用纯函数
  - impure:angular会在每个组件的变更周期执行非纯管道
```js
@Pipe({
  name: 'flyingHeroesImpure',
  pure: false
})
```
+ AsyncPipe(非纯管道，接受Promise或Observable)
```html
 <p>Message: {{ message$ | async }}</p>
 <!-- this.message$ = interval(500).pipe(
      map(i => this.messages[i]),
      take(this.messages.length)
    ); -->
```


## tips


+ `ng-container` 可以添加结构指令，不会生成额外的元素

```html
<div *ngIf="lessons">
    <div class="lesson" *ngFor="let lesson of lessons">
        <div class="lesson-detail">
            {{lesson | json}}
        </div>
    </div>
</div>

<ng-container *ngIf="lessons">
    <div class="lesson" *ngFor="let lesson of lessons">
        <div class="lesson-detail">
            {{lesson | json}}
        </div>
    </div>
</ng-container>
```

+ `ngTemplateOutlet` dynamicly instantiate the template
```html
<ng-container *ngTemplateOutlet="loading"></ng-container>
```

+ `ViewContainerRef`获取自身容器的引用

+ `ElementRef`获取属性指令的宿主DOM

+ `HostListener` 监听宿主行为
```js
@HostListener('mouseenter') onMouseEnter() {
  this.highlight('yellow');
}
```

## ref

+ [Angular elements,custom elements,Web components](https://angular.cn/guide/elementscustom)
+ [动态组件](https://angular.cn/guide/dynamic-component-loader)
+ [NgForOf context](https://angular.cn/api/common/NgForOf)
+ [pipes](https://angular.cn/api?type=pipe)
+ [模板表达式](https://angular.cn/guide/template-syntax#template-expressions)