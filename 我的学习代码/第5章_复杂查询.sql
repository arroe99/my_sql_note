
-- 5.1 视图

# 不保存数据，存储的是select语句，临时表

# 初始化数据
DELETE FROM product;
START TRANSACTION;
INSERT INTO Product VALUES ('0001', 'T恤' ,'衣服', 1000, 500, '2009-09-20');
INSERT INTO Product VALUES ('0002', '打孔器', '办公用品', 500, 320, '2009-09-11');
INSERT INTO Product VALUES ('0003', '运动T恤', '衣服', 4000, 2800, NULL);
INSERT INTO Product VALUES ('0004', '菜刀', '厨房用具', 3000, 2800, '2009-09-20');
INSERT INTO Product VALUES ('0005', '高压锅', '厨房用具', 6800, 5000, '2009-01-15');
INSERT INTO Product VALUES ('0006', '叉子', '厨房用具', 500, NULL, '2009-09-20');
INSERT INTO Product VALUES ('0007', '擦菜板', '厨房用具', 880, 790, '2008-04-28');
INSERT INTO Product VALUES ('0008', '圆珠笔', '办公用品', 100, NULL, '2009-11-11');
COMMIT;


CREATE VIEW ProductSum (product_type, cnt_product)
AS
SELECT product_type, COUNT(*)
  FROM Product
 GROUP BY product_type;


# 注意：定义视图时不要使用ORDER BY,因为视图的数据行没有顺序

# 对视图的更新本质上是对视图对应的原表进行更新

# 可以更新视图的场景
# 1 没有用distinct; 2 from一个表；3 没有用group by； 4 没有用Having
# 原理或许是因为，改了视图以后为了保持一致性，原表也会做出相应的改变 



-- 5.2 子查询 ； 基于视图的子查询； 本质上就是嵌套的select结构

SELECT product_type, cnt_product
  FROM (SELECT product_type, COUNT(*) AS cnt_product
          FROM Product
         GROUP BY product_type) AS ProductSum;
				 
# 标量子查询：返回一个值的select子句



-- 5.3 关联子查询

SELECT product_type, AVG(sale_price)
 FROM Product
GROUP BY product_type


SELECT product_type, product_name, sale_price
  FROM Product AS P1
 WHERE sale_price > (SELECT AVG(sale_price)
                         FROM Product AS P2
                        WHERE P1.product_type = P2.product_type
                        GROUP BY product_type);
												
												