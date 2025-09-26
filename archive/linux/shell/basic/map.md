
+ `delcare -A map=()`

+ `echo ${map[""]}`

+ `echo ${map[@]}` 所有value

+ `echo ${!map[@]}` 所有key

```sh
for key in ${!map[@]}
do
    echo ${map[$key]}
done
``