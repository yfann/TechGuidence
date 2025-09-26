

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


+ `${message:raw=true}` 
    + 输出原始的 未格式化的message

+ `${message}` 
    + 输出格式化的message

## ref
<!-- config -->
+ [NLog configuration with appsettings.json](https://github.com/NLog/NLog.Extensions.Logging/wiki/NLog-configuration-with-appsettings.json)
+ [appsettings.json schema](https://json.schemastore.org/appsettings.json)
+ [Configuration-file](https://github.com/nlog/NLog/wiki/Configuration-file)
+ [database-target](https://github.com/NLog/NLog/wiki/Database-target)