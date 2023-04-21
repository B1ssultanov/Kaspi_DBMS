-- Rassul TRIGGER
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


-- CREATE OR REPLACE TRIGGER tr_update_product_stock
-- AFTER INSERT ON MP2_Orders
-- FOR EACH ROW
-- DECLARE
--   v_in_stock NUMBER;
-- BEGIN
--   SELECT Prod_in_stock
--   INTO v_in_stock
--   FROM MP2_Products
--   WHERE Prod_id = :NEW.product_id;

--   IF v_in_stock > 0 THEN
--     UPDATE MP2_Products
--     SET Prod_in_stock = v_in_stock - 1
--     WHERE Prod_id = :NEW.product_id;
--   ELSE
--     RAISE_APPLICATION_ERROR(-20002, 'Product is out of stock.');
--   END IF;
-- EXCEPTION
--   WHEN NO_DATA_FOUND THEN
--     RAISE_APPLICATION_ERROR(-20001, 'Product not found for the given product_id.');
-- END;


-- Rassul
-- CREATE OR REPLACE VIEW MP2_Customer_Total_Orders AS
-- SELECT
--   C.Cust_ID,
--   C.Cust_Name,
--   COUNT(O.Order_ID) AS Total_Orders
-- FROM
--   MP2_Customers C
--   LEFT JOIN MP2_Orders O ON C.Cust_ID = O.Customer_ID
-- GROUP BY
--   C.Cust_ID,
--   C.Cust_Name;


-- Rassul
-- CREATE ORREPLACE PACKAGE MP2_HR AS
--   PROCEDURE ManageProductDiscount (p_product_id IN NUMBER, p_discount_event IN VARCHAR2, p_discount_start_day IN DATE, p_discount_duration IN NUMBER);
--   PROCEDURE AdjustEmployeeSalary (p_employee_id IN NUMBER, p_new_salary IN NUMBER);
-- END MP2_HR;
-- /

-- CREATE OR REPLACE PACKAGE BODY MP2_HR AS
--   PROCEDURE ManageProductDiscount (p_product_id IN NUMBER, p_discount_event IN VARCHAR2, p_discount_start_day IN DATE, p_discount_duration IN NUMBER) IS
--     v_discounts_id NUMBER;
--   BEGIN
--     SELECT Discounts_id INTO v_discounts_id FROM MP2_Discount WHERE Product_id = p_product_id;

--     IF v_discounts_id IS NULL THEN
--       INSERT INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration)
--       VALUES (MP2_Discount_SEQ.NEXTVAL, p_discount_event, p_product_id, p_discount_start_day, p_discount_duration);
--     ELSE
--       UPDATE MP2_Discount
--       SET Discount_event = p_discount_event,
--           Discount_start_day = p_discount_start_day,
--           Discount_duration = p_discount_duration
--       WHERE Discounts_id = v_discounts_id;
--     END IF;

--     COMMIT;
--     DBMS_OUTPUT.PUT_LINE('Product ' || p_product_id || ' discount has been created or updated.');

--   EXCEPTION
--     WHEN OTHERS THEN
--       ROLLBACK;
--       DBMS_OUTPUT.PUT_LINE('Error occurred while managing product discount: ' || SQLERRM);
--   END ManageProductDiscount;

--   PROCEDURE AdjustEmployeeSalary (p_employee_id IN NUMBER, p_new_salary IN NUMBER) IS
--   BEGIN
--     UPDATE MP2_Employees
--     SET Salary = p_new_salary
--     WHERE Employee_ID = p_employee_id;

--     COMMIT;
--     DBMS_OUTPUT.PUT_LINE('Employee ' || p_employee_id || ' salary has been adjusted.');

--   EXCEPTION
--     WHEN OTHERS THEN
--       ROLLBACK;
--       DBMS_OUTPUT.PUT_LINE('Error occurred while adjusting employee salary: ' || SQLERRM);
--   END AdjustEmployeeSalary;

-- END MP2_HR;


-- Rassul
-- CREATE OR REPLACE PACKAGE MP2_Management AS
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

-- Yedyge
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


-- Rassul
--  DECLARE
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


-- Rassul
-- DECLARE
--   v_order_id NUMBER := 1;
--   v_product_id NUMBER;
--   v_customer_id NUMBER;
--   v_refund_amount NUMBER;
--   v_order_price NUMBER;

-- BEGIN
--   SAVEPOINT sp_process_return;

--   SELECT product_id, customer_id, order_price
--   INTO v_product_id, v_customer_id, v_order_price
--   FROM MP2_Orders
--   WHERE order_id = v_order_id;

--   UPDATE MP2_Customers
--   SET Cust_Wallet = Cust_Wallet + v_order_price
--   WHERE Cust_ID = v_customer_id;

--   UPDATE MP2_Products
--   SET Prod_in_stock = Prod_in_stock + 1
--   WHERE Prod_id = v_product_id;

