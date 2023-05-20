Mongo Db 
1 в промежутке времени у заказшика показывает сколько стоят вешь которую он покупает
db.MP2_ORDERS.aggregate([
  {
    $match: {
      CUSTOMER_ID: 1,
      ORDERS_DATE: {
    		$gte: ISODate("2023-05-01T00:00:00Z"),
    		$lte: ISODate("2023-08-31T23:59:59Z")
  	}
    }
  },
  {
    $lookup: {
      from: "MP2_PRODUCTS",
      localField: "PRODUCT_ID",
      foreignField: "PROD_ID",
      as: "product_info"
    }
  },
  {
    $group: {
      _id: "$CUSTOMER_ID",
      average_price: { $avg: "$ORDER_PRICE" },
      products: { $push: {id:"$product_info.PROD_ID",name:"$product_info.PROD_NAME"} }
    }
  }
])


2
выводит по заказшику все его заказы и название берет с другой коллекции
db.MP2_ORDERS.aggregate([
  {
    $match: {
      CUSTOMER_ID: 1
    }
  },
  {
    $lookup: {
      from: "MP2_PRODUCTS",
      localField: "PRODUCT_ID",
      foreignField: "PROD_ID",
      as: "product_info"
    }
  },
  {
    $group: {
      _id: "$CUSTOMER_ID",
      products: { $push: {id:"$product_info.PROD_ID",order_id:"$ORDER_ID",name:"$product_info.PROD_NAME",date:"$ORDERS_DATE"} }
    }
  }
])


3
если продукты с браком их отзывают выводит имя и место доставки 3 колектион колданады
db.MP2_ORDERS.aggregate([
  {
    $match: {
      PRODUCT_ID: 1
    }
  },
  {
    $lookup: {
      from: "MP2_SHIPS",
      localField: "ORDER_ID",
      foreignField: "SHIP_ORDER_ID",
      as: "address"
    }
  },
  {
    $lookup: {
      from: "MP2_PRODUCTS",
      localField: "PRODUCT_ID",
      foreignField: "PROD_ID",
      as: "prod"
    }
  },
  {
    $unwind: "$address"
  },
  {
    $unwind: "$prod"
  },
  {
    $project: {
      _id: 0,
      ShipInfo: "$address",
      NAMEofPRODUCT:"$prod.PROD_NAME",
      Descryption:"$prod.PROD_DESCRIPTION"
    }
  }
])



1.1CREATE OR REPLACE PROCEDURE MP2_GroupByCategory
IS
BEGIN
  FOR rec IN (SELECT c.prod_cat_category, COUNT(*) AS total_products, AVG(p.prod_price) AS avg_price
              FROM MP2_Products p
              JOIN MP2_Products_category c ON p.prod_category = c.prod_cat_id
              GROUP BY c.prod_cat_category)
  LOOP
    DBMS_OUTPUT.PUT_LINE(rec.prod_cat_category || ' - Total Products: ' || rec.total_products || ', Avg. Price: ' || rec.avg_price);
  END LOOP;
END;
BEGIN
  MP2_GroupByCategory;
END;





1.1CREATE OR REPLACE PROCEDURE MP2_Insert_Product(
  p_Prod_Name IN VARCHAR2,
  p_Prod_Category IN NUMBER,
  p_Prod_Weight IN FLOAT,
  p_Prod_Description IN VARCHAR2,
  p_Prod_Price IN NUMBER,
  p_Prod_In_Stock IN NUMBER,
  p_Prod_Status IN NUMBER
)
IS
  Prod_Title_Too_Short EXCEPTION;
  Prod_Description_Too_Short EXCEPTION;
BEGIN
  IF LENGTH(p_Prod_Name) < 5 THEN
    RAISE Prod_Title_Too_Short;
  ELSIF LENGTH(p_Prod_Description) < 100 THEN
    RAISE Prod_Description_Too_Short;
  ELSE
    INSERT INTO MP2_Products (
      Prod_id,
      Prod_name,
      Prod_Category,
      Prod_weight,
      Prod_description,
      Prod_price,
      Prod_in_stock,
      Prod_status
    ) VALUES (
      NULL,
      p_Prod_Name,
      p_Prod_Category,
      p_Prod_Weight,
      p_Prod_Description,
      p_Prod_Price,
      p_Prod_In_Stock,
      p_Prod_Status
    );
  END IF;
