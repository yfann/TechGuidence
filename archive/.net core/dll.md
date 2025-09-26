
## config
+ config
    + application config
    + publisher policy file
    + machine config

+ <assemblyBinding>
    + <dependentAssembly>
        + <assemblyIdentity>
        + <bindingRedirect>
        + <codeBase>




## tips
+ static reference
+ dynamic reference
    + Assembly.Load
        + partial reference
    + AppDomain.Load
        + partial reference

+ <qualifyAssembly>
    +  qualify a reference to an assembly outside the application directory
    + full reference information
        + name
        + version
        + culture
        + pub key token

+ 引用程序目录之外的dll
    + GAC
    + <codeBase>中指定

## ref
+ [How the Runtime Locates Assemblies](https://learn.microsoft.com/en-us/dotnet/framework/deployment/how-the-runtime-locates-assemblies)
+ [Configure apps by using configuration files](https://learn.microsoft.com/en-us/dotnet/framework/configure-apps/)