--   UPDATE MP2_Orders
--   SET order_weight_status = 'Returned'
--   WHERE order_id = v_order_id;

--   SELECT COUNT(*) INTO v_refund_amount FROM MP2_Customers WHERE Cust_ID = v_customer_id;

--   IF v_refund_amount = v_order_price THEN
--     COMMIT;
--     DBMS_OUTPUT.PUT_LINE('Return successful, customer wallet and product stock updated');
--   ELSE
--     ROLLBACK TO sp_process_return;
--     DBMS_OUTPUT.PUT_LINE('Return failed, rollback to the savepoint');
--   END IF;

-- EXCEPTION
--   WHEN OTHERS THEN
--     ROLLBACK;
--     DBMS_OUTPUT.PUT_LINE('Error occurred, rollback: ' || SQLERRM);
-- END;



-- Yedyge
-- CREATE OR REPLACE FUNCTION my_ship_status(
--     id_ship NUMBER
-- ) RETURN MP2_SHIPS.SHIP_STATUS%TYPE AS res MP2_SHIPS.SHIP_STATUS%TYPE := 'none';
-- BEGIN
--     SELECT ship_status INTO res FROM MP2_SHIPS WHERE id_ship = ship_id;
-- END;

-- Rassul
-- DECLARE
--   v_cust_id NUMBER := 101;
--   v_wallet_amount NUMBER := 100;
--   
--   e_no_customer EXCEPTION;
--   PRAGMA EXCEPTION_INIT(e_no_customer, -2291);
-- BEGIN
--   UPDATE MP2_Customers
--   SET Cust_Wallet = Cust_Wallet + v_wallet_amount
--   WHERE Cust_ID = v_cust_id;
--   
--   IF SQL%ROWCOUNT = 0 THEN
--     RAISE e_no_customer;
--   END IF;
--   
--   COMMIT;
-- EXCEPTION
--   WHEN e_no_customer THEN
--     dbms_output.put_line('Error: Customer with ID ' || v_cust_id || ' not found.');
-- END;




-- Yedyge
-- DECLARE
--   DIS_DATE   DATE := TO_DATE('2023/04/10', 'YYYY/MM/DD');
--   DIS_DURA NUMBER := 6;
--   CUR_DATE   DATE := SYSDATE;
--   DIS_END    DATE := ADD_MONTHS(DIS_DATE, DIS_DURA);
-- BEGIN
--     IF CUR_DATE >= DIS_DATE AND CUR_DATE < DIS_END THEN
--         DBMS_OUTPUT.PUT_LINE('Discount is valid.');
--     ELSE
--         RAISE_APPLICATION_ERROR(-20002, 'Discount is not valid.');
--     END IF;
-- END;

-- Rassul
-- DECLARE
--   CURSOR product_categories_cur IS
--     SELECT P.Prod_id, P.Prod_name, C.prod_cat_category
--     FROM MP2_Products P
--     JOIN MP2_Products_category C ON P.Prod_Category = C.Prod_cat_id;

--   v_product_id NUMBER;
--   v_product_name VARCHAR2(50);
--   v_product_category VARCHAR2(50);
-- BEGIN
--   OPEN product_categories_cur;

--   LOOP
--     FETCH product_categories_cur INTO v_product_id, v_product_name, v_product_category;
--     EXIT WHEN product_categories_cur%NOTFOUND;

--     DBMS_OUTPUT.PUT_LINE('Product ID: ' || v_product_id || ', Product Name: ' || v_product_name || ', Category: ' || v_product_category);
--   END LOOP;

--   CLOSE product_categories_cur;
-- END;


-- Rassul
-- DECLARE
--   CURSOR customer_orders_cur IS
--     SELECT C.Cust_ID, C.Cust_Name, C.Cust_Surname, SUM(O.order_price) as total_order_price
--     FROM MP2_Customers C
--     JOIN MP2_orders O ON C.Cust_ID = O.customer_id
--     GROUP BY C.Cust_ID, C.Cust_Name, C.Cust_Surname;

--   v_customer_id NUMBER;
--   v_customer_name VARCHAR2(50);
--   v_customer_surname VARCHAR2(50);
--   v_total_order_price NUMBER(10, 2);
-- BEGIN
--   OPEN customer_orders_cur;

--   LOOP
--     FETCH customer_orders_cur INTO v_customer_id, v_customer_name, v_customer_surname, v_total_order_price;
--     EXIT WHEN customer_orders_cur%NOTFOUND;

--     DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_customer_id || ', Name: ' || v_customer_name || ' ' || v_customer_surname || ', Total Order Price: ' || v_total_order_price);
--   END LOOP;

--   CLOSE customer_orders_cur;
-- END;


-- Rassul
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

