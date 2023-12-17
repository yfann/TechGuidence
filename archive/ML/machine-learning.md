

## 类型

+ 监督学习(训练数据包含了答案,标签)
    + K近邻算法
    + 线性回归
    + 逻辑回归
    + 支持向量机(SVM)
    + 决策树和随机森林
    + 神经网络

+ 非监督学习
    + 聚类（分组）
        + K均值
        + 层次聚类分析（Hierarchical Cluster Analysis，HCA）
        + 期望最大值
    + 可视化和降维
        + 主成分分析（Principal Component Analysis，PCA）
        + 核主成分分析
        + 局部线性嵌入（Locally-Linear Embedding，LLE）
        + t-分布邻域嵌入算法（t-distributed Stochastic Neighbor Embedding，t-SNE）
    + 关联性规则学习（挖掘大量数据以发现属性间有趣的关系）
        + Apriori 算法
        + Eclat 算法
+ 半监督学习
+ 强化学习
    + agent
        + 观察，选择，执行，反馈(奖励，惩罚)

+ 批量学习(离线学习)
    + 系统线下学习好后上线

+ 在线学习
    + 系统持续接收数据流学习,学习完可以丢弃数据
    + 数据量大时无法一次加载到内存，可以用此法
    + 也是离线学习的
    + 对数据改变的敏感


+ 基于实例学习
    + 先记忆学习案例
    + 然后使用相似度测量推广到新的例子

+ 基于模型学习
    + 模型选择（线性函数...）
    + 模型参数确定
        + 实用函数测量模型是否够好
        + 代价函数测量模型有多差
        + 正则化
            + 限定参数变化的范围

## tips

+ 回归任务
    + 单变量/多变量回归
    + 可以预测值

+ 大数据量学习
    + 多个服务器对批量学习拆分(MapReduce)
    + 线上学习


+ RMSE(均方根误差)
    + 68-95-99.7
    + 回归问题指标

+ MAE(平均绝对误差)

## ref

+ [Sklearn 与 TensorFlow](https://hands1ml.apachecn.org/#/docs/1)
+ [机器学习系统: 设计和实现](https://openmlsys.github.io/chapter_introduction/index.html#)