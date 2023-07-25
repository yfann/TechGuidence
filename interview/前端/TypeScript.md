# TypeScript interview


## ts VS js
+ TypeScript supports static typing, while JavaScript is dynamically typed.
+ TypeScript allows for the use of interfaces, enums, classes, and other advanced features not present in standard JavaScript.
+ TypeScript enhances developer productivity through better code analysis, autocompletion, and tooling support.
+ TypeScript helps catch type-related errors during development, reducing bugs and improving code quality.


## What are the different data types in TypeScript?
+ Number: Represents numeric values, including integers and floating-point numbers.
+ String: Represents textual data and can be enclosed in single ('') or double quotes ("").
+ Boolean: Represents true or false values.
+ Array: Represents a collection of elements of the same type, denoted by type[] or Array<type>.
+ Tuple: Represents an array with a fixed number of elements, each of which can have a different type.
+ Enum: Represents a set of named constant values.
+ Any: Represents any data type. It allows dynamic typing but sacrifices type safety.
+ Void: Represents the absence of a type, typically used for functions that return nothing.
+ Null and Undefined: Represents the absence of a value.
+ Object: Represents any non-primitive type.

## What is the difference between "interface" and "type" in TypeScript?
+ Interfaces: Interfaces allow you to define the structure of an object and can only be used to describe object shapes. They support extending other interfaces, making them suitable for defining contracts. Interfaces are generally preferred in most cases due to their familiarity and common use in TypeScript.
```ts
interface Person {
  name: string;
  age: number;
}
```
+ Type aliases: Type aliases can define not only object shapes but also union types, intersections, and more complex types. They are versatile and can be used to give meaningful names to unions or intersections of types, making the code more readable.
```ts
type Point = { x: number; y: number };
```

## What is the "readonly" modifier in TypeScript?
+ The readonly modifier in TypeScript is used to indicate that a property of an object or an element of an array cannot be modified once it's assigned a value. This is useful when you want to enforce immutability for certain properties or elements.
```ts
interface Car {
  readonly make: string;
  model: string;
}
```

## How do you handle asynchronous operations in TypeScript?
+ In TypeScript, you can handle asynchronous operations using Promises, async/await, or using third-party libraries that provide asynchronous functionality. Promises are the most common way to handle asynchronous operations natively in TypeScript.
```ts
function delay(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms));
}

async function doSomethingAsync() {
  console.log("Start");
  await delay(1000);
  console.log("End");
}

doSomethingAsync();
```