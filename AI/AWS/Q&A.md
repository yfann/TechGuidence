
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

+ Bilingual Evaluation Understudy (BLEU)
    + for evaluating machine translation
    + It measures the similarity between a machine-generated translation and a set of human-created reference translations. 
    
+ BERTScore
   + summarization
   + semantic similarity 

+ Real-world knowledge (RWK) score
    + hallucinations

+ Recall-Oriented Understudy for Gisting Evaluation （ROUGE） score
    + ROUGE is primarily used for evaluating summarization tasks,
    + 评估自动文本摘要和生成内容质量的评价指标
        + 自动摘要
        + 机器翻译
        + 对话生成
        + 文本生成模型（如 GPT、T5、BART）输出的质量评估

<!-- classification -->
+ Area Under the ROC Curve (AUC) score:
   + AUC is primarily used for evaluating the performance of binary classification models.
+ accuracy
   + 准确率
+ precision
+ recall
+ AUC-ROC
+ Confusion Matrix
+ F1 score:
    + a common metric for classification tasks
    + highly imbalanced datasets

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
+ Mean absolute percentage error (MAPE)
    +  是一种常用的回归模型误差评估指标，用于衡量预测值与实际值之间的相对误差。它的直观含义是：预测平均偏离真实值的百分比。
## algorithm&models
+ Detoxify algorithm 
    + 有毒语言检测算法（toxic language detection algorithm）
+ K-nearest neighbors (k-NN)
    + 有监督
    + k-NN is a non-parametric, instance-based learning algorithm that can be used for both classification and regression.
+ K-means
    + unsupervised learning algorithm used for clustering
+ Autoregressive Integrated Moving Average (ARIMA)
    + 自回归积分滑动平均
    + Time Series Forecasting
    + 主要用于分析和预测具有趋势性或季节性模式的时间序列数据
+ Linear regression
    + a supervised learning algorithm used for regression tasks
+ Logistic regression model
    + a highly interpretable model
    + It models the probability of a binary outcome (like churn/no churn) and provides coefficients (weights) for each input variable. 


## hyperparameter 
+ Learning rate
    +  controls how much the model adjusts its weights and biases with respect to the loss gradient during backpropagation
    + High learning rate: Can cause the model to overshoot the optimal solution, leading to unstable training or divergence.
    + Low learning rate: Can lead to very slow training and the model getting stuck in local minima, or it might prevent the model from learning sufficiently.

+ regularization parameter
    + prevent overfitting
        + Regularization is a technique used to prevent overfitting by adding a penalty to the loss function for large coefficients
    + Increase the regularization parameter to decrease model complexity.
+ Model Complexity/Capacity
    +  Reducing the number of layers, neurons per layer, or using a simpler model architecture.

+ Early Stopping
    + Monitoring performance on a validation set and stopping training when validation performance starts to degrade, even if training loss is still decreasing.

+ Learning Rate Schedule:
    + Dynamically adjusting the learning rate during training (e.g., reducing it over time).

+ Pooling size 
    + In CNNs, pooling layers reduce the spatial dimensions of the feature maps, which helps to:
        + Reduce computational complexity.
        + Provide translational invariance.
        + Reduce overfitting.

## tips
+ Data augmentation
    + （数据增强）指增加训练样本数量，不直接减少标注错误。
+ Anomaly Detection
    + 是检测非典型模式或异常行为的 AI 技术
+ PDPs(Partial dependence plots)
    + 机器学习模型解释的可视化工具，用来展示一个或两个特征对模型预测结果的边际影响
+ Increase the number of epochs
    + 用于控制模型训练的次数。
+ Exploratory data analysis
    + 探索性数据分析

+ fine-tuning vs continued pre-training
    + fine-tuning
        + labeled data
    + continued pre-training
        + unlabled data

+ Shapley values 
    + used in machine learning to explain the output of any model. 

+ contextual grounding
    + reduce hallucinations
        + Retrieval-Augmented Generation (RAG)
        + Providing Specific Instructions
            +  Explicitly telling the model to "only use the information provided in this document to answer the question."
+  Activation function
    + An activation function introduces non-linearity into the model, allowing it to learn complex patterns.