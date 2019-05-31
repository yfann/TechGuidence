# 表单

+ FormControl 实例用于追踪单个表单控件的值和验证状态。
+ FormGroup 用于追踪一个表单控件组的值和状态。
+ FormArray 用于追踪表单控件数组的值和状态。
+ ControlValueAccessor 用于在 Angular 的 FormControl 实例和原生 DOM 元素之间创建一个桥梁。

## 响应式表单
+ 数据模型不可变，每当触发更改时FormControl都会返回一个新的数据模型，而不是修改原来的
+ 模型驱动，值会随时间变化，围绕Observable流构建表单
+ 需要引入`import { ReactiveFormsModule } from '@angular/forms';`
+ `FormControl`
```js
export class NameEditorComponent {
  name = new FormControl('');
}

// <input type="text" [formControl]="name">
```
+ 可以访问表单控件此刻的状态和值
+ 显示值
    + 模板使用` AsyncPipe `
    + 模板输出`{{ name.value }}`,获取当前值的快照
+ 修改值
```js
updateName() {
  this.name.setValue('Nancy');
}
```
+ `FormGroup` 可以嵌套
```js
...
export class ProfileEditorComponent {
  profileForm = new FormGroup({
    firstName: new FormControl(''),
    lastName: new FormControl(''),
  });
}
```

```html
<form [formGroup]="profileForm">
  <label>
    First Name:
    <input type="text" formControlName="firstName">
  </label>
  <label>
    Last Name:
    <input type="text" formControlName="lastName">
  </label>
</form>
```
+ `patchValue()` 部分更新数据，针对模型结构更新
```js
updateProfile() {
  this.profileForm.patchValue({
    firstName: 'Nancy',
    address: {
      street: '123 Drew Street'
    }
  });
}
```
+ `FormBuilder`
```js
// Formbuilder构建
import { Component } from '@angular/core';
import { FormBuilder } from '@angular/forms';
@Component({
  selector: 'app-profile-editor',
  templateUrl: './profile-editor.component.html',
  styleUrls: ['./profile-editor.component.css']
})
export class ProfileEditorComponent {
  profileForm = this.fb.group({
    firstName: [''],
    lastName: [''],
    address: this.fb.group({
      street: [''],
      city: [''],
      state: [''],
      zip: ['']
    }),
  });
  constructor(private fb: FormBuilder) { }
}
```

```js
// 普通构建
profileForm = new FormGroup({
  firstName: new FormControl(''),
  lastName: new FormControl(''),
  address: new FormGroup({
    street: new FormControl(''),
    city: new FormControl(''),
    state: new FormControl(''),
    zip: new FormControl('')
  })
});
```

+ `Validators`
```js
import { Validators } from '@angular/forms';

profileForm = this.fb.group({
  firstName: ['', Validators.required],
  lastName: [''],
  address: this.fb.group({
    street: [''],
    city: [''],
    state: [''],
    zip: ['']
  }),
});
```

+ `profileForm.status`表单状态

+ `FormArray`
```js
import { FormArray } from '@angular/forms';
...
profileForm = this.fb.group({
  firstName: ['', Validators.required],
  lastName: [''],
  address: this.fb.group({
    street: [''],
    city: [''],
    state: [''],
    zip: ['']
  }),
  aliases: this.fb.array([
    this.fb.control('')
  ])
});
...
get aliases() {
  return this.profileForm.get('aliases') as FormArray;//AbstractControl
}
...
addAlias() {
  this.aliases.push(this.fb.control(''));
}

```

```html
<div formArrayName="aliases">
  <h3>Aliases</h3> <button (click)="addAlias()">Add Alias</button>

  <div *ngFor="let address of aliases.controls; let i=index">
    <!-- The repeated alias template -->
    <label>
      Alias:
      <input type="text" [formControlName]="i">
    </label>
  </div>
</div>
```

## 模板驱动表单

+ 双向绑定数据(No unique changes to track on the data model)
+ 表单使用`[(ngModel)]`时必须定义element 的`name`
+ `ngModel`追踪状态,为组件添加特定css反应状态变化
    - ng-touched/ng-untouched 控件被访问过
    - nd-dirty/ng-pristine 控件值变化
    - ng-valid/ng-invalid
        ```css
        <!-- 可以自定义样式 -->
        .ng-valid[required], .ng-valid.required  {
        border-left: 5px solid #42A948; /* green */
        }

        .ng-invalid:not(form)  {
        border-left: 5px solid #a94442; /* red */
        }
        ```
+ 访问模板状态
```html
 <form (ngSubmit)="onSubmit()" #heroForm="ngForm">
<label for="name">Name</label>
<input type="text" class="form-control" id="name"
       required
       [(ngModel)]="model.name" name="name"
       #name="ngModel">W
       <!-- why "ngModel"? A directive's exportAs property tells Angular how to link the reference variable to the directive. You set name to ngModel because the ngModel directive's exportAs property happens to be "ngModel". -->
<div [hidden]="name.valid || name.pristine"
     class="alert alert-danger">
  Name is required
</div>
```

## validation

