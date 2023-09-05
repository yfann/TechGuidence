

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

<!-- 查看证书 -->
+ `dotnet dev-certs https --list`

<!-- 导出证书 -->
+ `dotnet dev-certs export -n "certificateName" -p <password> -e <outputPath>`



## VS的Configure for HTTP
1. 生成证书文件：Visual Studio 将自动生成一个用于 HTTPS 加密通信的自签名证书（默认情况下存储在用户个人存储区中），用于在开发过程中使用。这个证书用于加密和解密在开发环境中通过 HTTPS 发送的数据。

2. 配置 Kestrel 服务器：Kestrel 是 .NET Core Web 服务器，默认情况下会在创建 Web API 项目时使用。勾选 "Configure for HTTPS" 选项将会配置 Kestrel 服务器，使其在 HTTPS 协议上监听。

3. 修改启动 URL：勾选此选项后，项目的启动 URL 将从 http://localhost:5000 修改为 https://localhost:5001，以反映使用 HTTPS。

4. 更新应用程序配置：配置文件（如 appsettings.json）将会更新，以包括与 HTTPS 相关的设置，如证书的路径和密码等。

5. 设置项目属性：项目属性中的一些设置会被更新，以允许使用 HTTPS 进行调试。




## tips
+ RequireHttpsAttribute

## ref
+ [在 ASP.NET Core 中强制使用 HTTPS](https://learn.microsoft.com/zh-cn/aspnet/core/security/enforcing-ssl?view=aspnetcore-7.0&tabs=visual-studio%2Clinux-ubuntu)

+ [dotnet dev-certs](https://learn.microsoft.com/zh-cn/dotnet/core/tools/dotnet-dev-certs)