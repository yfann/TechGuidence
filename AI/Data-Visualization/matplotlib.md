
## cmd
+ `pip install matplotlib`


## Scatter Plot
+ Scatter plots are used to observe relationships between variables and uses dots to represent the relationship between them. 
+ `plt.scatter(data['day'], data['tip'], c=data['size'],  s=data['total_bill'])`
    + x,y,color,size

## Line Chart
+ Line Chart is used to represent a relationship between two data X and Y on a different axis.
+ `plt.plot(data['day'])`
    + x为行索引
    + y为`data['day']`的值

## Bar Chart
+ A bar plot or bar chart is a graph that represents the category of data with rectangular bars with lengths and heights that is proportional to the values which they represent


## Histogram
+ A histogram is basically used to represent data in the form of some groups. It is a type of bar plot where the X-axis represents the bin ranges while the Y-axis gives information about frequency. 
    + x轴表示数据范围（自动分组，每组称为bin）
        + 函数默认会将数据按一定的范围划分为多个区间，这些区间称为 bins
        + 默认情况下，会根据数据的最小值和最大值自动选择 bin 的范围。
    + y轴表示在每个范围出现的频率(数据出现的次数)
+ `plt.hist(data['total_bill'], bins=20)`
    + 划分20个bins

## ref
+ [matplotlib](https://datawhalechina.github.io/fantastic-matplotlib/%E7%AC%AC%E4%B8%80%E5%9B%9E%EF%BC%9AMatplotlib%E5%88%9D%E7%9B%B8%E8%AF%86/index.html)
+ [Matplotlib](https://wklchris.github.io/blog/Matplotlib/index.html)

