# Background tasks with hosted services in ASP.NET Core

## IHostedService
+ 用于定义一个长时间运行的服务

+ StartAsync()
    + 在应用程序启动时调用，用于执行初始化和启动服务的代码
    + StartAsync should be limited to short running tasks because hosted services are run sequentially, and no further services are started until StartAsync runs to completion.

+ StopAsync()
    + 在应用程序关闭时调用，用于执行清理和停止服务的代码。
    + is triggered when the host is performing a graceful shutdown.     
    + However, tasks aren't abandoned after cancellation is requested—the caller awaits all tasks to complete.
    + ShutdownTimeout
        + 30 seconds by default

## BackgroundService
+ 实现了IHostedService

+ ExecuteAsync()
    + No further services are started until ExecuteAsync becomes asynchronous, such as by calling await. 
    + Avoid performing long, blocking initialization work in ExecuteAsync. 
        + 可以是循环
```csharp
        while (!stoppingToken.IsCancellationRequested)
        {
            // 执行服务的主要逻辑

            Console.WriteLine("BackgroundService is running.");

            // 模拟一些工作
            await Task.Delay(5000, stoppingToken); // 5秒的延迟，可以被取消
        }
```
    + 在服务启动后，由.NET Core 主机（Host）自动调用的

+ StopAsync()
    + The host blocks in StopAsync(CancellationToken) waiting for ExecuteAsync to complete.
    + The cancellation token is triggered when IHostedService.StopAsync is called. 



## Worker Service template
+  a starting point for writing long running service apps. 
+ packages
    + Microsoft.Extensions.Hosting
    + Microsoft.NET.Sdk.Worker
    + Microsoft.NET.Sdk.Web

## tips
+ System.Threading.Timer
+ QueueBackgroundWorkItem
+ scoped service(DI)
    + Transient
        + 每次请求创建，请求结束销毁
    + Scoped
        + 存活于client connection
    + Singleton
+ Task


## ref
+ [Background tasks with hosted services in ASP.NET Core](https://learn.microsoft.com/en-us/aspnet/core/fundamentals/host/hosted-services?view=aspnetcore-8.0&tabs=netcore-cli)