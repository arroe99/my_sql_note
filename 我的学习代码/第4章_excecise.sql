
-- 4.3

CREATE TABLE Productmargin (
	product_id CHAR ( 4 ) NOT NULL,
	product_name VARCHAR ( 100 ) NOT NULL,
	sale_price INTEGER,
	purchase_price INTEGER,
	margin INTEGER,
PRIMARY KEY ( product_id )
);

INSERT INTO productmargin
SELECT product_id, product_name, sale_price, purchase_price, sale_price-purchase_price AS margin # 事实上AS margin 是不需要的
FROM product

INSERT INTO ProductMargin (product_id, product_name, sale_price, purchase_price, margin)
SELECT product_id, product_name, sale_price, purchase_price, sale_price - purchase_price   # 上面的列清单指定了列名，这里就不用AS
  FROM Product;


-- 4.4
# 1
UPDATE productmargin   #注意这里不需要TABLE
	set sale_price = 3000
	WHERE product_name = 'T恤'
# 2
UPDATE productmargin   #注意这里不需要TABLE
	set margin = sale_price - purchase_price
	WHERE product_name = 'T恤'