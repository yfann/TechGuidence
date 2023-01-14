# Fan-out
Fan-Out evenly distributes messages from an input channel to multiple output channels.

## APPLICABILITY
Fan-Out receives messages from an input channel, distributing them evenly among output channels, and is a useful patten for parallelizing CPU and I/O utilization.


## PARTICIPANTS
+ Source
An input channel. Accepted by Split.

+ Destinations
An output channel of the same type as Source. Created and provided by Split.

+ Split
A function that accepts Source and immediately returns Destinations. Any input from Source will be output to a Destination.

## IMPLEMENTATION
The Split function creates the Destination channels and executes some background process that retrieves values from Source channel and forwards them to one of the Destinations.
+ Using a single goroutine that reads values from Source and forwards them to the Destinations in a round-robin fashion. This has the virtue of requiring only one master goroutine, but if the next channel isn’t ready to read yet it’ll slow the entire process.

+ Using separate goroutines for each Destination that compete to read the next value from Source and forward it to their respective Destination. This requires slightly more resources, but is less likely to get bogged down by a single slow-running worker.


## SAMPLE CODE
```go
func Split(source <-chan int, n int) []<-chan int {
    dests := make([]<-chan int, 0)          // Create the dests slice

    for i := 0; i < n; i++ {                // Create n destination channels
        ch := make(chan int)
        dests = append(dests, ch)

        go func() {                         // Each channel gets a dedicated
            defer close(ch)                 // goroutine that competes for reads

            for val := range source {
                ch <- val
            }
        }()
    }

    return dests
}
// use
func main() {
    source := make(chan int)                // The input channel
    dests := Split(source, 5)               // Retrieve 5 output channels

    go func() {                             // Send the number 0..10 to source
        for i := 1; i <= 10; i++ {          // and close it when we're done
            source <- i
        }

        close(source)
    }()

    var wg sync.WaitGroup                   // Use WaitGroup to wait until
    wg.Add(len(dests))                      // the output channels all close

    for i, ch := range dests {
        go func(i int, d <-chan int) {
            defer wg.Done()

            for val := range d {
                fmt.Printf("#%d got %d\n", i, val)
            }
        }(i, ch)
    }

    wg.Wait()
}
```

## ref
+ [Go: 在我们的 ETL 中使用扇出模式](https://zhuanlan.zhihu.com/p/410523401)