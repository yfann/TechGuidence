# Create Ocelot project

1. create an empty ASP.NET core project

2. `Install-Package Ocelot`
    +  Tools -> NuGet Packages

3. Program.cs
```c#
using Ocelot.DependencyInjection;
using Ocelot.Middleware;

var builder = WebApplication.CreateBuilder(args);


builder.Configuration.AddJsonFile("ocelot.json", optional: false, reloadOnChange: true);
builder.Services.AddOcelot(builder.Configuration);
var app = builder.Build();

app.MapGet("/", () => "EIPF API Gateway");

app.UseHttpsRedirection();

await app.UseOcelot();

app.Run();

```

4. ocelot.json
    + 设置BaseUrl 
```json
{
  "GlobalConfiguration": {
    "BaseUrl": "https://localhost:8443"
  },
  "Routes": [
    ........
  ]
}
```

5. lauchSettings.json
```json
{
 ...
  "profiles": {
    ...
    "OcelotGateway": {
      "commandName": "Project",
      "launchBrowser": true,
      "applicationUrl": "https://localhost:8443",
      "environmentVariables": {
        "ASPNETCORE_ENVIRONMENT": "Development"
      },
      "dotnetRunMessages": true
    }
  }
}
```