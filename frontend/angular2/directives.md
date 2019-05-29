
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

## directives

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