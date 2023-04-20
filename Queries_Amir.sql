Эта процедура получает необходимую информацию для создания нового клиента в таблице MP2_Customers и нового заказа в таблице mp2_orders.

CREATE OR REPLACE PROCEDURE create_customer_and_order(
    p_cust_name IN VARCHAR2,
    p_cust_surname IN VARCHAR2,
    p_cust_address IN VARCHAR2,
    p_cust_phone IN VARCHAR2,
    p_cust_email IN VARCHAR2,
    p_cust_age IN NUMBER,
    p_cust_wallet IN NUMBER,
    p_order_weight_status IN VARCHAR2,
    p_order_price IN NUMBER,
    p_product_id IN NUMBER
) AS
    v_cust_id NUMBER;
    v_order_id NUMBER;
BEGIN
    -- Insert new customer into MP2_Customers table
    INSERT INTO MP2_Customers (Cust_Name, Cust_Surname, Cust_Address, Cust_Phone, Cust_Email, Cust_Age, Cust_Wallet)
    VALUES (p_cust_name, p_cust_surname, p_cust_address, p_cust_phone, p_cust_email, p_cust_age, p_cust_wallet)
    RETURNING Cust_ID INTO v_cust_id;

    -- Insert new order into mp2_orders table
    INSERT INTO mp2_orders (order_id, order_weight_status, order_price, customer_id, product_id)
    VALUES (SEQ_ORDER_ID.NEXTVAL, p_order_weight_status, p_order_price, v_cust_id, p_product_id)
    RETURNING order_id INTO v_order_id;
    
    DBMS_OUTPUT.PUT_LINE('New customer and order created with customer ID ' || v_cust_id || ' and order ID ' || v_order_id);
END;

(CREATE SEQUENCE SEQ_ORDER_ID START WITH 1 INCREMENT BY 1;)




CREATE OR REPLACE PROCEDURE update_product_price (
  p_prod_id IN NUMBER,
  p_new_price IN NUMBER
) IS
BEGIN
  -- Update the price of the product
  UPDATE MP2_Products
  SET Prod_price = p_new_price
  WHERE Prod_id = p_prod_id;
  
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END;


CREATE OR REPLACE PROCEDURE update_employee_phone (
  p_employee_id IN NUMBER,
  p_phone IN VARCHAR2
) IS
BEGIN
  -- Update the employee's phone number based on the given ID
  UPDATE MP2_Employees
  SET Phone = p_phone
  WHERE Employee_ID = p_employee_id;
  
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END;


Процедура которая обновляет статус поддержки поставщика и извлекает информацию о связанном продукте:

CREATE OR REPLACE PROCEDURE update_vendor_support_status (
  p_vendor_id IN NUMBER,
  p_support_status IN NUMBER,
  p_product_name OUT VARCHAR2,
  p_product_description OUT VARCHAR2,
  p_product_price OUT NUMBER,
  p_product_in_stock OUT NUMBER
) IS
BEGIN
  
  UPDATE MP2_Vendors
  SET Vendor_SupportStatus = p_support_status
  WHERE Vendors_id = p_vendor_id;
  
  
  SELECT Prod_name, Prod_description, Prod_price, Prod_in_stock
  INTO p_product_name, p_product_description, p_product_price, p_product_in_stock
  FROM MP2_Products
  WHERE Prod_id = (SELECT Product_id FROM MP2_Vendors WHERE Vendors_id = p_vendor_id);
  
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END;

Триггер для обновления общей цены ордера всякий раз, когда вставляется новый ордер

CREATE OR REPLACE TRIGGER tr_order_price_update
AFTER INSERT OR UPDATE ON mp2_orders
FOR EACH ROW
BEGIN
    UPDATE mp2_orders o
    SET o.order_price = (
        SELECT SUM(p.prod_price)
        FROM mp2_products p
        WHERE p.prod_id IN (
            SELECT product_id
            FROM mp2_orders
            WHERE customer_id = :NEW.customer_id
        )
    )
    WHERE o.order_id = :NEW.order_id;
END;



CREATE TRIGGER trg_check_customer_balance
BEFORE INSERT ON mp2_orders
FOR EACH ROW
DECLARE
    cust_balance NUMBER;
BEGIN
    SELECT SUM(order_price) INTO cust_balance
    FROM mp2_orders
    WHERE customer_id = :NEW.customer_id;
    
    IF cust_balance > 1000 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Customer has an outstanding balance.');
    END IF;
END;

Триггер для предотвращения размещения заказа покупателем, если у него есть непогашенный остаток

CREATE TRIGGER trg_check_customer_balance
BEFORE INSERT ON mp2_orders
FOR EACH ROW
DECLARE
    cust_balance NUMBER;
BEGIN
    SELECT SUM(order_price) INTO cust_balance
    FROM mp2_orders
    WHERE customer_id = :NEW.customer_id;
    
    IF cust_balance > 1000 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Customer has an outstanding balance.');
    END IF;
END;
