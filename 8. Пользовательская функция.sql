--Функция "Cумма всех заказов сделанных пользователем"
DROP FUNCTION total_price_by_user_id;
CREATE FUNCTION total_price_by_user_id (id_user INTEGER)
RETURNS BIGINT AS
$$
SELECT
	SUM (total_price)
FROM orders
WHERE user_id = id_user;
$$
LANGUAGE SQL;

SELECT total_price_by_user_id (2);



SELECT * FROM orders WHERE user_id = 2;

SELECT 
	orders_products.product_id 
FROM 
	orders_products 
WHERE 
	orders_products.order_id = (SELECT orders.id FROM orders WHERE orders.user_id = 2);
	
	
SELECT * FROM orders WHERE orders.user_id = 2;
SELECT * FROM orders_products WHERE order_id = 7 OR order_id = 39 OR order_id = 70 OR order_id = 85;
	
SELECT orders_products.product_id 
FROM orders_products 
LEFT JOIN orders 
ON orders_products.order_id = (SELECT orders.id FROM orders WHERE orders.user_id = 2);
	