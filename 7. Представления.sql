--Представление "Пользователи которые имеют отзывы"
CREATE VIEW users_with_reviwes AS
SELECT
	products_reviews.user_id,
	(COUNT (products_reviews.user_id)) AS count_reviwes
FROM products_reviews
GROUP BY products_reviews.user_id;

SELECT * FROM users_with_reviwes ORDER BY count_reviwes DESC;

--Представление "Пользователи у которых не привязана карта"
CREATE VIEW users_without_cards AS
SELECT 
	users.id,
	users.first_name || ' ' || users.last_name AS user_name
FROM users
LEFT JOIN cards
ON users.id = cards.owner_id
WHERE cards.card_number IS NULL;

SELECT * FROM users_without_cards LIMIT 10;

--Представленние "Товары которые заказывал пользователь"
CREATE VIEW users_products AS
SELECT 
	orders.user_id,
	orders_products.product_id
FROM orders_products
LEFT JOIN orders
ON orders.id = orders_products.product_id;

SELECT * FROM users_products ORDER BY user_id;