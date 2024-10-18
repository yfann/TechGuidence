# redis单线程
+ Data storage in memory
+ Efficient data structures
+ Single-threaded architecture
    + save thread switching time
    + no race conditions,no lock
    +  using one thread to handle network I/O and key-value pair read and write (file event dispatcher)
        + such as persistence, asynchronous deletion, and cluster data synchronization, are actually executed by additional threads.
    + CPU is not Redis's bottleneck
    + All commands are entered into a queue and executed one by one.
+ Non-blocking I/O
    + I/O multiplexing

## Redis' multi-threaded mode(Redis 6.0)
+ receiving, sending, and parsing commands can be configured to be executed in multiple threads because they are the main time-consuming points we have identified. 
+ However, command execution, which involves memory operations, still runs in a single thread.
+ Redis' multi-threaded part is only used to handle network data reading and writing and protocol parsing. Command execution is still executed in a single thread sequentially, so there are no concurrency safety issues.
## ref
+ [Why is single threaded Redis so fast](https://www.pixelstech.net/article/1677580861-Why-is-single-threaded-Redis-so-fast)