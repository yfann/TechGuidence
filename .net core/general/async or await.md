# async/await

## 异步方法

+ async
```c#
public async Task MyAsyncMethod()
{
    // 异步操作的代码
}
```

+ await
```c#
// 等待异步执行完成
await SomeAsyncOperation();
```
+ task
    + 它代表了一个异步操作
    + System.Threading.Tasks
    + Task 的底层实现主要依赖于线程池和操作系统提供的线程调度机制

+ 编译器生成的异步状态机（Compiler-generated asynchronous state machine）
    + 在编译时，C# 编译器会将包含 async/await 的方法转换为状态机