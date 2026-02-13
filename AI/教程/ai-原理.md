
# LLM Architecture

## tokenizer
+ token
    + 一个单词
    + 单词一部分(subword)
    + 一个字符
    + 符号
    + 短语
+ 每个token都有一个唯一id

## embedding
+ dimensions
    + 在n维空间中的一个位置
    + token没有dimensions

+ dimension越多，可比较的方面越多

+ 位置编码（Positional Encoding / Positional Embedding）
    + 表示token间的顺序
    + Transformer 本身不感知顺序


## transformer
+ attention


## ref
+ [Prompt caching: 10x cheaper LLM tokens, but how?](https://ngrok.com/blog/prompt-caching/)

<!-- book -->
+ Build a Large Language Model (From Scratch) 
+ [Understanding Machine Learning: From Theory to Algorithms](https://www.cs.huji.ac.il/~shais/UnderstandingMachineLearning/copy.html)


<!-- 教学项目 -->
+ [LLMs-from-scratch](https://github.com/rasbt/LLMs-from-scratch/blob/main/ch05/13_olmo3/standalone-olmo3.ipynb)
+ [nanochat](https://github.com/karpathy/nanochat)
    + AI 教学模型，演示 ChatGPT 的原理。你只需花费100美元租用 GPU 训练，就能自己训练出一个类似于 GPT-2 生成能力的可用模型
+ [nano-vllm](https://github.com/GeeeekExplorer/nano-vllm)


<!-- ai可视化 -->
+ [understanding neural networks visually](https://visualrambling.space/neural-network/)