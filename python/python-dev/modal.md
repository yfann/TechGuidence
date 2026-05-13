## modal
+ Modal 是一个面向 Python 的 Serverless 计算平台，专门优化了 GPU 和 AI 工作负载
+ Python SDK + 云端执行平台 + 自动扩缩容 GPU 基础设施
+ code
```python
import modal

app = modal.App()

@app.function()
def f(x):
    return x * 2
```

## ref
+ [modal](https://modal.com/docs/examples/hello_world)