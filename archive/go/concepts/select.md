## select

```go
select {
case <-ch1:                         // Discard received value
    fmt.Println("Got something")

case x := <-ch2:                    // Assign received value to x
    fmt.Println("Got", x)

case ch3 <- y:                      // Send y to channel
    fmt.Println("Sent", y)

default:
    fmt.Println("None of the above")
}
```


## tips

+ 如果没有default,select 会block直到有case满足

+ 多个case满足会随机执行

+ close的chanel不会block,会直接返回