# copilot for visual studio
+ vs 2022+
+ File->account setting->add 启用了copilot的github账号

## context
+  copilot会引用： open the file or highlight the code 
    + 高亮相关代码
    + 打开相关文件
    + chat history
+ `#file` 引用相关文件
+ `#solution` 引用active file
+ `#<file name>.<extension name>`
    + `#<method name>`
+ `@workspace` refer to the solution active in the IDE for context
    + files  are currently open and being worked on within your IDE
+ `@github` search github
## cmd
<!-- 选中代码后使用 -->
+ `/tests` 为选中的代码添加测试
+ `/fix` 修复错误
+ `/explain`
+ `/optimize`
+ `/doc`

## extension
+ `@`

## example
+ `What is the purpose of #MyFile.cs: 66-72?`
+ `/explain the #AddItemToBasket in #BasketService.cs`
+ `in my @workspace where is #CustomAdd`


## proxy
<!-- C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\devenv.exe.config -->
```xml
    <system.net>
      <defaultProxy useDefaultCredentials="true" enabled="true">
		     <proxy bypassonlocal="true" proxyaddress="http:/xxxx:xx" />
	    </defaultProxy>
    ...
```

## tips
+ 右键->ask copilot

## ref
+ [Tips to improve Copilot Chat results](https://learn.microsoft.com/en-us/visualstudio/ide/copilot-chat-context?view=vs-2022#slash-commands)
+ [Asking GitHub Copilot questions in your IDE](https://docs.github.com/en/copilot/using-github-copilot/asking-github-copilot-questions-in-your-ide?tool=visualstudio)
+ [Using extensions to integrate external tools with Copilot Chat](https://docs.github.com/en/copilot/using-github-copilot/using-extensions-to-integrate-external-tools-with-copilot-chat)