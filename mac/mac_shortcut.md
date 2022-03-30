## top
+ `cmd + space` 搜索`ter`  **快速打开terminal**
+ `cmd + del`
+ `cmd + shift + .`显示/隐藏文件
+ `cmd + shift + 4` range截屏到桌面,或空格
+ `option + cmd + v` 剪切复制

## shortcut
+ `option + cmd + esc` 可以结束进程
+ 打开finder
    - `cmd + shift + G` 打开输入路径面板，可以访问隐藏文件
    - `cmd + shift + C` 打开电脑
    - `cmd + shift + H` 打开个人目录
    - `cmd + shift + D` 打开桌面
    - `cmd + shift + A` 打开程序
    - `cmd + .` 缩小窗口

## 截图
+ `cmd + shift + 3` fullscreen 到桌面　
+ `cmd + shift + ctrl + 3` fullscreen 到剪贴板　　

+ Command-Shift-4 截取所选屏幕区域到一个文件，或按空格键仅捕捉一个窗口　　
+ Command-Shift-Control-4 截取所选屏幕区域到剪贴板，或按空格键仅捕捉一个窗

## 浏览器
+ `cmd + w`关闭tab
+ `cmd + N`new tab
+ `ctrl + tab` `ctrl + shift + tab` 切换tab
+ `cmd + L`地址栏获得焦点
+ `cmd + click`new tab打开链接
+ `shift + click`阅读列表添加链接
+ `cmd + R`刷新页面
+ `cmd + .`停止载入页面
+ `两指左右滑动`前进后退

## 应用程序
+ `ctrl + cmd + f` 全屏切换
+ `cmd + q` 退出当前应用
Command-Option-esc 打开强制退出窗口　　
Command-H 隐藏（Hide）当前正在运行的应用程序窗口　　
Command-Option-H 隐藏（Hide）其他应用程序窗口　　
Command-Q 退出（Quit）最前面的应用程序　　
Command-Shift-Z 重做，也就是撤销的逆向操作　　
Command-Tab 在打开的应用程序列表中转到下一个最近使用的应用程序，相当于Windows中（Alt+Tab）　　
Command-Option-esc 打开“强制退出”窗口，如果有应用程序无响应，可在窗口列表中选择强制退出

## spotlight
+ `cmd + space`
<!-- 选中文件后 -->
  - `cmd + enter` 打开文件夹
  - `cmd`显示文件路径
  - `option + cmd + space` smart folder
+ `1+2*3`输入表达式
+ `$100`单位转换
+ `kind:imgage` 查找图片
+ sh文件改command文件，可以直接在spotlight中执行(需要chmod付权限)

## 环境变量

+ 加载顺序
    <!-- 系统级，系统启动加载 -->
    1. `/etc/profile`
    2. `/etc/paths` 
    <!-- 如果文件存在，后面的文件忽略 -->
    3. `~/.bash_profile`
    4. `~/.bash_login`
    5. `~/.profile`
    <!-- bash打开时自动加载 -->
    6. `~/bashrc`
+ 拖动文件夹到terminal会生成路径
+ `export PATH=$PATH:<path 1>:<path 2>`原来路径+自定义路径
+ `echo $PATH`查看

## 触摸板

+ `四指内滑` 启动台
+ `三手指上下左右滑动` 切换页面，返回桌面
+ `二指上下滑动` 滚动条
+ `二指按下` 右键

## ref
+ [程序员如何优雅地使用 macOS](https://www.zhihu.com/question/20873070)
+ [MAC 设置环境变量PATH 和 查看PATH](https://www.jianshu.com/p/acb1f062a925)
+ [MacBook——多屏幕使用心得](https://www.jianshu.com/p/b581642feb93)

+ [修改shortcut]()