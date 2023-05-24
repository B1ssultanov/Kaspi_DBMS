MONGODB_QUERIES: 

1. Рассчитывет общий доход каждого поставщика за определенный период времени: Этот запрос можно использовать для определения  самых прибыльных поставщиков, что может быть полезно для принятия решений в области закупок.

db.MP2_ORDERS.aggregate([
  { $match: { ORDERS_DATE: { $gte: ISODate("2023-01-01T00:00:00Z"), $lte: ISODate("2023-12-31T23:59:59Z") } } },
  { $lookup: { from: "MP2_VENDORS", localField: "PRODUCT_ID", foreignField: "PRODUCT_ID", as: "vendor_info" } },
  { $unwind: "$vendor_info" },
  { $group: { _id: "$vendor_info.VENDOR_NAME", totalRevenue: { $sum: "$ORDER_PRICE" } } },
  { $sort: { totalRevenue: -1 } }
]);


2. Топ продуктов, приносящих наибольшую прибыль: Удобство использования этого запроса заключается в том, чтобы определить самые продаваемые или самые прибыльные продукты, чтобы можно было больше сосредоточиться на продвижении этих продуктов.

db.MP2_ORDERS.aggregate([
    {
        $lookup: {
            from: "MP2_PRODUCTS",
            localField: "PRODUCT_ID",
            foreignField: "PROD_ID",
            as: "product_info"
        }
    },
    {
        $unwind: "$product_info"
    },
    {
        $group: {
            _id: "$PRODUCT_ID",
            totalRevenue: { $sum: "$ORDER_PRICE" },
            productName: { $first: "$product_info.PROD_NAME" }
        }
    },
    {
        $sort: { totalRevenue: -1 }
    }
])


3. Расчет ценности клиента: Это прогноз чистой прибыли, относящейся ко всем будущим отношениям с клиентом. Это важно для маркетинговых решений, например, сколько денег вы можете позволить себе для привлечения нового клиента.


db.MP2_ORDERS.aggregate([
    {
        $group: {
            _id: "$CUSTOMER_ID",
            totalRevenue: { $sum: "$ORDER_PRICE" }
        }
    },
    {
        $lookup: {
            from: "MP2_CUSTOMERS",
            localField: "_id",
            foreignField: "CUST_ID",
            as: "customer_info"
        }
    },
    {
        $unwind: "$customer_info"
    },
    {
        $project: {
            _id: 1,
            customerName: "$customer_info.CUST_NAME",
            customerEmail: "$customer_info.CUST_EMAIL",
            totalRevenue: 1
        }
    },
    {
        $sort: { totalRevenue: -1 }
    }
])


4. Прогнозирование запасов: Это имеет решающее значение для управления запасами, поскольку исчерпание запасов означает потерю возможности продаж, а слишком много запасов приводит к увеличению затрат на хранение.


 db.MP2_ORDERS.aggregate([
    {
        $group: {
            _id: "$PRODUCT_ID",
            totalSold: { $sum: "$ORDER_QUANTITY" },
            firstSaleDate: { $min: "$ORDERS_DATE" },
            lastSaleDate: { $max: "$ORDERS_DATE" }
        }
    },
    {
        $addFields: {
            salesDays: {
                $divide: [
                    { $subtract: [ "$lastSaleDate", "$firstSaleDate" ] },
                    1000 * 60 * 60 * 24
                ]
            }
        }
    },
    {
        $addFields: {
            salesPerDay: {
                $cond: [ 
                    { $eq: [ "$salesDays", 0 ] }, 
                    0, 
                    { $divide: [ "$totalSold", "$salesDays" ] } 
                ]
            }
        }
    },
    {
        $lookup: {
            from: "MP2_PRODUCTS",
            localField: "_id",
            foreignField: "PROD_ID",
            as: "product_info"
        }
    },
    {
        $unwind: "$product_info"
    },
    {
        $addFields: {
            daysUntilOutOfStock: {
                $cond: [ 
                    { $eq: [ "$salesPerDay", 0 ] }, 
                    "Enough in stock", 
                    { $divide: [ "$product_info.PROD_IN_STOCK", "$salesPerDay" ] } 
                ]
            }
        }
    },
    {
        $project: {
            _id: 1,
            salesPerDay: 1,
            currentInventory: "$product_info.PROD_IN_STOCK",
            daysUntilOutOfStock: 1
        }
    },
    {
        $sort: { daysUntilOutOfStock: 1 }
    }
])


VIEW:
db.createView(
  "MP2_Customer_Total_Orders", 
  "MP2_CUSTOMERS", 
  [ 
    {
      $lookup: {
        from: "MP2_ORDERS",
        localField: "CUST_ID",
        foreignField: "CUSTOMER_ID",
        as: "customer_orders"
      }
    },
    {
      $project: {
        CUST_ID: 1,
        CUST_NAME: 1,
        Total_Orders: { $size: "$customer_orders" }
      }
    }
  ]
)




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

1. DECLARE
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
  SET order_returned = 1 
  WHERE order_id = v_order_id;

  SELECT COUNT(*) INTO v_refund_amount FROM MP2_Customers 		 WHERE Cust_ID = v_customer_id;
  IF v_refund_amount = v_order_price THEN
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(‘Return successful, customer wallet and product stock updated’);
  ELSE
    ROLLBACK TO sp_process_return;
    DBMS_OUTPUT.PUT_LINE(‘Return failed, rollback to the savepoint’);
  END IF;

EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE(‘Error occurred, rollback: ‘ || SQLERRM);
END;
/

PROCEDURE AND PACKAGES:

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



CURSORS: 

1. DECLARE
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



VIEWS: 


1. CREATE OR REPLACE VIEW MP2_Customer_Total_Orders AS
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



COLLECTION:

1. DECLARE
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

