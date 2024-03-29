# Nlog


## asp.net core使用Nlog
1. nuget add `NLog.Web.AspNetCore`

2. appsettings.json添加
    + NLog section

3. Program.cs
```c#
Configuration = new ConfigurationBuilder()
                    .Add(new JsonConfigurationSource { Path = "appsettings.json", ReloadOnChange = true })
                    .Build();

var logger = LogManager.Setup()
                    .LoadConfigurationFromSection(Configuration)
                    .GetCurrentClassLogger();

var builder = WebApplication.CreateBuilder(args);

builder.Logging.ClearProviders();
builder.Host.UseNLog();
```

## ref
+ [NLog/NLog](https://github.com/NLog/NLog)
+ [Nlog](https://nlog-project.org/)
+ [Getting started with ASP.NET Core 6](https://github.com/NLog/NLog/wiki/Getting-started-with-ASP.NET-Core-6)

+ [How to use structured logging](https://github.com/NLog/NLog/wiki/How-to-use-structured-logging)
+ [All-Event-Properties-Layout-Renderer](https://github.com/NLog/readthedocs/blob/master/docs/All-Event-Properties-Layout-Renderer.md)
