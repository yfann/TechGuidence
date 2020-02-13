## $and

+ 相同field时使用

```js
db.inventory.find( { $and: [ { price: { $ne: 1.99 } }, { price: { $exists: true } } ] }
```

+ 相同操作符时使用

```js
db.inventory.find( {
    $and : [
        { $or : [ { price : 0.99 }, { price : 1.99 } ] },
        { $or : [ { sale : true }, { qty : { $lt : 20 } } ] }
    ]
} )
```

+ 其他情况可使用implicit and

```js
db.inventory.find( { price: { $ne: 1.99, $exists: true } } )
```

## Ref

+ [$and](https://docs.mongodb.com/manual/reference/operator/query/and/)
+ [mongodb aggregation quick reference](https://docs.mongodb.com/manual/meta/aggregation-quick-reference/)