# pipx 
+ 每安装一个 CLI 工具，pipx 都会给它创建一个单独的虚拟环境（venv），彼此完全隔离。
+ brew install pipx
    + pipx ensurepath
        + 把 pipx 的“可执行目录”加入你的 shell 的 PATH，让你能直接运行安装的 CLI 工具
+ pipx install <pkg>
+ 原理
```py
为每个工具创建一个独立 virtualenv
    ↓
用 pip 安装
    ↓
把可执行文件软链到 ~/.local/bin
```