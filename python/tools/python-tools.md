## uv

## ruff
+ lint工具
```bash
# Lint all files in `/path/to/code` (and any subdirectories)

ruff check path/to/code/

# Format all files in `/path/to/code` (and any subdirectories)

ruff format path/to/code
```

## ty
+ 类型检查器（type checker）+ 语言服务器（language server）
    + Language Server Protocol (LSP)
        + 为IDE提供代码补全，语法高亮，跳转定义...

## Pydantic
+ data validation and settings management 
```py
from pydantic import BaseSettings

class Settings(BaseSettings):
    api_key: str
    db_url: str

    class Config:
        env_file = ".env"

settings = Settings()
```

## FastAPI

## dataclasses 
```py
from dataclasses import dataclass

@dataclass
class Point:
    x: int
    y: int

p = Point(1, 2)
print(p)  # Output: Point(x=1, y=2)
```