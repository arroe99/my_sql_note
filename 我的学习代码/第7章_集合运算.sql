
-- 7.1 表的 并集 交集 差集

CREATE TABLE Product2
(product_id      CHAR(4)      NOT NULL,
 product_name    VARCHAR(100) NOT NULL,
 product_type    VARCHAR(32)  NOT NULL,
 sale_price      INTEGER      ,
 purchase_price  INTEGER      ,
 regist_date      DATE         ,
 PRIMARY KEY (product_id));
 
START TRANSACTION;

INSERT INTO Product2 VALUES ('0001', 'T恤', '衣服', 1000, 500, '2009-09-20');
INSERT INTO Product2 VALUES ('0002', '打孔器', '办公用品', 500, 320, '2009-09-11');
INSERT INTO Product2 VALUES ('0003', '运动T恤', '衣服', 4000, 2800, NULL);
INSERT INTO Product2 VALUES ('0009', '手套', '衣服', 800, 500, NULL);
INSERT INTO Product2 VALUES ('0010', '水壶', '厨房用具', 2000, 1700, '2009-09-20');

COMMIT;

# 用UNION进行合并（并集）

SELECT product_id, product_name
  FROM Product
UNION   # ALL 保留重复行
SELECT product_id, product_name
  FROM Product2;
	
SELECT * FROM product
UNION ALL
SELECT * FROM product2

# 交集 公共部分  （Mysql不支持 intersect）
-- SELECT * FROM product
-- INTERSECT
-- SELECT * FROM product2


# 差集 except mysql同样不支持

-- SELECT product_id, product_name
--   FROM Product
-- EXCEPT
-- SELECT product_id, product_name
--   FROM Product2
-- ORDER BY product_id;



-- 7.2 联结
CREATE TABLE ShopProduct
(shop_id    CHAR(4)       NOT NULL,
 shop_name  VARCHAR(200)  NOT NULL,
 product_id CHAR(4)       NOT NULL,
 quantity   INTEGER       NOT NULL,
 PRIMARY KEY (shop_id, product_id));
 
START TRANSACTION;

INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity) VALUES ('000A',	'东京',		'0001',	30);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity) VALUES ('000A',	'东京',		'0002',	50);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity) VALUES ('000A',	'东京',		'0003',	15);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity) VALUES ('000B',	'名古屋',	'0002',	30);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity) VALUES ('000B',	'名古屋',	'0003',	120);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity) VALUES ('000B',	'名古屋',	'0004',	20);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity) VALUES ('000B',	'名古屋',	'0006',	10);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity) VALUES ('000B',	'名古屋',	'0007',	40);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity) VALUES ('000C',	'大阪',		'0003',	20);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity) VALUES ('000C',	'大阪',		'0004',	50);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity) VALUES ('000C',	'大阪',		'0006',	90);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity) VALUES ('000C',	'大阪',		'0007',	70);
INSERT INTO ShopProduct (shop_id, shop_name, product_id, quantity) VALUES ('000D',	'福冈',		'0001',	100);

COMMIT;


# 内联结 选取同时存在于两张表的数据
SELECT SP.shop_id, SP.shop_name, SP.product_id, P.product_name, P.sale_price
  FROM ShopProduct AS SP INNER JOIN Product AS P
    ON SP.product_id = P.product_id;   # 联结键

# 外联结 结果中包含原表中不存在（原表之外）的信息
SELECT SP.shop_id, SP.shop_name, SP.product_id, P.product_name, P.sale_price
  FROM ShopProduct AS SP LEFT OUTER JOIN Product AS P  # 外联结需要指定主表
    ON SP.product_id = P.product_id;

SELECT SP.shop_id, SP.shop_name, SP.product_id, P.product_name, P.sale_price
  FROM ShopProduct AS SP RIGHT OUTER JOIN Product AS P  # 外联结需要指定主表
    ON SP.product_id = P.product_id;



-- 三张表联结

-- MySQL
-- DDL：创建表
CREATE TABLE InventoryProduct
( inventory_id	      CHAR(4)      NOT NULL,
  product_id          CHAR(4)      NOT NULL,
  inventory_quantity  INTEGER      NOT NULL,
  PRIMARY KEY (inventory_id, product_id));

-- DML：插入数据
START TRANSACTION;

INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity) VALUES ('S001',	'0001',	0);
INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity)VALUES ('S001',	'0002',	120);
INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity) VALUES ('S001',	'0003',	200);
INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity) VALUES ('S001',	'0004',	3);
INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity) VALUES ('S001',	'0005',	0);
INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity) VALUES ('S001',	'0006',	99);
INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity) VALUES ('S001',	'0007',	999);
INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity) VALUES ('S001',	'0008',	200);
INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity)VALUES ('S002',	'0001',	10);
INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity) VALUES ('S002',	'0002',	25);
INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity) VALUES ('S002',	'0003',	34);
INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity) VALUES ('S002',	'0004',	19);
INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity) VALUES ('S002',	'0005',	99);
INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity) VALUES ('S002',	'0006',	0);
INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity) VALUES ('S002',	'0007',	0);
INSERT INTO InventoryProduct (inventory_id, product_id, inventory_quantity) VALUES ('S002',	'0008',	18);

COMMIT;

-- SQL Server, DB2, PostgreSQL, MySQL
SELECT SP.shop_id, SP.shop_name, SP.product_id, P.product_name, P.sale_price, IP.inventory_quantity
  FROM ShopProduct AS SP INNER JOIN Product AS P
    ON SP.product_id = P.product_id
               INNER JOIN InventoryProduct AS IP
                   ON SP.product_id = IP.product_id
WHERE IP.inventory_id = 'S001';


# 交叉联结（一般用不到 笛卡尔乘积）
SELECT SP.shop_id, SP.shop_name, SP.product_id, P.product_name
  FROM ShopProduct AS SP CROSS JOIN Product AS P;
	
	
	