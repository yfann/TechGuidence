## map
+ `var map_variable map[key_data_type]value_data_type`
+ `data := make(map[type]type)`
+ `countryCapitalMap := map[string]string{"France": "Paris", "Italy": "Rome", "Japan": "Tokyo", "India": "New delhi"}`
+  键值是否存在
```go
capital, ok := countryCapitalMap [ "American" ]
if (ok) {
    fmt.Println("American 的首都是", capital)
} else {
    fmt.Println("American 的首都不存在")
}
```
+ `delete(map, key)`


## ref
+ [Go maps in action](https://blog.golang.org/maps)