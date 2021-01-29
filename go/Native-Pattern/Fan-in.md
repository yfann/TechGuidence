# Fan-In
Fan-In multiplexes multiple input channels onto one output channel.

## PARTICIPANTS
+ Sources
A set of one or more input channels with the same type. Accepted by Funnel.

+ Destination
An output channel of the same type as Sources. Created and provided by Funnel.

+ Funnel
Accepts Sources and immediately returns Destination. Any input from any Sources will be output by Destination.


## SAMPLE CODE
```go
func Funnel(sources ...<-chan int) <-chan int {
    dest := make(chan int)                  // The shared output channel

    var wg sync.WaitGroup                   // Used to automatically close dest
                                            // when all sources are closed

    wg.Add(len(sources))                    // Increment the sync.WaitGroup

    for _, ch := range sources {            // Start a goroutine for each source
        go func(c <-chan int) {
            defer wg.Done()                 // Notify WaitGroup when c closes

            for n := range c {
                dest <- n
            }
        }(ch)
    }

    go func() {                             // Start a goroutine to close dest
        wg.Wait()                           // after all sources close
        close(dest)
    }()

    return dest
}


// use
func main() {
    sources := make([]<-chan int, 0)        // Create an empty channel slice

    for i := 0; i < 3; i++ {
        ch := make(chan int)
        sources = append(sources, ch)       // Create a channel; add to sources

        go func() {                         // Run a toy goroutine for each
            defer close(ch)                 // Close ch when the routine ends

            for i := 1; i <= 5; i++ {
                ch <- i
                time.Sleep(time.Second)
            }
        }()
    }

    dest := Funnel(sources...)
    for d := range dest {
        fmt.Println(d)
    }

    fmt.Println("Done")                     // Prints only when dest is closed
}

```
