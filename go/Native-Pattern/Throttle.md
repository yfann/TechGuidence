# Throttle

Throttle limits the frequency of a function call to some maximum number of invocations per unit of time.


## APPLICABILITY
This pattern is similar to Debounce in that it places a limitation on the frequency of a function call, but where Debounce restricts clusters of invocations, Throttle simply limits according to time period. 


## PARTICIPANTS
+ Effector
The function to regulate.

+ Throttle
A function that accepts Effector and returns a closure with the same function signature as Effector.

## IMPLEMENTATION

+ 达到限流的处理
    + return an error
        + 429(too many requests)
    + 返回上次的成功结果
    + enqueue reqeust

## SAMPLE CODE
```go
// token bucket sample
type Effector func(context.Context) (string, error)

func Throttle(e Effector, max uint, refill uint, d time.Duration) Effector {
    var ticker *time.Ticker = nil
    var tokens uint = max

    var lastReturnString string
    var lastReturnError error

    return func(ctx context.Context) (string, error) {
        if ctx.Err() != nil {
            return "", ctx.Err()
        }

        if ticker == nil {
            ticker = time.NewTicker(d)
            defer ticker.Stop()

            go func() {
                for {
                    select {
                    case <-ticker.C:
                        t := tokens + refill
                        if t > max {
                            t = max
                        }
                        tokens = t
                    case <-ctx.Done():
                        ticker.Stop()
                        break
                    }
                }
            }()
        }

        if tokens > 0 {
            tokens--
            lastReturnString, lastReturnError = e(ctx)
        }

        return lastReturnString, lastReturnError
    }
}
```