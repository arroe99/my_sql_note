
-- 3.2
SELECT product_type, SUM(sale_price), SUM(purchase_price)
FROM product
GROUP BY(product_type)
HAVING SUM(sale_price) > SUM(purchase_price) * 1.5