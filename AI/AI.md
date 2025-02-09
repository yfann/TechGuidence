
# AI

+ AI
    + ML
        + Deep learning
            + neural network
                + transformer
                    + GPT4


+ CV(Computer Vision)
    + CNN
    + AlexNet

## tips
+ 生成式AI
    + 把无限问题转换为有限问题(分类问题)
+ autoregressive generation
    + 复杂问题拆解成小的单位，再按照一定序列输出
+ self-consistency
    + 每次回答同一个问题的，给出不同结果
        + 文字接龙(根据概率产生)
    + 反复问同一个问题取结果相似的
+ 模型可以检查自己给出的结果
+ tree of thought
    + 拆解任务
    + 给出多个结果
    + 自我检查结果是否正确
+ Chain of Thought(CoT)
    + Let's think step by step
        + 对数学问题有奇效
+ 可能有效的prompt
    + answer by explain
    + 情绪勒索
        + 这个对我很重要
+ retrieval augented generation(RAG)
    + 对专业问题，可以搜索网络或资料库获取外部信息
    + 结合生成式模型
+ hyperparameter
    + 设置参数
+ overfitting
    + 训练成功，测试失败 
+ self-supervised learning
    + 不需要人工介入
    + 自动网络爬资料
+ Model size
    + 参数量
日5为3
+ training
    1. pre-train
        + self-supervised learning
        + 初始化参数  
    2. instruction fine-tuning(alignment)
        + supervised learning
            + 需要人工标注
        + 过程好不好
    3. RLHF(Reinforcement learning)增强式学习(alignment)
        + PPO(Proximal policy optimization)
        + 生成的结果是否好
            + 多出现人觉得好的答案

+ reward model(回馈模型)
    + 对回答评分
        
+ AR(AUtoregressive Generation)
    + 文字接龙
+ NAR(Non-autoregressive Generation)
    + 各个位置并行输出
    + 图片生成
    + 品质低
        + 需要过多遍NAR
