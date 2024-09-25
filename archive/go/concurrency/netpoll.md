# netpoll

+ netpoll 是 Go runtime 内部使用的 I/O 多路复用机制，负责监控文件描述符（如网络 socket）的状态变化，并在事件（如可读或可写）发生时通知相应的 Goroutine 来处理。它是 Golang 实现高并发网络编程的核心之一，尤其在网络服务器开发中表现突出。通过 netpoll，Go runtime 可以在一个线程中高效地管理成千上万的网络连接，而不需要为每个连接创建独立的线程。

## process

+ 文件描述符注册：当一个 Goroutine 打开一个网络连接（如 TCP 连接）时，Go runtime 会将这个连接的文件描述符注册到 netpoll 机制中，供它进行管理。

+ 等待 I/O 事件：Go runtime 在后台通过一个或多个线程等待 netpoll 机制通知某个文件描述符上的 I/O 事件（如数据准备好读或写）。底层操作系统不同，使用的多路复用机制也不同：在 Linux 上用 epoll，在 macOS 上用 kqueue，在 Windows 上用 IOCP。

+ 事件驱动的调度：一旦某个连接的文件描述符有 I/O 事件（如可读、可写），netpoll 会通知 Go runtime，Go runtime 将调度相应的 Goroutine 来处理这个事件。

+ 非阻塞 I/O：netpoll 使用非阻塞 I/O 模式，这意味着它不会因为等待某个连接的 I/O 操作完成而阻塞整个线程，能够有效提升并发处理能力。