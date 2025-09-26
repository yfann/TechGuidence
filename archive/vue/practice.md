

## 父子组件
+ 子------（data）------>父组件
    + emit
+ 子---------（call）----------->父组件function
    + emit
    + prop
        + 可以绑定方法
    + 方法也可以作为数据传递
        + Provide/inject
        + prop


## 组件间数据共享
+ prop逐级穿透
    + 依赖注入(Provide/inject)
+ 把状态抽取出来作为一个单独组件(js)
+ 用Pinia库


## 事件
+ `<template>`中可以使用`$emit()`
+ `<script setup>`中使用`defineEmits()`
+ `emit('update:isShowLeft', true);`
    + 触发v-model的更新

## nextTick
+ 确保在 DOM 更新完成后执行回调
    + 在 Vue 中，数据的变化并不会立即反映到 DOM 上，因为 Vue 会将 DOM 更新推迟到当前事件循环结束时统一执行（Vue 的异步 DOM 更新机制）。如果你想在数据更新后立即操作 DOM，就需要使用 nextTick 来确保 DOM 已经更新完成。
+ nextTick()中可以安全的从DOM中取更新后的数据
+ 使用场景
    + 数据更新后立即操作最新 DOM。
    + 等待 DOM 渲染完成后聚焦或触发动画。

## ref
+ [状态管理​](https://cn.vuejs.org/guide/scaling-up/state-management.html)
+ [依赖注入](https://cn.vuejs.org/guide/components/provide-inject#prop-drilling)
+ [组件事件](https://cn.vuejs.org/guide/components/events.html)
+ [v-model](https://cn.vuejs.org/guide/components/v-model.html)
