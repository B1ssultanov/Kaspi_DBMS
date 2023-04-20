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



2.2


