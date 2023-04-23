-- Yedyge
-- 1. Collection
-- create or replace TRIGGER check_review_desc
-- BEFORE INSERT ON MP2_REVIEW
-- FOR EACH ROW
-- DECLARE
--     TYPE arr IS TABLE OF MP2_REVIEW.REVIEW_DESC%TYPE INDEX BY PLS_INTEGER;
--     bad_words arr;
-- BEGIN
--     bad_words(1) := ' shit';
--     bad_words(2) := ' awful';
--     bad_words(3) := ' ass ';
--     bad_words(4) := ' faggot';
--     bad_words(5) := ' fuck';
--     bad_words(6) := ' damn ';
--     bad_words(7) := ' pissflaps';
--     bad_words(8) := ' piss off';
--     bad_words(9) := ' dick';
--     FOR i IN 1..bad_words.count LOOP
--         IF (LOWER(:NEW.review_desc) LIKE '%' || bad_words(i) || '%') THEN
--             raise_application_error(-20001, 'Cannot insert review with inappropriate language.');
--         END IF;
--     END LOOP;
-- END;

-- 2. Trigger
-- CREATE OR REPLACE TRIGGER EMPLOYEES_AGE_CHECK
-- BEFORE INSERT ON MP2_Employees
-- FOR EACH ROW
-- BEGIN
--     IF :NEW.AGE < 18 THEN
--         RAISE_APPLICATION_ERROR(-20001, 'You need to be 18+ for getting to this job');
--     END IF;
-- END;






-- Amirkhan
-- Эта процедура извлекает сведения о заказе на основе идентификатора заказа, предоставленного в качестве входных данных. 
-- Он объединяет таблицы mp2_orders, mp2_customers и mp2_products

-- CREATE OR REPLACE PROCEDURE Get_Order_Details (p_order_id IN INT)
-- IS
--   v_order_weight_status VARCHAR2(50);
--   v_order_price NUMBER(10,2);
--   v_customer_name VARCHAR2(100);
--   v_customer_address VARCHAR2(200);
--   v_product_name VARCHAR2(100);
-- BEGIN
--   SELECT order_weight_status, order_price, cust_name, cust_address, prod_name
--   INTO v_order_weight_status, v_order_price, v_customer_name, v_customer_address, v_product_name
--   FROM mp2_orders o
--   JOIN mp2_customers c ON o.customer_id = c.cust_id
--   JOIN mp2_products p ON o.product_id = p.prod_id
--   WHERE o.order_id = p_order_id;
--   
--   DBMS_OUTPUT.PUT_LINE('Order ID: ' || p_order_id);
--   DBMS_OUTPUT.PUT_LINE('Order Status: ' || v_order_weight_status);
--   DBMS_OUTPUT.PUT_LINE('Order Price: $' || v_order_price);
--   DBMS_OUTPUT.PUT_LINE('Customer Name: ' || v_customer_name);
--   DBMS_OUTPUT.PUT_LINE('Customer Address: ' || v_customer_address);
--   DBMS_OUTPUT.PUT_LINE('Product Name: ' || v_product_name);
-- END;

-- View который показывает баланс Кошелька Пользователя
-- CREATE OR REPLACE VIEW MP2_Customer_Wallet_Total AS
-- SELECT
--   Cust_ID,
--   Cust_Name,
--   Cust_Email,
--   Cust_Wallet
-- FROM
--   MP2_Customers;
-- DECLARE
--   v_cust_id NUMBER := 2;
--   v_wallet_amount NUMBER;
-- BEGIN
--   SELECT Cust_Wallet
--   INTO v_wallet_amount
--   FROM MP2_Customer_Wallet_Total
--   WHERE Cust_ID = v_cust_id;
--   dbms_output.put_line('Customer ' || v_cust_id || ' has a wallet amount of ' || v_wallet_amount);
-- EXCEPTION
--   WHEN NO_DATA_FOUND THEN
--     dbms_output.put_line('Error: Customer with ID ' || v_cust_id || ' not found in MP2_Customer_Wallet_Total view.');
-- END;

