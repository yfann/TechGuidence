# Functional Options Pattern

## code
```go
type StuffClientOptions struct {
    Retries int //number of times to retry the request before giving up
    Timeout int //connection timeout in seconds
}
func NewStuffClient(conn Connection, options StuffClientOptions) StuffClient {
    return &stuffClient{
        conn:    conn,
        timeout: options.Timeout,
        retries: options.Retries,
    }
}
```


```go
type StuffClientOption func(*StuffClientOptions)
type StuffClientOptions struct {
    Retries int //number of times to retry the request before giving up
    Timeout int //connection timeout in seconds
}
func WithRetries(r int) StuffClientOption {
    return func(o *StuffClientOptions) {
        o.Retries = r
    }
}
func WithTimeout(t int) StuffClientOption {
    return func(o *StuffClientOptions) {
        o.Timeout = t
    }
}

var defaultStuffClientOptions = StuffClientOptions{
    Retries: 3,
    Timeout: 2,
}
func NewStuffClient(conn Connection, opts ...StuffClientOption) StuffClient {
    options := defaultStuffClientOptions
    for _, o := range opts {
        o(&options)
    }
    return &stuffClient{
        conn:    conn,
        timeout: options.Timeout,
        retries: options.Retries,
    }
}

x := NewStuffClient(Connection{})
fmt.Println(x) // prints &{{} 2 3}
x = NewStuffClient(
    Connection{},
    WithRetries(1),
)
fmt.Println(x) // prints &{{} 2 1}
x = NewStuffClient(
    Connection{},
    WithRetries(1),
    WithTimeout(1),
)
fmt.Println(x) // prints &{{} 1 1}
```

## ref
+ [Go 函数选项模式](https://lingchao.xin/post/functional-options-pattern-in-go.html)