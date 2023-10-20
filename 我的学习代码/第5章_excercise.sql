

# 5.1

CREATE VIEW viewpractice5_1 (product_name, sale_price, regist_date)
AS
SELECT product_name, sale_price, regist_date
FROM product
WHERE sale_price > 1000 AND 
regist_date = '2009-09-20';

# 标准答案
CREATE VIEW ViewPractice5_1 AS
SELECT product_name, sale_price, regist_date
  FROM Product
 WHERE sale_price >= 1000
   AND regist_date = '2009-09-20';


# 5.2 失败 好题！
INSERT INTO viewpractice5_1 VALUES ('刀子',300,'2009-11-02')

# 对视图的更新本质上是对视图对应的原表进行更新，原表有很多 NOT NULL的定义，包括主键默认NOT NULL
# 可以插入，但插入的值不全，所以会报错

# 5.3

SELECT product_id, product_name, product_type, sale_price, 
	(SELECT AVG(sale_price) FROM product) AS sale_price_all
FROM product	

# 5.4 好题！！！

CREATE VIEW Avgpricebytype AS
SELECT product_id, product_name, product_type, sale_price, 
 (SELECT AVG(sale_price)
 FROM product AS p2
 WHERE p1.product_type = p2.product_type) as avg_sale_price
FROM product as p1;

SELECT * FROM Avgpricebytype;