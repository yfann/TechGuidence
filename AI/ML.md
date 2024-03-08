# Machine learning

+ feature -----> label

+ deep learning
     + 使用了神经网络

## 解决问题（监督学习）
+ regression(回归)
    + 预测一个值
        + 房价，天气...
    + label是连续的
    + 算法
        + linear regression(线性回归)
        + 神经网络
+ classification(分类)
    + 标记事物的类别标签
    + 离散值
    + 算法
        + 逻辑回归
        + 决策树
        + 神经网络

## 机器学习模型
+ 线性模型(线性回归，逻辑回归)
+ 非线性模型(向量机,k最邻近分类)
+ 基于树和集成的模型(决策树，随机森林)
+ 神经网络(人工,卷积,长短去记忆)
    + 时候处理特征量巨大的数据

## regression analysis(回归分析)
+ 确定俩种或俩种以上变量间相互依赖的定量关系的一种统计分析方法
    + x->y
+ ML中，回归应用与被预测对象具有连续值特征的情况（降雨量,销售量...）

## correlation analysis(相关分析)
+ seaborn
    + heatmap

## keys
+ Artificial Neural Network(ANN)
    + 人工神经网络
+ Convolutional Neural Network(CNN)
    + 卷积神经网络
+ Recurrent Neural Network(RNN)
    + 循环神经网络

+ reinforcement learning(强化学习)
    + 在封闭的环境学习

+ 监督学习
    + 在数据中学习

+ overfit(过拟合)
    + 模型对当前数据集针对性过强，换一批新数据就不灵了
    + 泛化能力弱

+ information leak
    + 模型在验证集上过拟合

+ 评估
    + training set
        + 60% 数据用于
    + validation set
        + 20%
    + test set
        + 20%

+ k-fold validation