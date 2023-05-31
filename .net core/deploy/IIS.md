
## run ASP.NET Core in IIS
1. install Hosting Bundle(allow ASP.NET Core run in IIS)
    + .NET Core runtime
    + ASP.NET Core model

2. restart IIS
    + `net stop was /y`
    + `net start w3svc`

## ANCM(ASP.NET Core 模块)
+ IIS模块
    + 使ASP.NET Core通过IIS运行

+ 运行模式
    + 进程内托管模型(默认)
        + w3wp.exe(IIS工作进程)内托管ASP.NET Core应用
    + 进程外托管模型
        + 将web request转发到 运行Kestrel服务器的后端ASP.NET Core应用

+ 安装
    + 随hosting bundle中的.NET Core runtime一起安装

## ref
+ [使用 IIS 在 Windows 上托管 ASP.NET Core](https://learn.microsoft.com/zh-cn/aspnet/core/host-and-deploy/iis/?view=aspnetcore-7.0)
+ [.NET Core 托管捆绑包](https://learn.microsoft.com/zh-cn/aspnet/core/host-and-deploy/iis/hosting-bundle?view=aspnetcore-7.0)
+ [将 ASP.NET Core 应用发布到 IIS](https://learn.microsoft.com/zh-cn/aspnet/core/tutorials/publish-to-iis?view=aspnetcore-7.0&tabs=visual-studio)


<!-- detail -->
+ [用于 IIS 的 ASP.NET Core 模块 (ANCM)](https://learn.microsoft.com/zh-cn/aspnet/core/host-and-deploy/aspnet-core-module?view=aspnetcore-7.0)
+ [ASP.NET Core 中的 Web 服务器实现](https://learn.microsoft.com/zh-cn/aspnet/core/fundamentals/servers/?view=aspnetcore-7.0&tabs=macos)
+ [使用 IIS 和 ASP.NET Core 进行进程内托管](https://learn.microsoft.com/zh-cn/aspnet/core/host-and-deploy/iis/in-process-hosting?view=aspnetcore-7.0)
+ [使用 IIS 和 ASP.NET Core 进行进程外托管](https://learn.microsoft.com/zh-cn/aspnet/core/host-and-deploy/iis/out-of-process-hosting?view=aspnetcore-7.0)


<!-- others -->
+ [IIS 模块与 ASP.NET Core](https://learn.microsoft.com/zh-cn/aspnet/core/host-and-deploy/iis/modules?view=aspnetcore-7.0)
+ [Hosting An ASP.NET Core Web Application In IIS](https://dotnetcoretutorials.com/hosting-an-asp-net-core-web-application-in-iis/)