-- Обновляет кошелек Пользователя Курсор
-- DECLARE
--   v_cust_id NUMBER := 2;
--   v_wallet_amount NUMBER := 100;
--   e_no_customer EXCEPTION;
--   
--   CURSOR c_customers IS
--     SELECT Cust_ID, Cust_Wallet
--     FROM MP2_Customers
--     WHERE Cust_ID = v_cust_id
--     FOR UPDATE OF Cust_Wallet;
--     
--   r_customer c_customers%ROWTYPE;
-- BEGIN
--   OPEN c_customers;
--   
--   FETCH c_customers INTO r_customer;
--   
--   IF c_customers%NOTFOUND THEN
--     CLOSE c_customers;
--     RAISE e_no_customer;
--   END IF;
--   
--   UPDATE MP2_Customers
--   SET Cust_Wallet = r_customer.Cust_Wallet + v_wallet_amount
--   WHERE CURRENT OF c_customers;
--   
--   CLOSE c_customers;
--   COMMIT;
--   
-- EXCEPTION
--   WHEN e_no_customer THEN
--     dbms_output.put_line('Error: Customer with ID ' || v_cust_id || ' not found.');
-- END;








-- Abylay 

-- 1. Transaction 
-- DECLARE
--   v_customer_id NUMBER := 1;
--   v_product_id NUMBER := 2;
--   v_purchase_amount NUMBER := 129;
-- BEGIN
--   SAVEPOINT sp_purchase_product;
--   UPDATE MP2_Customers
--   SET Cust_Wallet = Cust_Wallet - v_purchase_amount
--   WHERE Cust_ID = v_customer_id;
--   UPDATE MP2_Products
--   SET Prod_in_stock = Prod_in_stock - 1
--   WHERE Prod_id = v_product_id;
--   IF SQL%ROWCOUNT > 0 THEN
--     COMMIT;
--     DBMS_OUTPUT.PUT_LINE('Purchase successful, customer wallet and product stock updated');
--   ELSE
--     ROLLBACK TO sp_purchase_product;
--     DBMS_OUTPUT.PUT_LINE('Purchase failed, rollback to the savepoint');
--   END IF;
-- EXCEPTION
--   WHEN OTHERS THEN
--     ROLLBACK;
--     DBMS_OUTPUT.PUT_LINE('Error occurred, rollback: ' || SQLERRM);
-- END;


-- This PL/SQL procedure *purchase_product_for_all_customers* is designed to simulate the purchase of a specific product by all customers. 
-- MORE AUTOMATIC WITH PROCEDURE:
-- 2. Procedure 
-- CREATE OR REPLACE PROCEDURE purchase_product_for_all_customers(p_product_id NUMBER, p_purchase_amount NUMBER)
-- AS
--   v_updated_rows NUMBER;
-- BEGIN
--   SAVEPOINT sp_purchase_product_all_customers;

--   FOR cust_rec IN (SELECT Cust_ID FROM MP2_Customers)
--   LOOP
--     UPDATE MP2_Customers
--     SET Cust_Wallet = Cust_Wallet - p_purchase_amount
--     WHERE Cust_ID = cust_rec.Cust_ID;

--     UPDATE MP2_Products
--     SET Prod_in_stock = Prod_in_stock - 1
--     WHERE Prod_id = p_product_id;
--   END LOOP;

--   SELECT COUNT(*) INTO v_updated_rows FROM MP2_Customers;
--   
--   IF v_updated_rows > 0 THEN
--     COMMIT;
--     DBMS_OUTPUT.PUT_LINE('Purchase successful, all customer wallets and product stock updated');
--   ELSE
--     ROLLBACK TO sp_purchase_product_all_customers;
--     DBMS_OUTPUT.PUT_LINE('Purchase failed, rollback to the savepoint');
--   END IF;
-- EXCEPTION
--   WHEN OTHERS THEN
--     ROLLBACK;
--     DBMS_OUTPUT.PUT_LINE('Error occurred, rollback: ' || SQLERRM);
-- END purchase_product_for_all_customers;




-- Ramazan

-- 1. Function
-- CREATE OR REPLACE FUNCTION Get_Avg_Price_By_Category (p_category IN MP2_Products.Prod_Category%TYPE)
-- RETURN NUMBER
-- IS
--   v_avg_price NUMBER;
-- BEGIN
--   SELECT AVG(Prod_Price)
--   INTO v_avg_price
--   FROM MP2_Products
--   WHERE Prod_Category = p_category;

--   RETURN v_avg_price;

