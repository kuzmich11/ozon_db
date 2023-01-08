--Запрашиваем данные товаров находящихся в корзине определенного пользователя
SELECT
	carts_users.user_id AS cart_user_id,
	products.id,
	products.name
FROM carts_users
JOIN products
ON products.id = carts_users.product_id AND carts_users.user_id = 4;

--Запрашиваем id всех пользователей вернувших определенный товар
SELECT
	refunds_products.product_id,
	refunds.user_id
FROM refunds
JOIN refunds_products
ON refunds.id = refunds_products.refund_id AND refunds_products.product_id = 6;
