
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


## In-Process vs Out-of-Process
<!-- In-Process 进程内托管-->
+ request -> HTTP.sys -> ASP.NET Core Module -> IISHttpServer -> ASP.NET Core Module ->Application code

+ ASP.NET Core与IIS共享一个进程，运行在同一个进程中，共享资源
+ 进程内托管快，避免IPC(进程间通信)
+ 进程内托管适用于只运行一个应用程序的情况，因为共享一个进程可能会导致资源争用和隔离性问题。
+ 每个应用一个application pool

<!-- Out-of-Process 进程外托管 -->
+ request -> HTTP.sys -> IIS(ASP.NET Core Module) -> Kestrel ->APPlication code

+ 在进程外托管中，ASP.NET Core应用程序和IIS运行在不同的进程中。ASP.NET Core应用程序运行在Kestrel服务器中，而不是IIS进程内。
+ 进程外托管提供更好的隔离性，因为应用程序和IIS不共享进程，这有助于减少潜在的资源冲突。
+ 进程外托管支持多个应用程序在同一台服务器上运行，每个应用程序都有自己的Kestrel服务器进程。
+ 进程外托管还可以更轻松地进行应用程序升级和维护，因为不需要停止整个IIS进程来部署更改。
+ 只有一个application pool


## Application pool
+ 用于托管和管理Web应用程序的机制。每个应用程序池都是一个独立的进程，用于隔离不同的Web应用程序，以确保它们在运行时互相不受影响。

+ Managed Pipline Mode
    + Classic
        + 兼容早起IIS的处理方式，IIS使用ISAPI（Internet Server Application Programming Interface）来处理HTTP请求
    + Integrated
        + Integrated托管管道模式引入了ASP.NET集成到IIS核心的概念。在这个模式下，HTTP请求会首先由IIS内核处理，然后通过HTTP模块传递给ASP.NET，最后由ASP.NET处理。这个模式提供更好的性能和更多的集成功能，因此通常是推荐的托管管道模式。
    + No Managed Code
        + 应用程序池不会加载或运行任何托管代码，例如.NET Framework或.NET Core应用程序。这个模式通常用于托管不需要.NET运行时的纯静态内容或其他非托管技术的应用程序，以减少服务器资源的消耗。

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
+ [In-process hosting with IIS and ASP.NET Core](https://learn.microsoft.com/en-us/aspnet/core/host-and-deploy/iis/in-process-hosting?view=aspnetcore-7.0)
+ [Out-of-process hosting with IIS and ASP.NET Core](https://learn.microsoft.com/en-us/aspnet/core/host-and-deploy/iis/out-of-process-hosting?view=aspnetcore-7.0)