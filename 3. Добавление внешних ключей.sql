--Создаем внешние ключи
--Для таблицы users
ALTER TABLE users
ADD CONSTRAINT users_main_photo_id_fk
FOREIGN KEY (main_photo_id)
REFERENCES photo (id);

ALTER TABLE users
ADD CONSTRAINT users_gender_fk
FOREIGN KEY (gender)
REFERENCES genders (id);

--Для таблицы cards
ALTER TABLE cards
ADD CONSTRAINT cards_owner_id_fk
FOREIGN KEY (owner_id)
REFERENCES users (id);

--Для таблицы products
ALTER TABLE products
ADD CONSTRAINT products_category_id_fk
FOREIGN KEY (category_id)
REFERENCES product_categories (id);

--Для таблицы orders
ALTER TABLE orders
ADD CONSTRAINT orders_status_order_id_fk
FOREIGN KEY (status_order_id)
REFERENCES status_orders (id);

ALTER TABLE orders
ADD CONSTRAINT orders_user_id_fk
FOREIGN KEY (user_id)
REFERENCES users (id);

--Для таблицы orders_products
ALTER TABLE orders_products
ADD CONSTRAINT orders_products_order_id_fk
FOREIGN KEY (order_id)
REFERENCES orders (id);

ALTER TABLE orders_products
ADD CONSTRAINT orders_products_product_id_fk
FOREIGN KEY (product_id)
REFERENCES products (id);

--Для таблицы carts_users
ALTER TABLE carts_users
ADD CONSTRAINT carts_users_user_id_fk
FOREIGN KEY (user_id)
REFERENCES usersrs (id);

ALTER TABLE carts_users
ADD CONSTRAINT carts_users_product_id_fk
FOREIGN KEY (product_id)
REFERENCES products (id);

--Для таблицы refunds
ALTER TABLE refunds
ADD CONSTRAINT refunds_user_id_fk
FOREIGN KEY (user_id)
REFERENCES usersrs (id);

--Для таблицы refunds_products
ALTER TABLE refunds_products
ADD CONSTRAINT refunds_products_refund_id_fk
FOREIGN KEY (refund_id)
REFERENCES refunds (id);

ALTER TABLE refunds_products
ADD CONSTRAINT refunds_products_product_id_fk
FOREIGN KEY (product_id)
REFERENCES products (id);

--Для таблицы products_reviews
ALTER TABLE products_reviews
ADD CONSTRAINT products_reviews_user_id_fk
FOREIGN KEY (user_id)
REFERENCES usersrs (id);

ALTER TABLE products_reviews
ADD CONSTRAINT products_reviews_product_id_fk
FOREIGN KEY (product_id)
REFERENCES products (id);

--Для таблицы photo
ALTER TABLE photo
ADD CONSTRAINT photo_owner_id_fk
FOREIGN KEY (owner_id)
REFERENCES users (id);

--Для таблицы video
ALTER TABLE video
ADD CONSTRAINT video_owner_id_fk
FOREIGN KEY (owner_id)
REFERENCES users (id);

--Для таблицы photo_products
ALTER TABLE photo_products
ADD CONSTRAINT photo_products_photo_id_fk
FOREIGN KEY (photo_id)
REFERENCES photo (id);

ALTER TABLE photo_products
ADD CONSTRAINT photo_products_product_id_fk
FOREIGN KEY (product_id)
REFERENCES products (id);

--Для таблицы products_video
ALTER TABLE products_video
ADD CONSTRAINT products_video_video_id_fk
FOREIGN KEY (video_id)
REFERENCES video (id);

ALTER TABLE products_video
ADD CONSTRAINT products_video_product_id_fk
FOREIGN KEY (product_id)
REFERENCES products (id);
