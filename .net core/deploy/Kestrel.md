
## 改端口
<!-- 环境变量 -->
+ `set ASPNETCORE_URLS=http://127.0.0.1:5008;http://0.0.0.0:5009`
<!-- 命令行 -->
+ `dotnet EndpointConfigurationTest2.0.dll --urls http://0.0.0.0:5698;https://127.0.0.1:6936`
<!-- 配置文件 -->
<!-- appsettings.json -->
```json
{
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft.AspNetCore": "Warning"
    }
  },
  "AllowedHosts": "*",
  "Kestrel": {
    "EndPoints": {
      "Http": {
        "Url": "http://localhost:6000"
      }
    }
  }
}
```

## ref
+ [为 ASP.NET Core Kestrel Web 服务器配置终结点](https://learn.microsoft.com/zh-cn/aspnet/core/fundamentals/servers/kestrel/endpoints?view=aspnetcore-7.0)

+ [如何修改 .NET Core Kestrel 下的端口 ](https://www.cnblogs.com/superfeeling/p/17053701.html)

+ [Kestrel vs IIS](https://dotnetcoretutorials.com/kestrel-vs-iis/)

+ [Kestrel](https://learn.microsoft.com/en-us/aspnet/core/fundamentals/servers/kestrel/options?view=aspnetcore-7.0)