Amirkhan
Эта процедура извлекает сведения о заказе на основе идентификатора заказа, предоставленного в качестве входных данных. 
Он объединяет таблицы mp2_orders, mp2_customers и mp2_products

CREATE OR REPLACE PROCEDURE Get_Order_Details (p_order_id IN INT)
IS
  v_order_weight_status VARCHAR2(50);
  v_order_price NUMBER(10,2);
  v_customer_name VARCHAR2(100);
  v_customer_address VARCHAR2(200);
  v_product_name VARCHAR2(100);
BEGIN
  SELECT order_weight_status, order_price, cust_name, cust_address, prod_name
  INTO v_order_weight_status, v_order_price, v_customer_name, v_customer_address, v_product_name
  FROM mp2_orders o
  JOIN mp2_customers c ON o.customer_id = c.cust_id
  JOIN mp2_products p ON o.product_id = p.prod_id
  WHERE o.order_id = p_order_id;
  
  DBMS_OUTPUT.PUT_LINE('Order ID: ' || p_order_id);
  DBMS_OUTPUT.PUT_LINE('Order Status: ' || v_order_weight_status);
  DBMS_OUTPUT.PUT_LINE('Order Price: $' || v_order_price);
  DBMS_OUTPUT.PUT_LINE('Customer Name: ' || v_customer_name);
  DBMS_OUTPUT.PUT_LINE('Customer Address: ' || v_customer_address);
  DBMS_OUTPUT.PUT_LINE('Product Name: ' || v_product_name);
END;

View который показывает баланс Кошелька Пользователя

CREATE OR REPLACE VIEW MP2_Customer_Wallet_Total AS
SELECT
  Cust_ID,
  Cust_Name,
  Cust_Email,
  Cust_Wallet
FROM
  MP2_Customers;
DECLARE
  v_cust_id NUMBER := 2;
  v_wallet_amount NUMBER;
BEGIN
  SELECT Cust_Wallet
  INTO v_wallet_amount
  FROM MP2_Customer_Wallet_Total
  WHERE Cust_ID = v_cust_id;

  dbms_output.put_line('Customer ' || v_cust_id || ' has a wallet amount of ' || v_wallet_amount);

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    dbms_output.put_line('Error: Customer with ID ' || v_cust_id || ' not found in MP2_Customer_Wallet_Total view.');
END;

Обновляет кошелек Пользователя Курсор

DECLARE
  v_cust_id NUMBER := 2;
  v_wallet_amount NUMBER := 100;
  e_no_customer EXCEPTION;
BEGIN
  UPDATE MP2_Customers
  SET Cust_Wallet = Cust_Wallet + v_wallet_amount
  WHERE Cust_ID = v_cust_id;
  
  IF SQL%ROWCOUNT = 0 THEN
    RAISE e_no_customer;
  END IF;
  
  COMMIT;
EXCEPTION
  WHEN e_no_customer THEN
    dbms_output.put_line('Error: Customer with ID ' || v_cust_id || ' not found.');
END;







Abylay 

Transaction 
1. 1. DECLARE
  v_customer_id NUMBER := 1;
  v_product_id NUMBER := 2;
  v_purchase_amount NUMBER := 129;
BEGIN
  SAVEPOINT sp_purchase_product;

  UPDATE MP2_Customers
  SET Cust_Wallet = Cust_Wallet - v_purchase_amount
  WHERE Cust_ID = v_customer_id;

  UPDATE MP2_Products
  SET Prod_in_stock = Prod_in_stock - 1
  WHERE Prod_id = v_product_id;


  IF SQL%ROWCOUNT > 0 THEN
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Purchase successful, customer wallet and product stock updated');
  ELSE
    ROLLBACK TO sp_purchase_product;
    DBMS_OUTPUT.PUT_LINE('Purchase failed, rollback to the savepoint');
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error occurred, rollback: ' || SQLERRM);
END;


This PL/SQL procedure *purchase_product_for_all_customers* is designed to simulate the purchase of a specific product by all customers. 
MORE AUTOMATIC WITH PROCEDURE:

Procedure 
2. CREATE OR REPLACE PROCEDURE purchase_product_for_all_customers(p_product_id NUMBER, p_purchase_amount NUMBER)
AS
  v_updated_rows NUMBER;
BEGIN
  SAVEPOINT sp_purchase_product_all_customers;

  FOR cust_rec IN (SELECT Cust_ID FROM MP2_Customers)
  LOOP
    UPDATE MP2_Customers
    SET Cust_Wallet = Cust_Wallet - p_purchase_amount
    WHERE Cust_ID = cust_rec.Cust_ID;

    UPDATE MP2_Products
    SET Prod_in_stock = Prod_in_stock - 1
    WHERE Prod_id = p_product_id;
  END LOOP;

  SELECT COUNT(*) INTO v_updated_rows FROM MP2_Customers;
  
  IF v_updated_rows > 0 THEN
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Purchase successful, all customer wallets and product stock updated');
  ELSE
    ROLLBACK TO sp_purchase_product_all_customers;
    DBMS_OUTPUT.PUT_LINE('Purchase failed, rollback to the savepoint');
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error occurred, rollback: ' || SQLERRM);
END purchase_product_for_all_customers;
/




Ramazan
Function
1.CREATE OR REPLACE FUNCTION Get_Avg_Price_By_Category (p_category IN MP2_Products.Prod_Category%TYPE)
RETURN NUMBER
IS
  v_avg_price NUMBER;
BEGIN
  SELECT AVG(Prod_Price)
  INTO v_avg_price
  FROM MP2_Products
  WHERE Prod_Category = p_category;

  RETURN v_avg_price;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN NULL;
END Get_Avg_Price_By_Category;
/
2.
Exeption
DECLARE
  v_prod_id NUMBER := 1;
  v_prod_name VARCHAR2(50) := 'Apple iPhone 13 Pro';
  v_prod_category NUMBER := 1;
  v_prod_weight FLOAT := 0.2;
  v_prod_description VARCHAR2(4000) := 'The latest iPhone with Pro features';
  v_prod_price NUMBER := 999;
  v_prod_in_stock NUMBER := 100;
  v_prod_status NUMBER := 1;
  
  e_unique_violation EXCEPTION;
  PRAGMA EXCEPTION_INIT(e_unique_violation, -1);
BEGIN
  INSERT INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status)
  VALUES (v_prod_id, v_prod_name, v_prod_category, v_prod_weight, v_prod_description, v_prod_price, v_prod_in_stock, v_prod_status);
  COMMIT;
EXCEPTION
  WHEN e_unique_violation THEN
    dbms_output.put_line('Error: Unique constraint violated. Product with ID '  v_prod_id  ' already exists.');
END;
