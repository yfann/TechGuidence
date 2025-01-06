+ 训练AI的手段
    + 机器学习(machine learning)
        + 深度学习（deep learning）

+ neural network(模型)
    + transformer


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