-- EXCEPTION
--   WHEN NO_DATA_FOUND THEN
--     RETURN NULL;
-- END Get_Avg_Price_By_Category;

1.2
--CREATE OR REPLACE FUNCTION MP2_GroupByCategory2
--RETURN VARCHAR2
--IS
--  v_result VARCHAR2(2000) := '';
--BEGIN
--  FOR rec IN (SELECT c.prod_cat_category, COUNT(*) AS total_products, AVG(p.prod_price) AS avg_price
--              FROM MP2_Products p
--              JOIN MP2_Products_category c ON p.prod_category = c.prod_cat_id
--              GROUP BY c.prod_cat_category)
--  LOOP
--    v_result := v_result || rec.prod_cat_category || ' - Total Products: ' || rec.total_products || ', Avg. Price: ' || rec.avg_price || CHR(10);
--  END LOOP;
--
--  RETURN v_result;
--END;
--
--DECLARE
--  v_result VARCHAR2(2000);
--BEGIN
--  v_result := MP2_GroupByCategory2();
--  DBMS_OUTPUT.PUT_LINE(v_result);
--END;


-- 2. Exeption
-- DECLARE
--   v_prod_id NUMBER := 1;
--   v_prod_name VARCHAR2(50) := 'Apple iPhone 13 Pro';
--   v_prod_category NUMBER := 1;
--   v_prod_weight FLOAT := 0.2;
--   v_prod_description VARCHAR2(4000) := 'The latest iPhone with Pro features';
--   v_prod_price NUMBER := 999;
--   v_prod_in_stock NUMBER := 100;
--   v_prod_status NUMBER := 1;
--   
--   e_unique_violation EXCEPTION;
--   PRAGMA EXCEPTION_INIT(e_unique_violation, -1);
-- BEGIN
--   INSERT INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status)
--   VALUES (v_prod_id, v_prod_name, v_prod_category, v_prod_weight, v_prod_description, v_prod_price, v_prod_in_stock, v_prod_status);
--   COMMIT;
-- EXCEPTION
--   WHEN e_unique_violation THEN
--     dbms_output.put_line('Error: Unique constraint violated. Product with ID '  v_prod_id  ' already exists.');
-- END;




-- RASSUL

-- TRIGGERS:

-- 1. CREATE OR REPLACE TRIGGER tr_set_order_weight_status
-- BEFORE INSERT ON MP2_Orders
-- FOR EACH ROW
-- DECLARE
--   v_product_weight FLOAT;
-- BEGIN
--   SELECT Prod_weight
--   INTO v_product_weight
--   FROM MP2_Products
--   WHERE Prod_id = :NEW.product_id;

--   IF v_product_weight <= 1 THEN
--     :NEW.order_weight_status := 'Underweight';
--   ELSIF v_product_weight <= 5 THEN
--     :NEW.order_weight_status := 'Normal';
--   ELSE
--     :NEW.order_weight_status := 'Overweight';
--   END IF;
-- EXCEPTION
--   WHEN NO_DATA_FOUND THEN
--     RAISE_APPLICATION_ERROR(-20001, 'Product not found for the given product_id.');
-- END;




-- PACKAGE:

-- 1. CREATE OR REPLACE PACKAGE MP2_Management AS
--   PROCEDURE RestockProduct (p_product_id IN NUMBER, p_quantity IN NUMBER);
--   PROCEDURE AddFundsToWallet (p_customer_id IN NUMBER, p_amount IN NUMBER);
-- END MP2_Management;
-- /
-- CREATE OR REPLACE PACKAGE BODY MP2_Management AS
--   PROCEDURE RestockProduct (p_product_id IN NUMBER, p_quantity IN NUMBER) IS
--   BEGIN
--     UPDATE MP2_Products
--     SET Prod_in_stock = Prod_in_stock + p_quantity
--     WHERE Prod_id = p_product_id;

--     DBMS_OUTPUT.PUT_LINE('Product ' || p_product_id || ' restocked with ' || p_quantity || ' units.');
--   EXCEPTION
--     WHEN OTHERS THEN
--       DBMS_OUTPUT.PUT_LINE('Error occurred while restocking: ' || SQLERRM);
--   END RestockProduct;

--   PROCEDURE AddFundsToWallet (p_customer_id IN NUMBER, p_amount IN NUMBER) IS
--   BEGIN
--     UPDATE MP2_Customers
--     SET Cust_Wallet = Cust_Wallet + p_amount
--     WHERE Cust_ID = p_customer_id;