1. 模板驱动验证(`#name="ngModel"` #name="ngModel" 把 NgModel 导出成了一个名叫 name 的局部变量)
```html
<input id="name" name="name" class="form-control"
      required minlength="4" appForbiddenName="bob"
      [(ngModel)]="hero.name" #name="ngModel" >
<div *ngIf="name.invalid && (name.dirty || name.touched)"
    class="alert alert-danger">
  <div *ngIf="name.errors.required">
    Name is required.
  </div>
  <div *ngIf="name.errors.minlength">
    Name must be at least 4 characters long.
  </div>
  <div *ngIf="name.errors.forbiddenName">
    Name cannot be Bob.
  </div>

</div>
```
+ 属性验证器(required,minlength)
+ 模板驱动自定义验证(可以用指令保证验证函数)
```js
@Directive({
  selector: '[appForbiddenName]',
  providers: [{provide: NG_VALIDATORS, useExisting: ForbiddenValidatorDirective, multi: true}]
})
export class ForbiddenValidatorDirective implements Validator {
  @Input('appForbiddenName') forbiddenName: string;
 
  validate(control: AbstractControl): {[key: string]: any} | null {
    return this.forbiddenName ? forbiddenNameValidator(new RegExp(this.forbiddenName, 'i'))(control)
                              : null;
  }
}

// <input id="name" name="name" class="form-control"
//       required minlength="4" appForbiddenName="bob"
//       [(ngModel)]="hero.name" #name="ngModel" >
```

+ 跨字段验证

```js
@Directive({
  selector: '[appIdentityRevealed]',
  providers: [{ provide: NG_VALIDATORS, useExisting: IdentityRevealedValidatorDirective, multi: true }]
})
export class IdentityRevealedValidatorDirective implements Validator {
  validate(control: AbstractControl): ValidationErrors {
    return identityRevealedValidator(control)
  }
}
```

```html
<form #heroForm="ngForm" appIdentityRevealed>
<div *ngIf="heroForm.errors?.identityRevealed && (heroForm.touched || heroForm.dirty)" class="cross-validation-error-message alert alert-danger">
    Name cannot match alter ego.
</div>
```
+ 异步验证
```html
<!-- 异步验证完成时pending状态会变更 -->
<input [(ngModel)]="name" #model="ngModel" appSomeAsyncValidator>
<app-spinner *ngIf="model.pending"></app-spinner>
```
```js
@Injectable({ providedIn: 'root' })
export class UniqueAlterEgoValidator implements AsyncValidator {
  constructor(private heroesService: HeroesService) {}

  validate(
    ctrl: AbstractControl
  ): Promise<ValidationErrors | null> | Observable<ValidationErrors | null> {
    return this.heroesService.isAlterEgoTaken(ctrl.value).pipe(
      map(isTaken => (isTaken ? { uniqueAlterEgo: true } : null)),
      catchError(() => null)
    );
  }
}

interface HeroesService {
  isAlterEgoTaken: (alterEgo: string) => Observable<boolean>;
}
```

+ `<input [(ngModel)]="name" [ngModelOptions]="{updateOn: 'blur'}">`

2. 响应式表单的验证（不应该在模板上加验证器，应该加到FormControl上）
+ 验证器函数
    - 同步验证器函数(返回结果，第二参数)
    - 异步验证器函数（返回Promise或Observable，第三参数）
    - 同步通过后执行异步
```js
ngOnInit(): void {
  this.heroForm = new FormGroup({
    'name': new FormControl(this.hero.name, [
      Validators.required,
      Validators.minLength(4),
      forbiddenNameValidator(/bob/i) // <-- Here's how you pass in the custom validator.
    ]),
    'alterEgo': new FormControl(this.hero.alterEgo),
    'power': new FormControl(this.hero.power, Validators.required)
  });
}
get name() { return this.heroForm.get('name'); }
```

```js
//自定义验证
export function forbiddenNameValidator(nameRe: RegExp): ValidatorFn {
  return (control: AbstractControl): {[key: string]: any} | null => {
    const forbidden = nameRe.test(control.value);
    return forbidden ? {'forbiddenName': {value: control.value}} : null;
  };
}
```

+ 跨字段验证
```js
const heroForm = new FormGroup({
  'name': new FormControl(),
  'alterEgo': new FormControl(),
  'power': new FormControl()
}, { validators: identityRevealedValidator });

/** A hero's name can't match the hero's alter ego */
export const identityRevealedValidator: ValidatorFn = (control: FormGroup): ValidationErrors | null => {
  const name = control.get('name');
  const alterEgo = control.get('alterEgo');

  return name && alterEgo && name.value === alterEgo.value ? { 'identityRevealed': true } : null;
};

// <div *ngIf="heroForm.errors?.identityRevealed && (heroForm.touched || heroForm.dirty)" class="cross-validation-error-message alert alert-danger">
//     Name cannot match alter ego.
// </div>
```
+ `new FormControl('', {updateOn: 'blur'});`


## ref

+ [angular form](https://angular.cn/guide/forms-overview)
+ [内置验证器](https://angular.cn/api/forms/Validators)
+ [动态表单](https://angular.cn/guide/dynamic-form)
