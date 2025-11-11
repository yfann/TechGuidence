

## 优化
+ 优化文档质量	在上传前清洗文本（去掉页眉页脚、目录、表格）
+ 控制 Chunk 大小	手动分段（例如每段 500 字左右）再上传多个文件
+ 分库管理	把不同主题的文档建成不同的“知识源”，减少噪音检索
+ Prompt 调优	在 Copilot 中配置提示词，引导模型使用检索内容
+ 外部 RAG + API 接入	自己在 Azure / 本地搭建优化过的 RAG 系统，通过 API 让 Copilot 调用

## 企业优化方案
+ 自建 RAG 层
    + 用 FAISS / Milvus / Qdrant 搭建向量检索
    + 自己决定 chunk、embedding 模型、HNSW 参数等
    + 可用 Azure Function / FastAPI 封装为 HTTP API
+ Copilot Studio 调用自建 RAG
    + 在 Copilot Studio 中创建 “Custom connector”
    + 连接你的 RAG API
    + 在对话流程中：
        + 调用你的检索服务 → 拿到候选片段
        + 把结果拼接进系统 prompt 传给 GPT 模型生成回答

## ref
+ [copilot studio](https://www.microsoft.com/en-us/microsoft-365-copilot/microsoft-copilot-studio)
    + en-us