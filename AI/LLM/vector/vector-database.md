# vector


+ dimensions
    + features
    + facets

+ Vector search
    + return items by closeness 
    + usage
        + recommender system
    + Similarity
        + direction
        + direction + size

## similarity
+ measure
    + Euclidean distance
        + The direct distance between the "tips" of the two vectors. 
    + Manhattan distance
    + Dot product
    + Cosine similarity

+ The Euclidean distance is a "safe" default to use when you don't know much about your data.

+ If all vectors have the same length (or can be normalized to do so), cosine similarity/dot product is probably a good choice.

+ The Manhattan distance might be a better measure if the vectors have a high number of dimensions


## vector embeddings
+ Vector embeddings（向量嵌入）是一种将高维数据（如文本、图像或其他复杂数据）转换为低维实数向量的技术。
+ “维度”在向量嵌入中代表了数据在不同特征空间上的表示。
+ word2Vec
+ BERT

## tips
+ weight
    + true/false
        + 1/0.5
        + 30/15
        + 不同数字代表true/false,会影响搜索结果，数字越大权重越高

+ feature engineering
    + determining dimensions



## ref
+ [An exploration of vector search](https://blog.shalvah.me/posts/an-exploration-of-vector-search)