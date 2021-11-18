## 文件处理

+ `$(Get-Item abc.txt).creationtime=$(Get-Date)` 修改文件创建时间
+ `$(Get-Content abc.txt)` 获取文件内容
+ `Get-Content d:\1.txt -totalcount 100 | set-Content top100.txt`获取前100行存到新的文件里
+ `Get-Content "d:\1.txt" | %{Write-Host $_.Replace("日","太阳")}` 替换


## 字符串处理

+ contains
    + 用于array
    + `1,2,3 -contains 1`
    + `"123" -contains 1`

+ match
    + `"Matt" -match "m"`

## 别名

```sh
function kb{
    .... $args
}
```