-- Rassul
-- DECLARE
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
--   
-- EXCEPTION
--   WHEN NO_DATA_FOUND THEN
--     DBMS_OUTPUT.PUT_LINE('No product found with the given ID.');
--   WHEN OTHERS THEN
--     DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
-- END;


-- Rassul
-- DECLARE
--   TYPE Discount_Record IS RECORD (
--     product_id      MP2_Products.Prod_ID%TYPE,
--     product_name    MP2_Products.Prod_Name%TYPE,
--     discount_event  MP2_Discount.Discount_event%TYPE
--   );

--   TYPE Discount_Table IS TABLE OF Discount_Record INDEX BY PLS_INTEGER;
--   v_discount_list Discount_Table;

-- BEGIN
--   DECLARE
--     CURSOR c_discount IS
--       SELECT P.Prod_ID, P.Prod_Name, D.Discount_event
--       FROM MP2_Products P
--       LEFT JOIN MP2_Discount D ON P.Prod_ID = D.Product_id;
--       
--     v_index PLS_INTEGER := 1;
--   BEGIN
--     FOR rec IN c_discount LOOP
--       v_discount_list(v_index).product_id := rec.Prod_ID;
--       v_discount_list(v_index).product_name := rec.Prod_Name;
--       v_discount_list(v_index).discount_event := rec.Discount_event;
--       v_index := v_index + 1;
--     END LOOP;

--     -- Display discounts
--     FOR i IN 1..v_discount_list.COUNT LOOP
--       DBMS_OUTPUT.PUT_LINE('Product ID: ' || v_discount_list(i).product_id || ', Product Name: ' || v_discount_list(i).product_name || ', Discount Event: ' || NVL(v_discount_list(i).discount_event, 'No Discount Event'));
--     END LOOP;
--   END;
-- END;

-- Rassul
-- DECLARE
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
--       
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

-- Abyl
-- BEGIN;
-- DECLARE num_orders INTEGER;
-- DECLARE num_delivered_orders INTEGER;
-- SELECT COUNT(*) INTO num_orders FROM orders WHERE customer_id = <id_покупателя> AND status IN ('новый', 'в обработке');
-- SELECT COUNT(*) INTO num_delivered_orders FROM orders o INNER JOIN ships s ON o.ship_id = s.ship_id WHERE o.customer_id = <id_покупателя> AND s.ship_status = 'доставлен';

-- IF num_orders >= <максимальное_количество_заказов> AND num_delivered_orders = 0 THEN
--     RAISE EXCEPTION 'Вы не можете размещать новые заказы, пока не получили предыдущие или пока не будет доставлен предыдущий заказ.';
-- ELSIF num_orders >= <максимальное_количество_заказов> THEN
--     RAISE EXCEPTION 'Вы не можете размещать новые заказы, пока не получили предыдущие.';
-- END IF;

-- INSERT INTO orders (customer_id, product_id, quantity, status) VALUES (<id_покупателя>, <id_товара>, <количество_товара>, 'новый');
-- COMMIT;


-- Yedyge
-- CREATE OR REPLACE TRIGGER EMPLOYEES_AGE_CHECK
-- BEFORE INSERT ON MP2_Employees
-- FOR EACH ROW
-- BEGIN
--     IF :NEW.AGE < 18 THEN
--         RAISE_APPLICATION_ERROR(-20001, 'You need to be 18+ for getting to this job');
--     END IF;
-- END;


-- Trigger     - 5
-- View        - 1
-- Package     - 2
-- Transaction - 2
-- Function    - 2
-- Exception   - 2
-- Cursor      - 2
-- Record      - 2

-- Collection+Record - 1



-- Ограничение на доступность товаров: если товар временно недоступен или закончился, база данных может генерировать исключение с сообщением "Извините, этот товар временно недоступен".	21	00:02:52		
-- Trigger который запрещает тип оплаты ‘cash’	21	00:01:05		
-- Если длина вводимого номера карточки не равна 16 ти то выводит ошибку	21	00:01:39		
-- This code first creates a view named *MP2_Customer_Wallet_Total* displaying customer wallet information, and then retrieves and displays the wallet amount of a specified customer (with ID 1) using a PL/SQL block. If the customer is not found, it shows an error message.	21	00:02:46		
-- PROCEDURE product_in_stock(id_product, is_in_stock) (YEDYGE)	21	00:01:30		
-- PROCEDURE MP2_Insert_Product (RAMAZAN)	21	00:01:55		
-- PROCEDURE MP2_GroupByCategory(Ramazan)	21	00:02:41		
-- e_unique_violation EXCEPTION; (Rassul)	21	00:02:51	

-- CURSOR Customer_orders (YEDYGE)	13	00:01:30		
-- VIEW PRODUCTS_DETAIL_VIEW (YEDYGE)	13	00:06:08		
-- FUNCTION Count_Customer_Orders	13	00:01:21		
-- v_order_details Order_Record;	13	00:03:54		

