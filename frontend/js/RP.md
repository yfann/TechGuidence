#[Reactive Programming](https://gist.github.com/staltz/868e7e9bc2a7b8c1f754)

Reactive programming is programming with asynchronous data streams.


##Stream

+ emmit data based on time line
+ anything can be a stream
+ immutability
+ attach with map, filter, scan
+ stream is subject(or observable), handle functions are observers.(Observer Design Pattern)

##Observable

Querying Arrays only gives us a snapshot. By contrast, querying Observables allows us to create data sets that react and update as the system changes over time. 

When an Obsservable sequence completes it unsubscribes all of its listeners.


##Ref
[learnrx](http://reactivex.io/learnrx/)