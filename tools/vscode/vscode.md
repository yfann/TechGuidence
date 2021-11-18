# VSCode

## 快捷键

### 基本操作

- Ctrl+鼠标选中Explore中的文件 分屏显示(Ctrl+\ 当前分屏)
- Ctrl+Shift+V 预览markdown
- Ctrl+Shift+C 打开当前文件位置命令行
- Ctrl+Shift+F 内容搜索
- Ctrl+Shift+P 打开控制台(auto自动保存命令) 后退+?得到帮助
- Ctrl+P 搜索打开文件(VSCode排除一些目录和文件如.git,规则可以在files.exclude设定)
- Ctrl(+Shift)+Tab 切换最近打开的文件
- Ctrl+G 可以跳到输入的行号
 
### 高级操作
 
- Ctrl+Shift+] 自动跳到匹配的花括号上
- Alt+Click 多行光标(Ctrl+Alt+Down/UP)
- Ctrl+D 选中光标位置的单词，连续按可以多选,Ctrl+K Ctrl+D可以跳跃选，Ctrl+Shift+L全选
- Alt+UP/Down 移动光标所在行代码
- Shift+Alt+UP/Down 复制光标所在行代码
- Shift+Alt+left/right 增量选择区域
- Ctrl+Space 触发智能提示
- Ctrl 查看定义
- Shift+F12/Alt+F12 Peek快速查看/定义查看
- Ctrl+Shift+M 查看error和warning
- (Shift+)F8 遍历 error,warning
- F5 运行程序
- Ctrl+C 命令行中断

<!-- advance -->
+ `ctrl+K`+`ctrl+s` 快捷键说明
+ `ctrl+P`打开搜索栏
    - 所有文件搜索
    - `@`当前文件搜索
    - `>`搜索命令

## 代码操作

+ ctrl+K+C/ctrl+K+U //注释
+ shit+alt+a //批量注释
+ ctrl+shift+b //build
+ ctrl+shift+u //error message

## shortcut

+ `ctrl+shift+k` 删除行

## 特性

- Working Files  
  sidebar中的section,显示活动的文件，类似其他编辑器中的Tabs

- encoding  
  单击右下角UTF-8,可以更改文件编码
  
- `code .`  

## Node.js的创建和调试

- 创建node程序  
  - 安装nodejs
  - 安装node框架express,cmd:npm install -g express-generator
  - 创建一个express项目,cmd:express MyExpressApp
  - 安装项目的依赖项,cmd:cd MyExpressApp,cmd:npm install
  - 开启项目,cmd:npm start, 查看http://localhost:3000
  - 用vscode打开项目,cmd:code .
- debug nodejs
  - launch.json 如何启动node程序
  - cmd:XXX  --nolzay 使所有断点生效
  - SourceMaps in launch.json
  - cmd:node --debug program.js,node --debug-brk program.js
- 集成github
  - 安装git时要勾选windows command
  - Ctrl+Enter提交代码
  - 如果有Staged存在则提交Staged Changes,否则提交所有Changes
  - 提交
  1. vscode中初始化本地项目
  2. github中创建一个新的repository:https://github.com/<your repository>/<project name>.git
  3. 本地项目路径下cmd:git remote add origin https://github.com/<your repository>/<project name>.git
  4. vscode中提交代码
  5. 本地项目路径下cmd:git push -u origin master     //提交代码到github


## python

+ 删除pythonpaht on launch.json

## 插件开发

### 快捷键

+ `F1` 命令行
+ `F5` 运行
+ `Ctrl+R` reload the extension developemtn window

[官网文档](https://code.visualstudio.com/Docs/editor/codebasics)  
[hotkey](https://code.visualstudio.com/Docs/editor/keybindings)
[add to github](http://michaelcrump.net/using-github-with-visualstudio-code/)


## updated

+ `ctrl+Q` 各个视图面板的切换
+ `ctrl+K Z` 入道


## features

+ `"editor.minimap.enabled":true`
+ `"editor.dragAndDrop":true`
+ `"editor.wordWrap":"on"`  //on off wordWrapColumn bounded


## 3rd

+ bookmarks 代码打标签



## proxy

+ File -> Preferences -> settings
  + proxy