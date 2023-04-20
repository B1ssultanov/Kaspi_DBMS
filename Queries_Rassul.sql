EXCEPTIONS:

Query to update a customer’s wallet balance with an exception handler for a nonexistent customer:
1. DECLARE
  v_cust_id NUMBER := 101;
  v_wallet_amount NUMBER := 100;
  
  e_no_customer EXCEPTION;
  PRAGMA EXCEPTION_INIT(e_no_customer, -2291);
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

Query to insert a new product with an exception handler for unique constraint violation:
2. DECLARE
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
    dbms_output.put_line('Error: Unique constraint violated. Product with ID ' || v_prod_id || ' already exists.');
END;


TRIGGERS :

Trigger to maintain *order_weight_status* when a new order is inserted:
1. CREATE OR REPLACE TRIGGER tr_set_order_weight_status
BEFORE INSERT ON MP2_Orders
FOR EACH ROW
DECLARE
  v_product_weight FLOAT;
BEGIN
  SELECT Prod_weight
  INTO v_product_weight
  FROM MP2_Products
  WHERE Prod_id = :NEW.product_id;

  IF v_product_weight <= 1 THEN
    :NEW.order_weight_status := 'Underweight';
  ELSIF v_product_weight <= 5 THEN
    :NEW.order_weight_status := 'Normal';
  ELSE
    :NEW.order_weight_status := 'Overweight';
  END IF;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20001, 'Product not found for the given product_id.');
END;

Trigger to update *Prod_in_stock* after an order is inserted:
2. CREATE OR REPLACE TRIGGER tr_update_product_stock
AFTER INSERT ON MP2_Orders
FOR EACH ROW
DECLARE
  v_in_stock NUMBER;
BEGIN
  SELECT Prod_in_stock
  INTO v_in_stock
  FROM MP2_Products
  WHERE Prod_id = :NEW.product_id;

  IF v_in_stock > 0 THEN
    UPDATE MP2_Products
    SET Prod_in_stock = v_in_stock - 1
    WHERE Prod_id = :NEW.product_id;
  ELSE
    RAISE_APPLICATION_ERROR(-20002, 'Product is out of stock.');
  END IF;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20001, 'Product not found for the given product_id.');
END;


TRANSACTIONS:

Purchase a product by deducting the wallet balance of a customer and updating the product stock:
1. DECLARE
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



2. DECLARE
  v_order_id NUMBER := 1;
  v_product_id NUMBER;
  v_customer_id NUMBER;
  v_refund_amount NUMBER;
  v_order_price NUMBER;

BEGIN
  SAVEPOINT sp_process_return;

  SELECT product_id, customer_id, order_price
  INTO v_product_id, v_customer_id, v_order_price
  FROM MP2_Orders
  WHERE order_id = v_order_id;

  UPDATE MP2_Customers
  SET Cust_Wallet = Cust_Wallet + v_order_price
  WHERE Cust_ID = v_customer_id;

  UPDATE MP2_Products
  SET Prod_in_stock = Prod_in_stock + 1
  WHERE Prod_id = v_product_id;

  UPDATE MP2_Orders
  SET order_weight_status = 'Returned'
  WHERE order_id = v_order_id;

  SELECT COUNT(*) INTO v_refund_amount FROM MP2_Customers WHERE Cust_ID = v_customer_id;

  IF v_refund_amount = v_order_price THEN
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Return successful, customer wallet and product stock updated');
  ELSE
    ROLLBACK TO sp_process_return;
    DBMS_OUTPUT.PUT_LINE('Return failed, rollback to the savepoint');
  END IF;

EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error occurred, rollback: ' || SQLERRM);
END;
/


This transaction will refund the customer’s wallet, increase the product stock, and update the order status to ‘Returned’. 
3. DECLARE
  v_order_id NUMBER := 1;
  v_product_id NUMBER;
  v_customer_id NUMBER;
  v_refund_amount NUMBER;
  v_order_price NUMBER;

