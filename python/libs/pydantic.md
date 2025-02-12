# pydantic
+ 字段校验
+ json转为python object

## code
```python
from pydantic import BaseModel

# 定义数据模型
class User(BaseModel):
    id: int
    name: str
    age: int

# 解析数据
data = {"id": 1, "name": "Alice", "age": 25}
user = User(**data)

print(user)  # id=1 name='Alice' age=25
print(user.dict())  # 转换为字典


```