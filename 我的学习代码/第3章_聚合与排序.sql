-- 3.1 聚合函数（多行数据汇总成一行）
# 包括有 count sum  avg max min 

SELECT COUNT(*)  # 会返回包含NULL的数据行数
  FROM Product;
	
SELECT COUNT(product_id)
  FROM Product;
	
SELECT COUNT(purchase_price)
	FROM Product;


SELECT AVG(sale_price), AVG(purchase_price)  # 先剔除NULL值，然后进行计算
  FROM Product;

SELECT COUNT(DISTINCT product_type)   # 跟unique函数差不多
  FROM Product;
	
	
-- 3.2 对表进行分组 GROUP BY函数

SELECT purchase_price, COUNT(*)  # 缺失值（这本书里叫“不确定”）也会被聚成一类
  FROM Product
 GROUP BY purchase_price;   # 这个列名叫“聚合键”
 

# 常见错误1：使用GROUP BY子句时，SELECT子句不能出现聚合键之外的列名
# 只有MySQL可以这样写
# 其他所有数据库中，
SELECT product_name, purchase_price, COUNT(*)
FROM Product
GROUP BY purchase_price;

SELECT *
FROM Product
GROUP BY purchase_price;

# 常见错误2：GROUP BY中使用了列的别名
# 虽然不会报错，但是别用，运行的顺序是先GROUP BY，所以别名还没生效
SELECT product_type AS pt, COUNT(*)
  FROM Product
 GROUP BY pt;
 
# tips：GROUP BY出来的结果是纯随机的，但可以用select来排序


-- 3.3 为聚合结果指定条件 Having
SELECT product_type, COUNT(*)
FROM product
GROUP BY product_type
HAVING count(*)=2


-- 3.4 对查询结果进行排序

# 排序时若含NULL，NULL会出现在开头或者结尾
SELECT product_id, product_name, sale_price, purchase_price
  FROM Product
ORDER BY sale_price DESC;

SELECT product_id, product_name, sale_price, purchase_price
  FROM Product
ORDER BY purchase_price;

# 可以用别名
SELECT product_id AS id, product_name, sale_price AS sp, purchase_price
  FROM Product
ORDER BY sp, id;

# 可以用不在select子句中的列
SELECT product_name, sale_price, purchase_price
  FROM Product
ORDER BY product_id;

# 可以order by count
SELECT product_type, COUNT(*)
  FROM Product
 GROUP BY product_type
ORDER BY COUNT(*);