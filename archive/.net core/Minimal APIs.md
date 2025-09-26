
## code
+ `builder.Services.AddEndpointsApiExplorer();`
    + 生成API文档，Swagger页面

+ `app.UseHttpsRedirection();`

+ `app.UseAuthorization();`

+ `app.MapGet("/", () => "EIPF API Gateway");`

## ref
+ [Minimal APIs quick reference](https://learn.microsoft.com/en-us/aspnet/core/fundamentals/minimal-apis?view=aspnetcore-7.0)
+ [Tutorial: Create a minimal API with ASP.NET Core](https://learn.microsoft.com/en-us/aspnet/core/tutorials/min-web-api?view=aspnetcore-7.0&tabs=visual-studio)