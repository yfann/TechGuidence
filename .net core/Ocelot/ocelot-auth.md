## Ocelot 使用JWT
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

## ref
+ [Authentication](https://ocelot.readthedocs.io/en/latest/features/authentication.html)
+ [Authorization](https://ocelot.readthedocs.io/en/latest/features/authorization.html)
+ [Claims Transformation](https://ocelot.readthedocs.io/en/latest/features/claimstransformation.html)
<!-- samples -->
+ [Secure Microservices Using JWT With Ocelot in .NET Core](https://code-maze.com/dotnetcore-secure-microservices-jwt-ocelot/)
+ [JWT Token Authentication and Ocelot API Gateway](http://www.developerin.net/a/85-Ocelot-API-Gateway/146-JWT-Token-Authentication-and-Ocelot-API-Gateway)
