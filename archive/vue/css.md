
# vue css

## scoped
+ `<style scoped>`
    + 只作用于当前组件
        + 子组件不会受影响
    + 会生成唯一的data attribute
    + css选择器都会带上data attribute
        + `.my-class[data-v-123456]`
    
+ `:deep()`
    + 样式可以影响到子组件


## tips
+ data attribute
    + `data-`开始的属性
    + 可以给html添加额外信息
```js
<div data-user-id="123"></div>

const div = document.querySelector('div');
const userId = div.dataset.userId; 

// css
[data-user-id="123"] {
  background-color: red;
}
```