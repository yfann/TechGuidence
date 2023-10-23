


## cmd
+ `C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.8 Tools\x64`
    + `sn.exe -k keyPair.snk`
<!-- verify -->
+ `sn -vf xxx.dll`
<!-- 查看pubkey,token -->
+ `sn -Tp xxx.dll`
<!-- get pubkey -->
+ `sn -p YourKeyPair.snk YourPublicKey.snk`
<!-- get token from pubkey -->
+ `sn -tp YourPublicKey.snk`
    +  对公钥做SHA-1 hash
+ `sn -t YourPublicKey.snk`
    +  对公钥做SHA-256 hash
## ref
+ [Sn.exe (Strong Name Tool)](https://learn.microsoft.com/en-us/dotnet/framework/tools/sn-exe-strong-name-tool?source=recommendations)
+ [How to: Sign an assembly with a strong name](https://learn.microsoft.com/en-us/dotnet/standard/assembly/sign-strong-name)