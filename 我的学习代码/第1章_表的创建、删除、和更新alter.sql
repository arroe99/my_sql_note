CREATE DATABASE shop;
USE SHOP;
-- 创建表格  表名不区分大小写 但表中的值区分
CREATE TABLE Product (
	product_id CHAR ( 4 ) NOT NULL,
	product_name VARCHAR ( 100 ) NOT NULL,
	product_type VARCHAR ( 32 ) NOT NULL,
	sale_price INTEGER,
	purchase_price INTEGER,
	regist_date DATE,
PRIMARY KEY ( product_id ));
-- 插入数据
INSERT INTO Product VALUES ( '0001' , 'T恤', '衣服',1000,500,' 2009-09-20 ');
INSERT INTO Product VALUES ( '0002', '打孔器', '办公用品',500,320,' 2009-09-11 ');
INSERT INTO Product VALUES ( '0003', '运动 T恤 ','衣服',4000,2800,NULL);
INSERT INTO Product VALUES ( '0004', '菜刀','厨房用具',3000,2800,' 2009-09-20 ');
INSERT INTO Product VALUES ( '0005', '高压锅','厨房用具',6800,5000,' 2009-01-15 ');
INSERT INTO Product VALUES ( '0006', '叉子', '厨房用具',500,NULL,' 2009-09-20 ');
INSERT INTO Product VALUES ( '0007','擦菜板','厨房用具',880,790,' 2008-04-28 ');
INSERT INTO Product VALUES ( '0008','圆珠笔','办公用品',100,NULL,' 2009-11-11 ');

-- 删除表
-- DROP TABLE product

/*
数据类型 
INTEGER 整型 
char 字符定长 手机号什么的 
varchar 可变字符
*/

-- 新增一列 
ALTER TABLE product ADD COLUMN temp VARCHAR(100);
SELECT * from product;

-- 删除一列
alter table product drop column temp;
SELECT * from product;

-- 插入行
insert into product VALUES('9','你好','好好',100,200,'2009-11-11');
SELECT * from product;

-- 删除行
DELETE FROM product where (product_id = '1' or product_id = '9');   # 删除的时候不能有*号
SELECT * from product;



