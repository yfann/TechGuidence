
## 环境变量加载顺序

1. `dotnet run --environment Development`
2. `export ASPNETCORE_ENVIRONMENT=Development`
3. `<EnvironmentName>Production</EnvironmentName>`
    + .pubxml
4. default Development

## ref
+ [Use multiple environments in ASP.NET Core](https://learn.microsoft.com/en-us/aspnet/core/fundamentals/environments?view=aspnetcore-7.0)