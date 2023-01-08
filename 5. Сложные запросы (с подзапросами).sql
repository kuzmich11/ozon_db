--Запрашиваем все продукты заказанные определенным пользователем
WITH orders_users AS (SELECT orders.id AS order_id, orders.user_id AS user_id FROM orders WHERE orders.user_id = 2)
SELECT
	orders_products.product_id,
	(SELECT users.first_name || ' ' || users.last_name AS user_name FROM users WHERE users.id = orders_users.user_id),
	(SELECT products.name AS product_name FROM products WHERE products.id = orders_products.product_id)
FROM orders_products, orders_users
WHERE orders_products.order_id = orders_users.order_id;

--Запрашиваем данные 10 пользователей сделавших самые дорогие заказы
SELECT
	(SELECT users.first_name || ' ' || users.last_name AS user_name FROM users WHERE users.id = orders.user_id),
	orders.id AS order_id,
	orders.user_id,
	orders.total_price
FROM orders
ORDER BY total_price DESC
LIMIT 10;
