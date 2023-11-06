
## logging level

## logging category

## logging providers


+ Built-in logging providers:
    + Console
    + Debug
    + EventSource
    + EventLog

+ 添加log provider
```c#
builder.Logging.ClearProviders();
builder.Logging.AddConsole();
```

## tips
+ 默认不会把日志写入文件
    + 得用第三方provider
        + Nlog

## ref
+ [Logging in .NET Core and ASP.NET Core](https://learn.microsoft.com/en-us/aspnet/core/fundamentals/logging/?view=aspnetcore-7.0)
+ [理解ASP.NET Core - 日志(Logging)](https://www.cnblogs.com/xiaoxiaotank/p/15525052.html)

<!-- logging provider -->
+ [Logging providers in .NET](https://learn.microsoft.com/en-us/dotnet/core/extensions/logging-providers)
+ [Implement a custom logging provider in .NET](https://learn.microsoft.com/en-us/dotnet/core/extensions/custom-logging-provider)
+ [3rd party provider](https://learn.microsoft.com/zh-cn/aspnet/core/fundamentals/logging/?view=aspnetcore-7.0#third-party-logging-providers)
+ [serilog](https://github.com/serilog/serilog-aspnetcore)