
## Pydantic
+ 强类型
```py
from pydantic import BaseModel, Field
from typing import List, Literal

# 定义数据形状 (Data Shape)
class Item(BaseModel):
    name: str
    price: float

class Payload(BaseModel):
    # 使用 Literal 做枚举约束，类似 Rust 的 enum
    status: Literal['active', 'inactive'] 
    items: List[Item] = Field(default_factory=list)

# 函数签名即文档，IDE 甚至能补全 .status
def process_data(payload: Payload) -> List[Item]:
    if payload.status == 'active':
        return payload.items
    return []
```

+ config
```py

from pydantic_settings import BaseSettings

class AppConfig(BaseSettings):
    openai_api_key: str
    db_host: str = "localhost"
    db_port: int = 5432
    debug_mode: bool = False

    class Config:
        env_file = ".env" # 自动读取 .env 文件

# 初始化一次，全局使用单例
config = AppConfig()

# 使用时，完全类型安全
print(config.db_port + 1) # IDE 知道这是 int，完全放心的数学运算
```

+ Parse, don’t validate
```py
from pydantic import BaseModel, field_validator

class UserInput(BaseModel):
    tag_list: list[str]

    @field_validator('tag_list', mode='before')
    @classmethod
    def split_string_tags(cls, v):
        # 脏活累活在这里处理
        # 如果输入是 "a,b,c"，自动切分为 ['a', 'b', 'c']
        if isinstance(v, str):
            return [x.strip() for x in v.split(',')]
        return v

# 即使上游传了脏数据，这里也能自动清洗
data = UserInput(tag_list=" ai, python, rust ")
print(data.tag_list) 
# Output: ['ai', 'python', 'rust']
```

+ AI 结构化输出 (Structured Output)
```py
import instructor
from openai import OpenAI
from pydantic import BaseModel

# 1. 定义你想要的结果结构
class UserInfo(BaseModel):
    name: str
    age: int
    interests: list[str]

# 2. Patch 你的 OpenAI 客户端
client = instructor.from_openai(OpenAI())

# 3. 直接请求 Pydantic 对象，而不是文本
user_info = client.chat.completions.create(
    model="gpt-4o",
    response_model=UserInfo, # 关键：告诉 LLM 我只要这个结构
    messages=[
        {"role": "user", "content": "张三今年25岁，喜欢Rust和AI"}
    ],
)

# 4. 拿到的是真正的 Python 对象，不是 dict，也不是 json string
print(user_info.interests) # ['Rust', 'AI']
```

+ 作为数据库 Schema (SQLModel)
```py
from sqlmodel import SQLModel, Field

# 一个类，打通前后端和数据库
class Hero(SQLModel, table=True):
    id: int | None = Field(default=None, primary_key=True)
    name: str
    secret_name: str
    age: int | None = None
```

## ref
+ [Python 的 Rust 化时刻：用 Pydantic 重构你的编程思维](https://zhuanlan.zhihu.com/p/1993375289259087473)