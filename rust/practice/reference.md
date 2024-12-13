

## 迭代器解引用
+ `iter().filter(|&&coin| curr_amount >= coin)` 模式匹配
    + 同`iter().filter(|coin_ref| curr_amount >= **coin_ref)` 解引用


+ `iter()` 会多加一层引用`&T`



## 解引用
+ `*x` 
    + 解引用
+ `|&x|`
    + 模式匹配解引用
+ `.copied()`
    + 解引用并复制
+ `.cloned()`
    + 解引用并克隆