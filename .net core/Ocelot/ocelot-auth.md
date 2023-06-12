## Ocelot 使用JWT auth
1. nuget 添加包`Microsoft.AspNetCore.Authentication.JwtBearer`

2. Program.cs
```c#
using Ocelot.DependencyInjection;
using Ocelot.Middleware;
using System.Security.Cryptography;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;

string publicKeyFilePath = "pub.pem";
string publicKey = File.ReadAllText(publicKeyFilePath);

RSA rsa = RSA.Create();
rsa.ImportFromPem(publicKey);


var builder = WebApplication.CreateBuilder(args);
builder.Configuration.AddJsonFile("ocelot.json", optional: false, reloadOnChange: true);

builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer("VCP",options =>
    {
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateIssuerSigningKey = true,
            IssuerSigningKey = new RsaSecurityKey(rsa),
            ValidateIssuer = false,
            ValidateAudience = false
        };
    });

builder.Services.AddOcelot(builder.Configuration);
//builder.Services.AddAuthorization();

var app = builder.Build();
app.UseAuthentication();
//app.UseAuthorization();
app.UseHttpsRedirection();
await app.UseOcelot();

app.Run();
```

3. ocelot.json

```json
{
    ...
    "AuthenticationOptions": {
        "AuthenticationProviderKey": "VCP",
        "AllowedScopes": []
      }
}
```

4. call api
    + request header
        + `Authorization: Bearer <jwt token>`


## tips
+ SymmetricSecurityKey
    + 对称加密

+ System.Security.Cryptography
    + RSA
        + 非对称加密

+ JWT中的claims可以在`ctx.User.Claims`中找到
```c#
var configuration = new OcelotPipelineConfiguration
{
    PreQueryStringBuilderMiddleware = async (ctx, next) =>
    {
        var username = ctx.User.Claims.FirstOrDefault(o => o.Type == "name")?.Value;

        await next.Invoke();
    }
};

await app.UseOcelot(configuration);
```

## ref
+ [Authentication](https://ocelot.readthedocs.io/en/latest/features/authentication.html)
+ [Authorization](https://ocelot.readthedocs.io/en/latest/features/authorization.html)
+ [Claims Transformation](https://ocelot.readthedocs.io/en/latest/features/claimstransformation.html)


<!-- samples -->
+ [Secure Microservices Using JWT With Ocelot in .NET Core](https://code-maze.com/dotnetcore-secure-microservices-jwt-ocelot/)
+ [JWT Token Authentication and Ocelot API Gateway](http://www.developerin.net/a/85-Ocelot-API-Gateway/146-JWT-Token-Authentication-and-Ocelot-API-Gateway)
+ [再谈基于Ocelot API网关和IdentityServer的API认证与授权](https://sunnycoding.cn/2022/07/14/api-auth-with-ocelot-and-identityserver/)