BEGIN
   SAVEPOINT sp_process_return;

  SELECT product_id, customer_id, order_price
  INTO v_product_id, v_customer_id, v_order_price
  FROM MP2_Orders
  WHERE order_id = v_order_id;

  UPDATE MP2_Customers
  SET Cust_Wallet = Cust_Wallet + v_order_price
  WHERE Cust_ID = v_customer_id;

  UPDATE MP2_Products
  SET Prod_in_stock = Prod_in_stock + 1
  WHERE Prod_id = v_product_id;

   UPDATE MP2_Orders
  SET order_weight_status = 'Returned'
  WHERE order_id = v_order_id;

    SELECT COUNT(*) INTO v_refund_amount FROM MP2_Customers WHERE Cust_ID = v_customer_id;

  IF v_refund_amount = v_order_price THEN
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Return successful, customer wallet and product stock updated');
  ELSE
    ROLLBACK TO sp_process_return;
    DBMS_OUTPUT.PUT_LINE('Return failed, rollback to the savepoint');
  END IF;

EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error occurred, rollback: ' || SQLERRM);
END;
/


This PL/SQL procedure *purchase_product_for_all_customers* is designed to simulate the purchase of a specific product by all customers. 
MORE AUTOMATIC WITH PROCEDURE:
1. CREATE OR REPLACE PROCEDURE purchase_product_for_all_customers(p_product_id NUMBER, p_purchase_amount NUMBER)
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


This PL/SQL code defines a package named *MP2_HR* which contains two procedures: *ManageProductDiscount* and *AdjustEmployeeSalary*.
PACKAGES WITH PROCEDURES:
1. CREATE OR REPLACE PACKAGE MP2_HR AS
  PROCEDURE ManageProductDiscount (p_product_id IN NUMBER, p_discount_event IN VARCHAR2, p_discount_start_day IN DATE, p_discount_duration IN NUMBER);
  PROCEDURE AdjustEmployeeSalary (p_employee_id IN NUMBER, p_new_salary IN NUMBER);
END MP2_HR;
/

CREATE OR REPLACE PACKAGE BODY MP2_HR AS
  PROCEDURE ManageProductDiscount (p_product_id IN NUMBER, p_discount_event IN VARCHAR2, p_discount_start_day IN DATE, p_discount_duration IN NUMBER) IS
    v_discounts_id NUMBER;
  BEGIN
    SELECT Discounts_id INTO v_discounts_id FROM MP2_Discount WHERE Product_id = p_product_id;

    IF v_discounts_id IS NULL THEN
      INSERT INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration)
      VALUES (MP2_Discount_SEQ.NEXTVAL, p_discount_event, p_product_id, p_discount_start_day, p_discount_duration);
    ELSE
      UPDATE MP2_Discount
      SET Discount_event = p_discount_event,
          Discount_start_day = p_discount_start_day,
          Discount_duration = p_discount_duration
      WHERE Discounts_id = v_discounts_id;
    END IF;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Product ' || p_product_id || ' discount has been created or updated.');

  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      DBMS_OUTPUT.PUT_LINE('Error occurred while managing product discount: ' || SQLERRM);
  END ManageProductDiscount;

  PROCEDURE AdjustEmployeeSalary (p_employee_id IN NUMBER, p_new_salary IN NUMBER) IS
  BEGIN
    UPDATE MP2_Employees
    SET Salary = p_new_salary
    WHERE Employee_ID = p_employee_id;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Employee ' || p_employee_id || ' salary has been adjusted.');

  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      DBMS_OUTPUT.PUT_LINE('Error occurred while adjusting employee salary: ' || SQLERRM);
  END AdjustEmployeeSalary;

END MP2_HR;
/

WHAT WE NEED TO ADD: 
CREATE SEQUENCE MP2_Discount_SEQ
  START WITH 1
  INCREMENT BY 1
  CACHE 20;


This PL/SQL code defines a package named *MP2_Management* which contains two procedures: *RestockProduct* and *AddFundsToWallet*.
2. CREATE OR REPLACE PACKAGE MP2_Management AS
  PROCEDURE RestockProduct (p_product_id IN NUMBER, p_quantity IN NUMBER);
  PROCEDURE AddFundsToWallet (p_customer_id IN NUMBER, p_amount IN NUMBER);
