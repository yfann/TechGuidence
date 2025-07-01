
# cursor

+ `tab`

+ `ctrl + k`
    + inline edit



## cmd
+ `ctrl/cmd + y` use selected
+ `ctrl + l` chat
    + `@Folders`
    + `@Git`
    + `@Codebase`

+ `ctrl[cmd] + k` generate
    + `@File`
    + `@Code`
    + `@Web`
    + `@Docs`
    + `@Definitions`
    + `@Chat`

<!-- Composer -->
+ `ctrl[cmd] + k`
    + 选中或不选中代码
    + 局部修改
+ `ctrl[cmd] + shift + k`
    + 跨多个文件的修改
+ `ctrl[cmd] + j`
    + 终端
    + shell命令

+ `ctrl[cmd] + i`
+ `ctrl[cmd] + shift + i`

## @
+ `@Files`

+ `@Folders`

+ `@Code`
    + 代码片段

+ `@Docs`

+ `@Git`

+ `@Codebase`
    + 整个代码库

+ `@Web`
    + 网上搜索

+ `@Chat`

+ `@Definitions`

+ `@url`

## chat
+ 知道当前打开的代码文件和指针所在位置的代码
    + 可以用this
+ `cmd + shift + l` or `@`
    + 发送特定代码
+ `cmd + enter` or `@Codebase`
    + chat with entire codebase
+ `@web`
    + search internet
+ `@LibraryName` or `@Docs`
    + add library or new docs

## composer(agent)

## proxy
+ file>preferences>cursor settings>General->Editor-> search proxy
    + disable http2
        + for inline edits


## .cursorignore
+ 排除不相干文件


## cursor agent
+ system prompt
    + role definition
    + task description
    + communication constraints
    + tool calling constraints
    + search tips
    + code change constraints
    + debugging tips
    + external API tips
+ Agent Tools
    + codebase_search tool
    + read_file tool
    + run_terminal_cmd tool
    + list_dir tool
    + grep_search tool
    + edit_file tool
    + file_search tool
    + delete_file tool
    + reapply tool
    + fetch_rules tool
    + web_search tool
    + diff_history tool


## tips
+ 自动包含代码库的上下文
    + 为代码库建立索引
    + cursor settings->Features->Codebase Indexing
+ cursor settings->general->privacy mode
+ 常用文档链接加入doc中
+ 多使用`@Codebase`，cursor会经常不熟悉本地代码
+ 超过免费期限后，删除账号重新登入

## ref
+ [cursor](https://jstoppa.com/posts/artificial-intelligence/fundamentals/code-smarter-not-harder-developing-with-cursor-and-claude-sonnet/post/)
+ [https://cursor.directory/](https://cursor.directory/)
+ [Cursor使用指南](https://zhuanlan.zhihu.com/p/11597402899)
+ [template](https://github.com/ansh/template-2/tree/main)
+ [Cursor Agent 模式深度解析，创业者必学！](https://zhuanlan.zhihu.com/p/1898147724634874573)