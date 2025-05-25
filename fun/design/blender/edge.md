# blender edge

## shortcut
+ 删除
    + `x`
        + 删除顶点

+ 融并边
    + `ctrl + x`

+ 细分
    + 选中边 -> RMB -> subdivide

+ 滑移
    + 选中边 -> RMB -> edge slide
    + `g g`

+ 挤出
    + 边挤出为面
    + `e z`
        + z轴方向挤出
    + 选中左侧挤出工具->左上点击 xyz(轴向挤出)
    + `e s` 
        + 挤出缩放

+ 环切(卡线)
    + `ctrl + r`
## 操作
+ 倒角（bevel）
    + 边，顶点都能倒角
    + `ctrl + b`

+ 环切(loop cut)
    + 左侧工具栏loop cut
    + LMB按下确认
    + LMB按住不放滑移

+ 循环边(loop edges)
    + loop cut的痕迹就是循环边
        + 首尾相接的边组成环
    + 选中循环边
        + 选中其中一条边->Select(左上)->select loops->edge loops
        + short cut
            + `alt + LMB`
                +  `shift + alt + LMB` 选中多个循环边
    + 循环边滑移
        + 选中循环边后`g g`
    + 删除循环边
        + `x`
        + `ctrl + x`
    + 法向收缩
    + 卡线
        + 限制缩放`s`的范围

+ 并排边(ring edges)
    + loop cut分割的平行边就是并排边
        + 相互平行的边
    + 选则
        + 选中其中一条边->Select(左上)->select loops->edge rings
        + short cut
             + `ctrl + alt + LMB`
                +  `shift + ctrl + alt + LMB` 

+ 选中并排面
    + 面选择模式下`ctrl + alt + LMB`
    + 在面的下部点击鼠标可以纵向选择面

+ 桥接循环边
    + 选中两组循环边->edge(左上)->bridge edge loops
        + 边数要相同
        + 属于同一物体
        + 检查面的朝向
            + `a` + `shift + n` 全选后重新计算法向
    + 应用
        + 对接
        + 打洞