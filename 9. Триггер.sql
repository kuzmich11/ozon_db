--Триггер добавления товара в карзину
CREATE OR REPLACE FUNCTION refund_product_trigger()
RETURNS TRIGGER AS
$$
DECLARE refund_product_id INTEGER;
DECLARE refund_user_id INTEGER;
BEGIN
	refund_user_id := (SELECT user_id FROM refunds WHERE refunds.id = NEW.refund_id);
    refund_product_id := (SELECT product_id FROM users_buy_products WHERE product_id = NEW.product_id AND user_id = refund_user_id);
    IF refund_product_id IS NULL OR NEW.product_id != refund_product_id THEN
		RAISE EXCEPTION 'User with ID: % did not buy the product with ID: %', refund_user_id, NEW.product_id;
    END IF;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS check_product_user ON refunds_products;
CREATE TRIGGER check_product_user BEFORE INSERT ON refunds_products
    FOR EACH ROW
EXECUTE FUNCTION refund_product_trigger();


INSERT INTO refunds_products (refund_id, product_id, "count")
VALUES (17, 10, 1); --ERROR: ОШИБКА:  User with ID: 4 did not buy the product with ID: 10

INSERT INTO refunds_products (refund_id, product_id, "count")
VALUES (17, 32, 1); --Запрос выполнен