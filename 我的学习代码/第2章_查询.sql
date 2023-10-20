-- 2.1 Select 语句基础

SELECT product_name, regist_date
  FROM Product
 WHERE regist_date > '2009-04-28';
 
-- 可以随意使用换行,但没有必要，不能空行，会报错
SELECT
*
FROM
product

# 为列设置别名
SELECT product_id as id,
	sale_price as '价格'  # 中文加引号
	FROM product;

# 查询常数
SELECT '商品' AS string, 38 AS number, '2009-02-24' AS date,
       product_id, product_name
  FROM Product;
	
	
# 重复行distinct；只能用在第一个变量名前面；所有的null会变成一个 
SELECT DISTINCT purchase_price, regist_date
  FROM Product;


-- 2.2 算数运算符 和 比较运算符

# 运算表达式  算数运算符 加减乘除
SELECT product_name, sale_price,
       sale_price * 2 AS "sale_price_x2"
  FROM Product;
SELECT * FROM product;

# 可以不需要 from 子句;基本上不会用到
SELECT (100 + 200) * 3 AS calculation;


# 比较运算符  = <>...  可以直接计算两个列
SELECT product_name, sale_price, purchase_price
  FROM Product
 WHERE sale_price - purchase_price >= 500;


# 对字符使用不等号
-- DDL：创建表
CREATE TABLE Chars
(chr CHAR(3) NOT NULL,
PRIMARY KEY (chr));

-- MySQL
-- DML：插入数据
START TRANSACTION;
INSERT INTO Chars VALUES ('1');
INSERT INTO Chars VALUES ('2');
INSERT INTO Chars VALUES ('3');
INSERT INTO Chars VALUES ('10');
INSERT INTO Chars VALUES ('11');
INSERT INTO Chars VALUES ('222');
COMMIT;

SELECT chr
  FROM Chars
 WHERE chr > '2';
 
 
 # 筛选NULL行  不是用 = NULL 而是is NULL 
 SELECT product_name, purchase_price
  FROM Product
 WHERE purchase_price IS NULL;
 
 SELECT product_name, purchase_price
  FROM Product
 WHERE purchase_price IS NOT NULL;
 
 
 -- 2.3 逻辑运算符 not and or  逻辑积和逻辑和的概念
 
 
 
 
 
 
 
 
 