END MP2_Management;
/
CREATE OR REPLACE PACKAGE BODY MP2_Management AS
  PROCEDURE RestockProduct (p_product_id IN NUMBER, p_quantity IN NUMBER) IS
  BEGIN
    UPDATE MP2_Products
    SET Prod_in_stock = Prod_in_stock + p_quantity
    WHERE Prod_id = p_product_id;

    DBMS_OUTPUT.PUT_LINE('Product ' || p_product_id || ' restocked with ' || p_quantity || ' units.');
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error occurred while restocking: ' || SQLERRM);
  END RestockProduct;

  PROCEDURE AddFundsToWallet (p_customer_id IN NUMBER, p_amount IN NUMBER) IS
  BEGIN
    UPDATE MP2_Customers
    SET Cust_Wallet = Cust_Wallet + p_amount
    WHERE Cust_ID = p_customer_id;

    DBMS_OUTPUT.PUT_LINE('Customer ' || p_customer_id || ' wallet updated with ' || p_amount || ' amount.');
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error occurred while adding funds to wallet: ' || SQLERRM);
  END AddFundsToWallet;

END MP2_Management;
/


CURSOR:

This PL/SQL block declares and uses a cursor named *product_categories_cur* to fetch data from the *MP2_Products* and *MP2_Products_category* tables.
1. DECLARE
  CURSOR product_categories_cur IS
    SELECT P.Prod_id, P.Prod_name, C.prod_cat_category
    FROM MP2_Products P
    JOIN MP2_Products_category C ON P.Prod_Category = C.Prod_cat_id;

  v_product_id NUMBER;
  v_product_name VARCHAR2(50);
  v_product_category VARCHAR2(50);
BEGIN
  OPEN product_categories_cur;

  LOOP
    FETCH product_categories_cur INTO v_product_id, v_product_name, v_product_category;
    EXIT WHEN product_categories_cur%NOTFOUND;

    DBMS_OUTPUT.PUT_LINE('Product ID: ' || v_product_id || ', Product Name: ' || v_product_name || ', Category: ' || v_product_category);
  END LOOP;

  CLOSE product_categories_cur;
END;

This PL/SQL block declares and uses a cursor named *customer_orders_cur* to fetch aggregated data related to the total order price for each customer from the *MP2_Customers* and *MP2_orders* tables.
2. DECLARE
  CURSOR customer_orders_cur IS
    SELECT C.Cust_ID, C.Cust_Name, C.Cust_Surname, SUM(O.order_price) as total_order_price
    FROM MP2_Customers C
    JOIN MP2_orders O ON C.Cust_ID = O.customer_id
    GROUP BY C.Cust_ID, C.Cust_Name, C.Cust_Surname;

  v_customer_id NUMBER;
  v_customer_name VARCHAR2(50);
  v_customer_surname VARCHAR2(50);
  v_total_order_price NUMBER(10, 2);
BEGIN
  OPEN customer_orders_cur;

  LOOP
    FETCH customer_orders_cur INTO v_customer_id, v_customer_name, v_customer_surname, v_total_order_price;
    EXIT WHEN customer_orders_cur%NOTFOUND;

    DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_customer_id || ', Name: ' || v_customer_name || ' ' || v_customer_surname || ', Total Order Price: ' || v_total_order_price);
  END LOOP;

  CLOSE customer_orders_cur;
END;


This code first creates a view named *MP2_Customer_Wallet_Total* displaying customer wallet information, and then retrieves and displays the wallet amount of a specified customer (with ID 1) using a PL/SQL block. If the customer is not found, it shows an error message.

VIEW:
1. CREATE OR REPLACE VIEW MP2_Customer_Wallet_Total AS
SELECT
  Cust_ID,
  Cust_Name,
  Cust_Email,
  Cust_Wallet
FROM
  MP2_Customers;

PL/SQL:

DECLARE
  v_cust_id NUMBER := 1;
  v_wallet_amount NUMBER;
BEGIN
  SELECT Cust_Wallet
  INTO v_wallet_amount
  FROM MP2_Customer_Wallet_Total
  WHERE Cust_ID = v_cust_id;

  DBMS_OUTPUT.PUT_LINE('Customer ' || v_cust_id || ' has a wallet amount of ' || v_wallet_amount);

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Error: Customer with ID ' || v_cust_id || ' not found in MP2_Customer_Wallet_Total view.');
END;
/


