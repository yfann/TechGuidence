
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

## ref
+ [Prompt caching: 10x cheaper LLM tokens, but how?](https://ngrok.com/blog/prompt-caching/)

<!-- book -->
+ Build a Large Language Model (From Scratch) 


<!-- 教学项目 -->
+ [LLMs-from-scratch](https://github.com/rasbt/LLMs-from-scratch/blob/main/ch05/13_olmo3/standalone-olmo3.ipynb)