# Seq2Seq
+ Seq2Seq（Sequence to Sequence）模型是一种神经网络架构，用于处理序列到序列的任务，即将一个序列（例如句子、时间序列等）转换为另一个序列。最初，Seq2Seq模型主要用于机器翻译任务，但它也可以应用于其他任务，如文本摘要、对话生成、图像描述生成等。


## Encoder
+ 输入：一个序列（如一个句子的词向量序列）。
+ 输出：一个隐状态（hidden state）向量。
+ 编码器通常是一个循环神经网络（RNN）、长短期记忆网络（LSTM）或门控循环单元（GRU）。它逐步读取输入序列的每一个元素（如单词）并生成相应的隐状态向量。最后，编码器会输出一个综合了整个输入序列信息的隐状态向量，称为“上下文向量”（context vector）。

## 解码器（Decoder）
+ 输入：编码器生成的上下文向量以及解码器前一步的输出（在训练时，通常是目标序列中的前一个元素）。
+ 输出：解码器逐步生成输出序列中的每一个元素（如翻译后的单词）。
+ 解码器与编码器结构类似，也通常是RNN、LSTM或GRU。它利用上下文向量作为初始状态，结合前一步的输出来生成新序列的每个元素

## Attention Mechanism
+ 在标准的Seq2Seq模型中，所有输入序列信息都被压缩到一个上下文向量中，这对于长序列来说可能导致信息丢失。注意力机制通过为解码器的每一步生成动态上下文向量（即权重分配给编码器输出的每一个时间步）来解决这个问题。它允许模型在生成每个输出时“关注”输入序列的不同部分，从而提高翻译或生成的质量。
+ Attention allows the model to focus on the relevant parts of the input sequence as needed.


## ref
+ [The Illustrated Transformer](https://jalammar.github.io/visualizing-neural-machine-translation-mechanics-of-seq2seq-models-with-attention/)