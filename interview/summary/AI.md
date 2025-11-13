

## RAG
+ RAG过程
    + 文档切分 → 将长文本分块（chunking）
    + 向量化 → 用 embedding 模型（如 text-embedding-3-large、bge-m3）生成向量
    + 索引建立 → 把所有向量存入向量索引结构
    + 检索 → 根据用户 query 的向量表示，快速找到最相似的若干向量
    + 生成 → 把这些片段交给 LLM 生成答案

+ index优化
    + 向量预处理优化
        + Embedding 模型选择
            + 使用适配语料的模型（中文用 bge-large-zh，英文多语言用 bge-m3、text-embedding-3-large）
            + 尽量统一语料风格，减少语义偏移
        + 向量归一化（normalize）
            + 对所有 embedding 做 L2 归一化，使余弦相似度计算等价于内积，提高 ANN（Approximate Nearest Neighbor）效果。
    + 索引结构优化
        + 小规模 (<1万条)：可用 Flat
        + 中规模 (1万-100万)：推荐 HNSW
        + 超大规模 (100万+)：建议 IVF+PQ 或 DiskANN
    + 参数调优
        + HNSW
            + M	每个节点连接的邻居数	16~64	越大召回越好但占内存
            + efConstruction	建索引时的探索宽度	100~400	越大精度越高，建索引慢
            + efSearch	查询时探索宽度	50~200	越大召回率提高，速度变慢
        + IVF
            + nlist	聚类中心数	sqrt(N) 左右	越多查询更快但需更多训练
            + nprobe	检索时访问的聚类数	8~32	越大召回率高但速度慢
    + Chunk 粒度与索引层优化
        + Chunk 长度	300~800 tokens	太短语义丢失，太长不易命中
        + Overlap 重叠	50~150 tokens	提高上下文连续性
        + 过滤低价值文本	去除页眉页脚、目录等无关信息	提高索引质量
    + 二级索引（Hybrid Indexing）
        + 结合向量检索 + 关键词检索（BM25）
        + 可用在：
            + 技术文档类RAG（高精度要求）
            + 法律、标准、医疗文本等
        + Milvus / Weaviate / Elasticsearch + FAISS 都支持 hybrid
    + 索引更新与缓存优化
        + 定期重建索引：当数据更新频繁时（如知识库更新）
        + 缓存热门 query：使用 LRU Cache 存储常用问题的结果
        + 增量索引（Dynamic Indexing）：部分向量库支持在线添加数据（如 Milvus、Qdrant）


## tips
+ recall
    + 招全

+ Precision
    + 找准