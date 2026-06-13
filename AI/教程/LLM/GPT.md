# GPT(generative pre-trained transformers)

+ NLP演化
    + n-grams->RNNs and LSTMs->Transformers->LLMs

+ transformer
    + encoder
    + attention
    + decoder

+ 组成
    + self attention
    + decoder only
        + 生成输出
    + embedding layer
        + token->vector

+ process
    + tokenization
    + embedding
    + decoder
    + Autoregressive Generation（自回归生成）
        + 依赖
            + 因果注意力（Causal Attention）
                + self-attention只能看到之前的token，不能看到未来的token
        + token一个一个生成，生成的token做为下个token的输入
            
+ SFT(supervised fine-tuning)
    + 人来回答问题，用结果集训练

+ RLHF(reinforcement learning from human feedback)
    + RM(reward model)
        + 对SFT model生成的答案打分
    + reinforcement learning
    
## 语言模型
+ N-Gram
    + 一个词出现的频率和前面N-1个词相关
+ Bag-of-Words
    + 文本是由词组成的无序组合
    + 忽略顺序只关注词频
    + 向量表示，余弦相似度
+ 神经概率语言模型
    + CNN
    + RNN
    + LSTM
+ Word2Vec
+ Transformer

## 预训练+ Fine-tuning(微调) 模式
+ 对预训练模型微调


## prompt/instruct 模式
+ 不经过微调


## tips
+ emergent capabilities

## ref
+ [The Illustrated GPT-2 (Visualizing Transformer Language Models)](https://jalammar.github.io/illustrated-gpt2/)
    + [](https://www.jiqizhixin.com/articles/2019-09-03-14)
    + [](https://www.jiqizhixin.com/articles/2019-08-26-12)