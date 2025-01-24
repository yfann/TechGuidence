

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

## ref
+ [状态管理​](https://cn.vuejs.org/guide/scaling-up/state-management.html)
+ [依赖注入](https://cn.vuejs.org/guide/components/provide-inject#prop-drilling)
+ [组件事件](https://cn.vuejs.org/guide/components/events.html)
+ [v-model](https://cn.vuejs.org/guide/components/v-model.html)
