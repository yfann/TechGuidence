
## ml
+ Decision Trees
    + 可解释

+ Linear Regression
    + 回归问题

+ Logistic Regression
    + 分类问题

+ transfer learning 
    + 迁移学习是一种用已有的预训练模型（如图像识别模型）来解决新但相关的任务的方法。
    + 只需对已有模型进行微调（fine-tune），大大减少训练时间和数据需求。

+ unsupervised learning
    + 无监督学习用于没有标签的数据，如聚类、降维等。

## evaluation metrics

+ BERTScore
   + summarization
   + semantic similarity 

+ Real-world knowledge (RWK) score
    + hallucinations

<!-- classification -->
+ Area Under the ROC Curve (AUC) score:
   + AUC is primarily used for evaluating the performance of binary classification models.
+ accuracy
+ precision
+ recall
+ AUC-ROC
+ Confusion Matrix
+ F1 score:
    + a common metric for classification tasks

<!-- regression metrics -->
+ R squared
+ R2 score
    + The R2 score is a common metric used in regression problems.
    + 用于回归任务，衡量预测值与真实值的拟合程度。
    + 适合连续数值预测，不适用于分类任务。
+ Mean Squared Error (MSE)
    + MSE is another common metric used in regression problems. 
+ Root Mean Squared Error（RMSE）
   + 同样用于回归任务，衡量预测值与真实值之间的误差。
   + 不适用于分类模型。

## algorithm
+ K-nearest neighbors (k-NN)
    + 有监督
    + k-NN is a non-parametric, instance-based learning algorithm that can be used for both classification and regression.
+ K-means
    + unsupervised learning algorithm used for clustering


## tips
+ Data augmentation
    + （数据增强）指增加训练样本数量，不直接减少标注错误。
+ Anomaly Detection
    + 是检测非典型模式或异常行为的 AI 技术
+ PDPs(Partial dependence plots)
    + 机器学习模型解释的可视化工具，用来展示一个或两个特征对模型预测结果的边际影响
+ Increase the number of epochs
    + 用于控制模型训练的次数。