--     DBMS_OUTPUT.PUT_LINE('Customer ' || p_customer_id || ' wallet updated with ' || p_amount || ' amount.');
--   EXCEPTION
--     WHEN OTHERS THEN
--       DBMS_OUTPUT.PUT_LINE('Error occurred while adding funds to wallet: ' || SQLERRM);
--   END AddFundsToWallet;

-- END MP2_Management;
-- /





-- RECORD: 



-- 1. DECLARE
--   TYPE Customer_Order_Record IS RECORD (
--     customer_id       MP2_Customers.Cust_ID%TYPE,
--     customer_name     MP2_Customers.Cust_Name%TYPE,
--     order_count       NUMBER
--   );

--   TYPE Customer_Order_Table IS TABLE OF Customer_Order_Record INDEX BY PLS_INTEGER;
--   v_customer_order_list Customer_Order_Table;

-- BEGIN
--   DECLARE
--     CURSOR c_customer_order IS
--       SELECT C.Cust_ID, C.Cust_Name, COUNT(O.Order_ID) as Order_Count
--       FROM MP2_Customers C
--       LEFT JOIN MP2_Orders O ON C.Cust_ID = O.Customer_ID
--       GROUP BY C.Cust_ID, C.Cust_Name;
      
--     v_index PLS_INTEGER := 1;
--   BEGIN
--     FOR rec IN c_customer_order LOOP
--       v_customer_order_list(v_index).customer_id := rec.Cust_ID;
--       v_customer_order_list(v_index).customer_name := rec.Cust_Name;
--       v_customer_order_list(v_index).order_count := rec.Order_Count;
--       v_index := v_index + 1;
--     END LOOP;

--     -- Display customer order counts
--     FOR i IN 1..v_customer_order_list.COUNT LOOP
--       DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_customer_order_list(i).customer_id || ', Customer Name: ' || v_customer_order_list(i).customer_name || ', Order Count: ' || v_customer_order_list(i).order_count);
--     END LOOP;
--   END;
-- END;
-- /



-- 2. DECLARE
--   TYPE Product_Discount_Record IS RECORD (
--     product_id          MP2_Products.Prod_ID%TYPE,
--     product_name        MP2_Products.Prod_Name%TYPE,
--     discount_id         MP2_Discount.Discounts_ID%TYPE,
--     discount_event      MP2_Discount.Discount_event%TYPE,
--     discount_start_day  MP2_Discount.Discount_start_day%TYPE,
--     discount_duration   MP2_Discount.Discount_duration%TYPE
--   );

--   v_product_discount_details Product_Discount_Record;

-- BEGIN
--   SELECT P.Prod_ID, P.Prod_Name, D.Discounts_ID, D.Discount_event, D.Discount_start_day, D.Discount_duration
--   INTO v_product_discount_details
--   FROM MP2_Products P
--   LEFT JOIN MP2_Discount D ON P.Prod_ID = D.Product_id
--   WHERE P.Prod_ID = 1; -- Replace this with the product ID you want to check

--   DBMS_OUTPUT.PUT_LINE('Product ID: ' || v_product_discount_details.product_id);
--   DBMS_OUTPUT.PUT_LINE('Product Name: ' || v_product_discount_details.product_name);
--   IF v_product_discount_details.discount_id IS NOT NULL THEN
--     DBMS_OUTPUT.PUT_LINE('Discount ID: ' || v_product_discount_details.discount_id);
--     DBMS_OUTPUT.PUT_LINE('Discount Event: ' || v_product_discount_details.discount_event);
--     DBMS_OUTPUT.PUT_LINE('Discount Start Day: ' || TO_CHAR(v_product_discount_details.discount_start_day, 'DD-MON-YYYY'));
--     DBMS_OUTPUT.PUT_LINE('Discount Duration: ' || v_product_discount_details.discount_duration || ' days');
--   ELSE
--     DBMS_OUTPUT.PUT_LINE('No discount information found for this product.');
--   END IF;
  
-- EXCEPTION
--   WHEN NO_DATA_FOUND THEN
--     DBMS_OUTPUT.PUT_LINE('No product found with the given ID.');
--   WHEN OTHERS THEN
--     DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
-- END;
-- /



