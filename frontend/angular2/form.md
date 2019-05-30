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


## dynamic form

## ref

+ [angular form](https://angular.cn/guide/forms-overview)
