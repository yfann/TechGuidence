

## Circuit Breaker
+ Circuit Breaker automatically degrades service functions in response to a likely fault, preventing larger or cascading failures by eliminating recurring errors and providing reasonable error responses.

+ Circuit
    + The function that interacts with the service.

+ Breaker
    + A closure with the same function signature as Circuit.
    + breaker closed state
        + client ------request---> breaker ------request---> Circuit -----response---> breaker -----response---> client
    + breaker open state
        + Client ------request---> Breaker ------err response---> Client
    + breaker会检查circuit连续返回的错误数，超过threshold，state就会为open
        + rate of retry 需要逐步降低

+ 注：尝试连续失败n次后，后续尝试直接返回失败结果，并在指定时间后重新尝试

## sample code

```go
type Circuit func(context.Context) (string, error)

func Breaker(circuit Circuit, failureThreshold uint64) Circuit {
    var lastStateSuccessful = true
    var consecutiveFailures uint64 = 0
    var lastAttempt time.Time = time.Now()

    return func(ctx context.Context) (string, error) {
        if consecutiveFailures >= failureThreshold {
            backoffLevel := consecutiveFailures - failureThreshold
            shouldRetryAt := lastAttempt.Add(time.Second * 2 << backoffLevel)

            if !time.Now().After(shouldRetryAt) {
                return "", errors.New("circuit open -- service unreachable")
            }
        }

        lastAttempt = time.Now()
        response, err := circuit(ctx)

        if err != nil {
            if !lastStateSuccessful {
                consecutiveFailures++
            }
            lastStateSuccessful = false
            return response, err
        }

        lastStateSuccessful = true
        consecutiveFailures = 0

        return response, nil
    }
}
```
