
-- 4.1 数据插入 INSERT   values子句

CREATE TABLE ProductIns
(product_id      CHAR(4)      NOT NULL,
 product_name    VARCHAR(100) NOT NULL,
 product_type    VARCHAR(32)  NOT NULL,
 sale_price      INTEGER      DEFAULT 0,
 purchase_price  INTEGER      ,
 regist_date     DATE         ,
 PRIMARY KEY (product_id));
 
# （,,,）这种结构叫清单  以下分别是列清单 和 值清单
INSERT INTO ProductIns (product_id, product_name, product_type, sale_price, purchase_price, regist_date) VALUES ('0001', 'T恤' ,'衣服', 1000, 500, '2009-09-20');

# 全列insert时 可以省略列名
INSERT INTO ProductIns VALUES ('0005', '高压锅', '厨房用具', 6800, 5000, '2009-01-15');

# 省略列名的情况
# 没有设定默认值——变成NULL； 设定了默认值，默认值； 设定了not null，会报错


-- 4.2 数据的删除

# drop 删除整个表
# delete 删除表中的数据

CREATE TABLE temp(
 lieming1 VARCHAR(20) NOt NULL,
 lieming2 integer default 0,
 PRIMARY KEY (lieming1)
);

INSERT into temp (lieming1, lieming2) VALUES ('nihao', 2);

DROP table temp;
DELETE FROM temp;


DELETE FROM Product
 WHERE sale_price >= 4000;

-- 确认删除后的结果
SELECT * FROM Product;



-- 4.3 数据的更新 UPDATE

UPDATE Product
   SET sale_price = sale_price * 10
 WHERE product_type = '厨房用具';

# 确认更新内容
SELECT * FROM Product ORDER BY product_id;


 # 多列更新 用逗号隔开即可
UPDATE Product
 SET sale_price = sale_price * 10,
		 purchase_price = purchase_price / 2   
WHERE product_type = '厨房用具';

