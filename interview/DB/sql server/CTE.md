

## Common Table Expression，CTE
+ WITH 子句使您能够为一个查询创建一个临时的命名结果集，并且可以在后续查询中引用这个结果集，从而使查询更具可读性和模块化。

```sql
WITH NumberedRows AS (
    SELECT
        ProductID,
        ProductName,
        Price,
        ROW_NUMBER() OVER (ORDER BY ProductID) AS RowNum
    FROM Products
)
SELECT ProductID, ProductName, Price
FROM NumberedRows
WHERE RowNum BETWEEN @startRow AND @endRow;
```