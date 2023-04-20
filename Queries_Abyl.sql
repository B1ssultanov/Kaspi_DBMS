sql
Trigger который запрещает тип оплаты ‘cash’
CREATE OR REPLACE TRIGGER prevent_cash_payments
BEFORE INSERT ON payments
FOR EACH ROW
BEGIN
  IF :new.payment_type = 'cash' THEN
    RAISE_APPLICATION_ERROR(-20001, 'Cash payments are not allowed');
  END IF;
END;

sql
Если длина вводимого номера карточки не равна 16 ти то выводит ошибку
CREATE OR REPLACE TRIGGER credit_card_length_trg
BEFORE INSERT OR UPDATE ON guests
FOR EACH ROW
BEGIN
  IF LENGTH(:NEW.CREDIT_CARD) != 16 THEN
    RAISE_APPLICATION_ERROR(-20002, 'The credit card number must be exactly 16 characters long');
  END IF;
END;

sql
Проверка на существующий guest_id
BEGIN
  INSERT INTO guests (guest_id, first_name, last_name,contact_id,credit_card)
  VALUES (:guest_id, :first_name, :last_name, :contact_id,:credit_card);
  EXCEPTION
    WHEN dup_val_on_index THEN
      raise_application_error (-20001, 'Error: product already exists');
END;

sql
Тригер который не позволяет заказывать новые заказы пока на пришли прошлые
BEGIN;
DECLARE num_orders INTEGER;
DECLARE num_delivered_orders INTEGER;
SELECT COUNT(*) INTO num_orders FROM orders WHERE customer_id = <id_покупателя> AND status IN ('новый', 'в обработке');
SELECT COUNT(*) INTO num_delivered_orders FROM orders o INNER JOIN ships s ON o.ship_id = s.ship_id WHERE o.customer_id = <id_покупателя> AND s.ship_status = 'доставлен';

IF num_orders >= <максимальное_количество_заказов> AND num_delivered_orders = 0 THEN
    RAISE EXCEPTION 'Вы не можете размещать новые заказы, пока не получили предыдущие или пока не будет доставлен предыдущий заказ.';
ELSIF num_orders >= <максимальное_количество_заказов> THEN
    RAISE EXCEPTION 'Вы не можете размещать новые заказы, пока не получили предыдущие.';
END IF;

INSERT INTO orders (customer_id, product_id, quantity, status) VALUES (<id_покупателя>, <id_товара>, <количество_товара>, 'новый');
COMMIT;

sql
Ограничение на доступность товаров: если товар временно недоступен или закончился, база данных может генерировать исключение с сообщением "Извините, этот товар временно недоступен".

BEGIN;
DECLARE stock_quantity INTEGER;
SELECT quantity INTO stock_quantity FROM stock WHERE product_id = <id_товара>;

IF stock_quantity < <количество_товара> THEN
    RAISE EXCEPTION 'Запрошенное количество товара превышает имеющийся остаток на складе.';
END IF;

UPDATE stock SET quantity = quantity - <количество_товара> WHERE product_id = <id_товара>;
COMMIT;

sql
Транзакция для обработки платежа заказа:

Здесь мы начинаем транзакцию для обработки платежа заказа, изменяем статус заказа на "PAYMENT_PROCESSING" и вставляем запись о платежной транзакции в таблицу "payment_transactions". Затем мы вызываем хранимую процедуру "EXECUTE_PAYMENT", которая обрабатывает платеж и возвращает статус платежа. Если платеж был одобрен, мы изменяем статус заказа на "PAYMENT_APPROVED", иначе мы изменяем его на "PAYMENT_FAILED".

BEGIN TRANSACTION;

UPDATE orders
SET status = 'PAYMENT_PROCESSING'
WHERE order_id = 1;

INSERT INTO payment_transactions (order_id, payment_date, payment_amount)
VALUES (1, '2023-04-17', 100.00);

DECLARE @payment_status VARCHAR(20);
SET @payment_status = EXECUTE_PAYMENT(1, 100.00);

IF @payment_status = 'APPROVED' BEGIN
UPDATE orders
SET status = 'PAYMENT_APPROVED'
WHERE order_id = 1;
END ELSE BEGIN
UPDATE orders
SET status = 'PAYMENT_FAILED'
WHERE order_id = 1;
END;

COMMIT;

```sql
Транзакция для обработки возврата товара:

Здесь мы начинаем транзакцию для обработки возврата товара, изменяем статус заказа на "RETURN_PROCESSING" и вставляем запись о возврате в таблицу "returns". Затем мы вызываем хранимую процедуру "CALCULATE_REFUND_AMOUNT", которая вычисляет общую сумму возврата. Затем мы вызываем хранимую процедуру "EXECUTE_REFUND", которая обрабатывает возврат и возвращает статус возврата. Если возврат был одобрен, мы изменяем статус заказа на "RETURN_APPROVED", иначе мы изменяем его на "RETURN_FAILED".

BEGIN TRANSACTION;

UPDATE orders
SET status = 'RETURN_PROCESSING'
WHERE order_id = 1;

DECLARE @total_refund_amount DECIMAL(10, 2);
SET @total_refund_amount = CALCULATE_REFUND_AMOUNT(1);

INSERT INTO returns (order_id, return_date, total_refund_amount)
VALUES (1, '2023-04-20', @total_refund_amount);

DECLARE @refund_status VARCHAR(20);
SET @refund_status = EXECUTE_REFUND(1, @total_refund_amount);

IF @refund_status = 'APPROVED' BEGIN
UPDATE orders
SET status = 'RETURN_APPROVED'
WHERE order_id = 1;
END ELSE BEGIN
UPDATE orders
SET status = 'RETURN_FAILED'
WHERE order_id = 1;
END;

COMMIT;
```Abylay

