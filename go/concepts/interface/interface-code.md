
## interface code

```go
// 接口定义
type Reader interface {
    Read(p []byte) (n int, err error)
}

// 接口内嵌
type ReadWriter interface {
    Reader
    Writer
}
```