This code creates a view named *MP2_Customer_Total_Orders* that displays the total number of orders for each customer. It groups the data by customer ID and name and uses a LEFT JOIN to include customers who have no orders as well.


2. CREATE OR REPLACE VIEW MP2_Customer_Total_Orders AS
SELECT
  C.Cust_ID,
  C.Cust_Name,
  COUNT(O.Order_ID) AS Total_Orders
FROM
  MP2_Customers C
  LEFT JOIN MP2_Orders O ON C.Cust_ID = O.Customer_ID
GROUP BY
  C.Cust_ID,
  C.Cust_Name;


This code creates a PL/SQL function named *Get_Avg_Price_By_Category* that calculates the average price of products within a specified category. The function takes a single input parameter, *p_category*, and returns the average price as a NUMBER.
FUNCTIONS:
1. CREATE OR REPLACE FUNCTION Get_Avg_Price_By_Category (p_category IN MP2_Products.Prod_Category%TYPE)
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

This code creates a PL/SQL function named *Count_Customer_Orders* that calculates the total number of orders made by a specified customer. The function takes a single input parameter, *p_cust_id*, and returns the order count as a NUMBER.
2. CREATE OR REPLACE FUNCTION Count_Customer_Orders (p_cust_id IN MP2_Customers.Cust_ID%TYPE)
RETURN NUMBER
IS
  v_order_count NUMBER;
BEGIN
  SELECT COUNT(*)
  INTO v_order_count
  FROM MP2_Orders
  WHERE Customer_ID = p_cust_id;

  RETURN v_order_count;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 0;
END Count_Customer_Orders;
/


This code declares a PL/SQL anonymous block that defines a record type called *Order_Record* with three fields: order_id, customer_id, and product_id. It fetches an order with a specific Order_ID (in this case, 10) from the MP2_Orders table, stores the result in a variable named *v_order_details* of type Order_Record, and then prints the order details using DBMS_OUTPUT.PUT_LINE.





RECORDS:
1. DECLARE
  TYPE Order_Record IS RECORD (
    order_id      MP2_Orders.Order_ID%TYPE,
    customer_id   MP2_Orders.Customer_ID%TYPE,
    product_id    MP2_Orders.Product_ID%TYPE
  );

  v_order_details Order_Record;

BEGIN
  SELECT Order_ID, Customer_ID, Product_ID
  INTO v_order_details
  FROM MP2_Orders
  WHERE Order_ID = 10;

  DBMS_OUTPUT.PUT_LINE('Order ID: ' || v_order_details.order_id ||
                       ', Customer ID: ' || v_order_details.customer_id ||
                       ', Product ID: ' || v_order_details.product_id);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Order not found.');
END;
/


This PL/SQL anonymous block declares a record type called *Product_Discount_Record* with six fields to store product and discount information. The block retrieves a product’s details, along with any associated discount, and prints the data using DBMS_OUTPUT.PUT_LINE. If no discount information is found for the product, a message is displayed indicating that there is no discount information.
2. DECLARE
  TYPE Product_Discount_Record IS RECORD (
    product_id          MP2_Products.Prod_ID%TYPE,
    product_name        MP2_Products.Prod_Name%TYPE,
    discount_id         MP2_Discount.Discounts_ID%TYPE,
    discount_event      MP2_Discount.Discount_event%TYPE,
    discount_start_day  MP2_Discount.Discount_start_day%TYPE,
    discount_duration   MP2_Discount.Discount_duration%TYPE
  );

  v_product_discount_details Product_Discount_Record;

