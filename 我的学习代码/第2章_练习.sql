
-- 2.1
SELECT product_name, regist_date
	FROM product
WHERE regist_date > '2009-04-28'

-- 2.2  都是啥都没有
-- ①
SELECT *
      FROM Product
     WHERE purchase_price = NULL;

-- ②
SELECT *
      FROM Product
     WHERE purchase_price <> NULL;

-- ③
SELECT *
      FROM Product
     WHERE product_name > NULL;

# IS NULL才是对的		 
SELECT *
		FROM Product
	 WHERE purchase_price IS NULL;


-- 2.3
SELECT product_name, sale_price, purchase_price
	FROM product
WHERE NOT sale_price - purchase_price < 500;

-- 2.4
SELECT product_name, product_type,
	sale_price*0.9 - purchase_price AS profit
	FROM product
	WHERE sale_price*0.9 - purchase_price > 100
	   AND (   product_type = '办公用品'
        OR product_type = '厨房用具');
				