## tips

+ value semantic or pointer semantic(consistant using
    - built in type(value semantic)
    - reference type(value semantic)
        - except for decoding
    - struct type(value  or pointer semantic)
+ interface define behavior
    - not a concrete type

+ Embeded type
<!-- // Here are some guidelines around declaring types:
// 	* Declare types that represent something new or unique.
// 	* Validate that a value of any type is created or used on its own.
// 	* Embed types to reuse existing behaviors you need to satisfy.
// 	* Question types that are an alias or abstraction for an existing type.
// 	* Question types whose sole purpose is to share common state. -->
+ `var any interface{}`
    + type assertion 

## ref 
+ [Ultimate Go Programming](https://github.com/ardanlabs/gotraining)
+ [go design](https://github.com/ardanlabs/gotraining/tree/master/topics/go/design)