EXCEPTION
  WHEN Prod_Title_Too_Short THEN
    DBMS_OUTPUT.PUT_LINE('Product title must be at least 5 characters long.');
  WHEN Prod_Description_Too_Short THEN
    DBMS_OUTPUT.PUT_LINE('Product description must be at least 100 characters long.');
END;


2.1Here's an example of a complex SQL function that counts the number of records in a table:

sql
Copy code
CREATE FUNCTION count_records(table_name IN VARCHAR2) RETURN NUMBER IS
  num_records NUMBER;
BEGIN
  EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM ' || table_name INTO num_records;
  RETURN num_records;
END;
This function takes a table name as input and returns the number of records in that table. It does this by using dynamic SQL to execute a COUNT(*) query on the specified table and storing the result in a variable, which is then returned by the function.

You can call this function by passing the name of the table you want to count the records for:

sql
Copy code
SELECT count_records('MP2_Products') AS num_products FROM dual;
This will return a single row with the number of records in the MP2_Products table under the "num_products" column.



This that work and i writed code on pl sql

1.1(2) Function 
CREATE OR REPLACE FUNCTION MP2_Insert_Product(
  p_Prod_Name IN VARCHAR2,
  p_Prod_Category IN NUMBER,
  p_Prod_Weight IN FLOAT,
  p_Prod_Description IN VARCHAR2,
  p_Prod_Price IN NUMBER,
  p_Prod_In_Stock IN NUMBER,
  p_Prod_Status IN NUMBER
) RETURN BOOLEAN
IS
  Prod_Title_Too_Short EXCEPTION;
  Prod_Description_Too_Short EXCEPTION;
BEGIN
  IF LENGTH(p_Prod_Name) < 5 THEN
    RAISE Prod_Title_Too_Short;
  ELSIF LENGTH(p_Prod_Description) < 100 THEN
    RAISE Prod_Description_Too_Short;
  ELSE
    INSERT INTO MP2_Products (
      Prod_id,
      Prod_name,
      Prod_Category,
      Prod_weight,
      Prod_description,
      Prod_price,
      Prod_in_stock,
      Prod_status
    ) VALUES (
      NULL,
      p_Prod_Name,
      p_Prod_Category,
      p_Prod_Weight,
      p_Prod_Description,
      p_Prod_Price,
      p_Prod_In_Stock,
      p_Prod_Status
    );
    RETURN TRUE;
  END IF;
EXCEPTION
  WHEN Prod_Title_Too_Short THEN
    DBMS_OUTPUT.PUT_LINE('Product title must be at least 5 characters long.');
    RETURN FALSE;
  WHEN Prod_Description_Too_Short THEN
    DBMS_OUTPUT.PUT_LINE('Product description must be at least 100 characters long.');
    RETURN FALSE;
END;
 

3.Eception
DECLARE
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

    DBMS_OUTPUT.PUT_LINE('Product ID: '  v_product_id  ', Product Name: '  v_product_name  ', Category: ' || v_product_category);
  END LOOP;

  CLOSE product_categories_cur;
END;

4)
BEGIN
  DECLARE
    total_sales NUMBER;
    sales_date DATE := TO_DATE('2023-04-23', 'YYYY-MM-DD');
  BEGIN
    SELECT SUM(Prod_price) INTO total_sales FROM MP2_Orders WHERE Order_date = sales_date;
    IF total_sales IS NULL THEN
      RAISE_APPLICATION_ERROR(-20001, 'No sales found for the given date.');
    ELSE
      DBMS_OUTPUT.PUT_LINE('Total sales on ' || sales_date || ' is ' || total_sales);
    END IF;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('No sales found for the given date.');
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('An error occurred while processing the request: ' || SQLERRM);
  END;
END;

In this query, we are trying to retrieve the total sales for a given date from the MP2_Orders table. 
If no sales are found for the given date, we raise a custom exception with the message 'No sales 
found for the given date.' Otherwise, we display the total sales using the DBMS_OUTPUT.PUT_LINE function.

We also have exception handling in case there are any other errors while processing the request. 
If an error occurs, we display the error message using SQLERRM.
5).CREATE OR REPLACE FUNCTION Get_Avg_Price_By_Category (p_category IN MP2_Products.Prod_Category%TYPE)
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

