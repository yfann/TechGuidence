

## cmd
+ `dotnet dev-certs https`
    + 检查当前用户的证书存储中是否存在开发证书
    + 如果命令找不到开发证书，它将在当前用户的证书存储中创建一个证书，该存储区在位置 CurrentUser 中命名为 My
    + 在 .NET 7.0 中的 macOS 上，证书存储在用户密钥链中，并作为 PFX 文件存储：~/.aspnet/https-aspnetcore-localhost-<Thumbprint[0..5]>.pfx。
    + 默认不受信
        + `dotnet dev-certs https --trust`
            + 受信证书
        + `dotnet dev-certs https  --export-path <path> --format PEM`
            + 导出证书

+ `dotnet dev-certs https -h`
    + `dotnet dev-certs https --trust` Trust the certificate on the current platform
    + `dotnet dev-certs https --import <path>` Imports the provided HTTPS development certificate into the machine. All other HTTPS developer certificates will be cleared out
    + `dotnet dev-certs https --check` Check for the existence of the certificate but do not perform any action
    + `dotnet dev-certs https --clean`  Cleans all HTTPS development certificates from the machine.



## tips
+ RequireHttpsAttribute

## ref
+ [在 ASP.NET Core 中强制使用 HTTPS](https://learn.microsoft.com/zh-cn/aspnet/core/security/enforcing-ssl?view=aspnetcore-7.0&tabs=visual-studio%2Clinux-ubuntu)

+ [dotnet dev-certs](https://learn.microsoft.com/zh-cn/dotnet/core/tools/dotnet-dev-certs)