

## Nlog config
+ internalLogFile
    + 指定内部日志文件的位置和名称
    + 记录 NLog 内部的调试和故障排查信息，可以跟踪 NLog 在运行时的行为
    + 不建议生产环境使用

+ minlevel
    + 哪些级别的日志会被记录

## tips
+ Nlog config可以加到appsettings.json
    + 只对ASP.NET Core and .NET Core applications有效

## ref
<!-- config -->
+ [NLog configuration with appsettings.json](https://github.com/NLog/NLog.Extensions.Logging/wiki/NLog-configuration-with-appsettings.json)
+ [appsettings.json schema](https://json.schemastore.org/appsettings.json)