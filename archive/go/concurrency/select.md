
## code
```go
select {
case <-ch1:
    // ...
case x := <-ch2:
    // ...use x...
case ch3 <- y:
    // ...
default:
    // ...
}
```


## tips
+ 多路复用
+ 对一个nil的channel发送和接收操作会永远阻塞，在select语句中操作nil的channel永远都不会被select到

## ref
+ [基于select的多路复用](https://docs.hacknode.org/gopl-zh/ch8/ch8-07.html)