BEGIN
  SELECT P.Prod_ID, P.Prod_Name, D.Discounts_ID, D.Discount_event, D.Discount_start_day, D.Discount_duration
  INTO v_product_discount_details
  FROM MP2_Products P
  LEFT JOIN MP2_Discount D ON P.Prod_ID = D.Product_id
  WHERE P.Prod_ID = 1; -- Replace this with the product ID you want to check

  DBMS_OUTPUT.PUT_LINE('Product ID: ' || v_product_discount_details.product_id);
  DBMS_OUTPUT.PUT_LINE('Product Name: ' || v_product_discount_details.product_name);
  IF v_product_discount_details.discount_id IS NOT NULL THEN
    DBMS_OUTPUT.PUT_LINE('Discount ID: ' || v_product_discount_details.discount_id);
    DBMS_OUTPUT.PUT_LINE('Discount Event: ' || v_product_discount_details.discount_event);
    DBMS_OUTPUT.PUT_LINE('Discount Start Day: ' || TO_CHAR(v_product_discount_details.discount_start_day, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Discount Duration: ' || v_product_discount_details.discount_duration || ' days');
  ELSE
    DBMS_OUTPUT.PUT_LINE('No discount information found for this product.');
  END IF;
  
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No product found with the given ID.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/



This PL/SQL anonymous block declares a record type named *Discount_Record* and a nested table type named *Discount_Table*. It fetches and stores product and discount information from the MP2_Products and MP2_Discount tables in a table of the Discount_Record type, then iterates through the table and prints the product ID, product name, and discount event (or «No Discount Event» if there is none) using DBMS_OUTPUT.PUT_LINE.





COLLECTION:
1. DECLARE
  TYPE Discount_Record IS RECORD (
    product_id      MP2_Products.Prod_ID%TYPE,
    product_name    MP2_Products.Prod_Name%TYPE,
    discount_event  MP2_Discount.Discount_event%TYPE
  );

  TYPE Discount_Table IS TABLE OF Discount_Record INDEX BY PLS_INTEGER;
  v_discount_list Discount_Table;

BEGIN
  DECLARE
    CURSOR c_discount IS
      SELECT P.Prod_ID, P.Prod_Name, D.Discount_event
      FROM MP2_Products P
      LEFT JOIN MP2_Discount D ON P.Prod_ID = D.Product_id;
      
    v_index PLS_INTEGER := 1;
  BEGIN
    FOR rec IN c_discount LOOP
      v_discount_list(v_index).product_id := rec.Prod_ID;
      v_discount_list(v_index).product_name := rec.Prod_Name;
      v_discount_list(v_index).discount_event := rec.Discount_event;
      v_index := v_index + 1;
    END LOOP;

    -- Display discounts
    FOR i IN 1..v_discount_list.COUNT LOOP
      DBMS_OUTPUT.PUT_LINE('Product ID: ' || v_discount_list(i).product_id || ', Product Name: ' || v_discount_list(i).product_name || ', Discount Event: ' || NVL(v_discount_list(i).discount_event, 'No Discount Event'));
    END LOOP;
  END;
END;
/


This PL/SQL anonymous block declares a record type named *Customer_Order_Record* and a nested table type named *Customer_Order_Table*. It fetches and stores customer information and their order count from the MP2_Customers and MP2_Orders tables in a table of the Customer_Order_Record type, then iterates through the table and prints the customer ID, customer name, and order count using DBMS_OUTPUT.PUT_LINE.
2. DECLARE
  TYPE Customer_Order_Record IS RECORD (
    customer_id       MP2_Customers.Cust_ID%TYPE,
    customer_name     MP2_Customers.Cust_Name%TYPE,
    order_count       NUMBER
  );

  TYPE Customer_Order_Table IS TABLE OF Customer_Order_Record INDEX BY PLS_INTEGER;
  v_customer_order_list Customer_Order_Table;

BEGIN
  DECLARE
    CURSOR c_customer_order IS
      SELECT C.Cust_ID, C.Cust_Name, COUNT(O.Order_ID) as Order_Count
      FROM MP2_Customers C
      LEFT JOIN MP2_Orders O ON C.Cust_ID = O.Customer_ID
      GROUP BY C.Cust_ID, C.Cust_Name;
      
    v_index PLS_INTEGER := 1;
  BEGIN
    FOR rec IN c_customer_order LOOP
      v_customer_order_list(v_index).customer_id := rec.Cust_ID;
      v_customer_order_list(v_index).customer_name := rec.Cust_Name;
      v_customer_order_list(v_index).order_count := rec.Order_Count;
      v_index := v_index + 1;
    END LOOP;

    -- Display customer order counts
    FOR i IN 1..v_customer_order_list.COUNT LOOP
      DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_customer_order_list(i).customer_id || ', Customer Name: ' || v_customer_order_list(i).customer_name || ', Order Count: ' || v_customer_order_list(i).order_count);
    END LOOP;
  END;
END;
/

