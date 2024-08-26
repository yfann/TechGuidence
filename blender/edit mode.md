
## 选择
+ 左侧选择箭头长按

+ edit mode下添加会组成同一个物体
    + 同一个物体，顶点不一定要相连

## 操作
+ 加选
    + `shfit`
+ 减选
    + `ctrl`
+ 全选
    + `a`

+ 合并物体
    + 选中要合并的物体+ `ctrl + j`
        + 名字为最后选中的物体
        + selected -> active
    + or RMB->merge

+ 分离物体
    + 编辑模式下选择要分离物体的全部点->RMB->seprate
    + 分成俩物体

+ 选中关联项
    + 选中一个顶点+ `ctrl + l`

+ 拆分(还是一个物体)
    + 选中一个面->RMB->split
    
+ 分离借形
    + 选中面 + `shift + d` + `esc` + RMB->分离 + `/` + `e`挤出

+ 变化轴心点(顶部坐标轴旁边
    + 质心
        + 按照点的数量计算
        + 移动时的点
    + 边界框
        + 边界框的中心
        + 显示边界框
            + object properties->view port display->bounds
    + 游标
        + 可以指定位置



## options
+ proportional editing(top)
    + 拖动一个点时周围的点一起平滑的随着动
        + 拖拽的同时转动滚轮，可以修改衰减半径


+ select (top)
    + 间隔弃选

+  表面吸附（top，磁铁图标）

+ 选中元素，活动元素
    + 最后选中的是活动元素（红色）