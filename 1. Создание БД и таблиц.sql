CREATE DATABASE ozon_db;
GRANT ALL PRIVILEGES ON DATABASE ozon_db to v_a_kuz;

CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	birthday DATE,
	gender INT,
	email VARCHAR(120) NOT NULL UNIQUE,
	phone VARCHAR(15) NOT NULL UNIQUE,
	main_photo_id INT,
	created_at TIMESTAMP
);

CREATE TABLE cards (
	card_number VARCHAR(20),
	valid_until DATE NOT NULL,
	cvv INT NOT NULL
	owner_id INT
	PRIMARY KEY (card_number, owner_id)
);

CREATE TABLE genders (
	id SERIAL PRIMARY KEY,
	gender VARCHAR(15)
);

CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	category_id INT NOT NULL,
	description VARCHAR (300),
	price INT NOT NULL
);

CREATE TABLE product_categories (
	id SERIAL PRIMARY KEY,
	category VARCHAR(50)
);

CREATE TABLE orders (
	id SERIAL PRIMARY KEY,
	user_id INT,
	date_order TIMESTAMP,
	status_order_id INT,
	total_price INT
);

CREATE TABLE orders_products (
	order_id INT,
	product_id INT,
	"count" SMALLINT
);

CREATE TABLE status_orders (
	id SERIAL PRIMARY KEY,
	status VARCHAR(50)
);

CREATE TABLE carts_users (
	user_id INT,
	product_id INT,
	"count" SMALLINT
);

CREATE TABLE refunds (
	id SERIAL PRIMARY KEY,
	user_id INT,
	date_refund TIMESTAMP,
	total_price INT
);

CREATE TABLE refunds_products (
	refund_id INT,
	product_id INT,
	"count" SMALLINT
);

CREATE TABLE products_reviews (
	user_id INT,
	product_id INT,
	score SMALLINT NOT NULL,
	advantages VARCHAR (300),
	disadvantages VARCHAR (300),
	"comments" VARCHAR (300),
	PRIMARY KEY (user_id, product_id)
);

CREATE TABLE photo (
	id SERIAL PRIMARY KEY,
  	url VARCHAR(250) NOT NULL UNIQUE,
  	owner_id INT NOT NULL,
  	description VARCHAR(250) NOT NULL,
  	uploaded_at TIMESTAMP NOT NULL,
  	size INT NOT NULL
);

CREATE TABLE video (
  id SERIAL PRIMARY KEY,
  url VARCHAR(250) NOT NULL UNIQUE,
  owner_id INT NOT NULL,
  description VARCHAR(250) NOT NULL,
  uploaded_at TIMESTAMP NOT NULL,
  size INT NOT NULL
);

CREATE TABLE photo_products (
	product_id INT NOT NULL,
	photo_id INT NOT NULL,
	PRIMARY KEY (product_id, photo_id)
);

CREATE TABLE products_video (
	product_id INT NOT NULL,
	video_id INT NOT NULL,
	PRIMARY KEY (product_id, video_id)
);

ALTER TABLE users DROP COLUMN birthday;
ALTER TABLE users ADD COLUMN birthday DATE;
