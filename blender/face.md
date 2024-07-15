# blender face


## operation
+ subdivide
    + RMB
    + 面的细分本质是对边的细分

+ extrude(挤出面)
    + 左侧工具栏->extrude region
    + 挤出后->move
        + 调整基础的高低
    + Extrude along normals(法向挤出)
        + 可以同时选中多个面挤出
    + 挤出时选择方向(左上):
        + Normal
        + XYZ

+ Inset(内插面)
    + 面内缩一圈
    + 左上可以选择outset

+ Poke Faces(尖分面)
    + 选中面->RMB->Poke Faces
    + 把一个面分成多个三角形的组合
        + 中心添加点，和其他点连线

+ Trigulate faces(三角化)
    + 选中面->RMB->Trigulate faces
    + 把一个面拆分成三角形
        + 用现有点连线

+ Dissolve faces(融并面)
    + 选中面->RMB->dissolve faces
    + 合并面

+ 填充面
    + 需要选中边
    + 编辑状态 -> Face(左上) ->Fill
    + grid fill
        + 编辑状态 -> Face(左上) ->Grid Fill
        + 边数需要偶数
        + 多个面填充

## shortcut
+ 挤出
    + 选中面+ `E`

+ Inset
    + 选中面+ `i`

+ Scale
    + 选中面+ `s`

+ 删除面
    + `x`

+ 填充面
    + 选中边+ `F`
   

+ 撤销
    + `ctrl + z`

+ 手动分割面
    + `k`
        + `shift + k`中点吸附
    + RMB收刀
    + Enter确定
    + Esc取消
    + `ctrl + z`回撤
    + `a`
        + 开启角度约束
    + `c`
        + 切穿

## Normal
+ 正面的朝向
    + 背面一般不会渲染

+ 显示法向
    + 面编辑模式->右上角（Overlays）->Normals

+ 面朝向
    + Object Mode>右上角（Overlays）->Face oratation
    + 蓝色是正面
    + 可以使背面透明

+ 翻转面
    + 面编辑模式->选中面->Mesh(左上)->Normals->flip
