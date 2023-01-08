--План запроса данных 10 пользователей сделавших самые дорогие заказы до оптимизации запроса
EXPLAIN ANALYZE
SELECT
	(SELECT users.first_name || ' ' || users.last_name AS user_name FROM users WHERE users.id = orders.user_id),
	orders.id AS order_id,
	orders.user_id,
	orders.total_price
FROM orders
ORDER BY total_price DESC
LIMIT 10;

--План запроса данных 10 пользователей сделавших самые дорогие заказы после оптимизации запроса
EXPLAIN ANALYZE
SELECT 
	users.first_name || ' ' || users.last_name AS user_name,
	orders.id AS order_id,
	orders.user_id,
	orders.total_price
FROM orders
JOIN users
ON users.id = orders.user_id
ORDER BY total_price DESC
LIMIT 10;

--План запроса всех продуктов заказанных определенным пользователем до оптимизации
EXPLAIN ANALYZE
WITH orders_users AS (SELECT orders.id AS order_id, orders.user_id AS user_id FROM orders WHERE orders.user_id = 2)
SELECT
	orders_products.product_id,
	(SELECT users.first_name || ' ' || users.last_name AS user_name FROM users WHERE users.id = orders_users.user_id),
	(SELECT products.name AS product_name FROM products WHERE products.id = orders_products.product_id)
FROM orders_products, orders_users
WHERE orders_products.order_id = orders_users.order_id;

--План запроса всех продуктов заказанных определенным пользователем после оптимизации
EXPLAIN ANALYZE
SELECT
	orders_products.product_id,
	(users.first_name || ' ' || users.last_name) AS user_name,
	products.name AS product_name
FROM orders
JOIN orders_products
ON orders.id = orders_products.order_id
JOIN products
ON products.id = orders_products.product_id
JOIN users
ON users.id = orders.user_id AND orders.user_id = 2;

