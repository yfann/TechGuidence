# Pandas
+ 基于Numpy构建，提供字典形式的结构
+ Series
    + 有index的数组
+ DataFrame
    + 二维结构，多个Series组成



## tips

+ `df[<tag name>][<index>]`
+ `df[<tag name>]`
+ `df.iloc[<index>]` index为数字时有效
+ `df.loc['2000/01']` 可用字符串
+ `df[(df.rain_octsep < 1000) & (df.outflow_octsep < 4000)]` filter
+ `df = df.set_index([<tag name>])` 用特定的列做行索引
+ `df = df.reset_index('water_year')` 索引列恢复为数据


## ref

+ [pypandas](https://www.pypandas.cn/)
+ [pandas official](https://pandas.pydata.org/pandas-docs/stable/reference/frame.html)

+ [Pandas入门](https://itimor.github.io/ml/mllib/Pandas1.html)
+ [Pandas进阶](https://itimor.github.io/ml/mllib/Pandas2.html)

<!-- tips -->
+ [pd.read_excel](https://blog.csdn.net/brucewong0516/article/details/79096633)
