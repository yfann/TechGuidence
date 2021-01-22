# Debounce

Debounce limits the frequency of a function call to one among a cluster of invocations.


## APPLICABILITY
+ Using the Debounce pattern, a series of similar calls that are tightly-clustered in time are restricted to only one call, typically the first or last in a batch.

+ Throttle works like the throttle in a car, limiting the amount of fuel going into the engine by capping the flow of fuel to some maximum rate. No matter how many times the input function is called, Throttle only allows a fixed amount of calls to proceed per unit of time.
    + 一定时间内调几次

+ Debounce focuses on clusters of activity, making sure that a function is called only once during a cluster of requests, either at the start or the end of the cluster. For each of the two clusters of calls to the input function, Debounce only allows one call to proceed at the beginning of each cluster.
    + 一定时间内只调一次


## PARTICIPANTS
+ Circuit
    The function to regulate.

+ Debounce
    A closure with the same function signature as Circuit.

## Implementation
+ very similar to the one for Circuit Breaker in that it wraps Circuit to provide the rate-limiting logic.

+  function-first
    + it allows the initial response from the inner function to be cached and returned
    + the inner function is called once and subsequent calls are ignored
    + on every call of the outer function function — regardless of its outcome — a time interval is set. Any subsequent call made before that time interval expires is ignored; any call made afterwards is passed along to the inner function


+ function-last
    + A function-last implementation will wait for a pause after a series of calls before calling the inner function. Function-last tends to be less common in back end services because it doesn’t provide an immediate response, but it can be useful if your function doesn’t need results right away.

## sample code
```go
type Circuit func(context.Context) (string, error)

func myFunction func(ctx context.Context) (string, error) { /* ... */ }

response, err := Breaker(Debounce(myFunction(ctx)))


// function-first
func DebounceFirst(circuit Circuit, d time.Duration) Circuit {
    var threshold time.Time
    var cResult string
    var cError error

    return func(ctx context.Context) (string, error) {
        // refine
        if threshold.Before(time.Now()) {
            cResult, cError = circuit(ctx)
        }

        threshold = time.Now().Add(d)
        return cResult, cError
    }
}

// function-last
func DebounceLast(circuit Circuit, d time.Duration) Circuit {
    var threshold time.Time = time.Now()
    var ticker *time.Ticker
    var result string
    var err error

    return func(ctx context.Context) (string, error) {
        threshold = time.Now().Add(d)

        if ticker == nil {
            ticker = time.NewTicker(time.Millisecond * 100)
            tickerc := ticker.C

            go func() {
                defer ticker.Stop()

                for {
                    select {
                    case <-tickerc:
                        if threshold.Before(time.Now()) {
                            result, err = circuit(ctx)
                            ticker.Stop()
                            ticker = nil
                            break
                        }
                    case <-ctx.Done():
                        result, err = "", ctx.Err()
                        break
                    }
                }
            }()
        }

        return result, err
    }
}
```