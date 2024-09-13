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
## Softmax Regression 
+ softmax模型可以用来给不同的对象分配概率

+ 也称为多类逻辑回归或多类别 logistic 回归，是一种用于多类别分类的机器学习模型。它在输出层使用了 softmax 函数，将输入值转化为概率分布，从而能够对多个类别进行概率估计。

+ 输入层： 与二元 logistic 回归不同，Softmax Regression 的输入层可以接受多个特征。每个特征都有一个相关的权重，模型的输入是这些特征的线性组合。

+ 输出层： 输出层使用 softmax 函数，将模型的原始输出转换为表示不同类别的概率分布。对于给定的输入，Softmax 函数将每个类别的分数映射为一个介于 0 和 1 之间的概率值，确保所有类别的概率之和为 1。

+ 损失函数： Softmax Regression 使用交叉熵损失函数，用于衡量模型的预测概率分布与实际标签之间的差异。该损失函数在多类别分类问题中非常常见，它惩罚模型对正确类别的错误预测。

+ 训练： 模型通过梯度下降等优化算法来最小化损失函数。梯度下降的过程涉及计算损失函数对模型参数的梯度，并相应地更新这些参数。

+ Softmax Regression 在神经网络中常用于输出层，特别是在多类别分类问题中。它是深度学习中的基础组件之一，通常与其他层和激活函数组合在一起，构建更复杂的神经网络架构。softmax 函数的应用使得模型能够对多个类别进行概率估计，因此非常适用于识别多类别的任务，如图像分类、自然语言处理中的词性标注等。










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