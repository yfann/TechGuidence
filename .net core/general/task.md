
+ task
    + 它代表了一个异步操作
    + System.Threading.Tasks
    + Task 的底层实现主要依赖于线程池和操作系统提供的线程调度机制



```c#
protected override Task ExecuteAsync(CancellationToken stoppingToken)
{
    //do something
    return Task.CompletedTask;
}
```