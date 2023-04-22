-- Procedure which does group by information
-- CREATE OR REPLACE PROCEDURE group_by_info AS
--   category_name MP2_Products_category.prod_cat_category%TYPE;
--   product_count NUMBER;
-- BEGIN
--   SELECT pc.prod_cat_category, COUNT(p.prod_id)
--   INTO category_name, product_count
--   FROM MP2_Products p
--   JOIN MP2_Products_category pc ON p.prod_category = pc.prod_cat_id
--   GROUP BY pc.prod_cat_category;
--   DBMS_OUTPUT.PUT_LINE('Category Name: ' || category_name || ' | Number of Products: ' || product_count);
-- END;

-- BEGIN
--     group_by_info;
-- END;


-- Function which counts the number of records
-- CREATE OR REPLACE FUNCTION count_records RETURN NUMBER AS
--   num_records NUMBER;
-- BEGIN
--   SELECT COUNT(*) INTO num_records FROM MP2_Customers;
--   RETURN num_records;
-- END;

-- BEGIN
--     DBMS_OUTPUT.PUT_LINE(count_records);
-- END;


-- Procedure which uses SQL%ROWCOUNT to determine the number of rows affected
-- CREATE OR REPLACE PROCEDURE update_employee_salary(emp_id IN NUMBER, emp_new_salary IN NUMBER) AS
-- BEGIN
--   UPDATE MP2_EMPLOYEES SET salary = emp_new_salary WHERE Employee_id = emp_id;
--   DBMS_OUTPUT.PUT_LINE('Number of rows affected: ' || SQL%ROWCOUNT);
-- END;

-- BEGIN
--   update_employee_salary(2, 5000);
-- END;


-- Add user-defined exception which disallows to enter title of item (e.g. book) to be less than 5 characters
-- CREATE OR REPLACE PROCEDURE MP2_Insert_Product(
--   p_Prod_Name IN VARCHAR2,
--   p_Prod_Category IN NUMBER,
--   p_Prod_Weight IN FLOAT,
--   p_Prod_Description IN VARCHAR2,
--   p_Prod_Price IN NUMBER,
--   p_Prod_In_Stock IN NUMBER,
--   p_Prod_Status IN NUMBER
-- )
-- IS
--   Prod_Title_Too_Short EXCEPTION;
--   Prod_Description_Too_Short EXCEPTION;
-- BEGIN
--   IF LENGTH(p_Prod_Name) < 5 THEN
--     RAISE Prod_Title_Too_Short;
--   ELSIF LENGTH(p_Prod_Description) < 100 THEN
--     RAISE Prod_Description_Too_Short;
--   ELSE
--     INSERT INTO MP2_Products (
--       Prod_id,
--       Prod_name,
--       Prod_Category,
--       Prod_weight,
--       Prod_description,
--       Prod_price,
--       Prod_in_stock,
--       Prod_status
--     ) VALUES (
--       NULL,
--       p_Prod_Name,
--       p_Prod_Category,
--       p_Prod_Weight,
--       p_Prod_Description,
--       p_Prod_Price,
--       p_Prod_In_Stock,
--       p_Prod_Status
--     );
--   END IF;
-- EXCEPTION
--   WHEN Prod_Title_Too_Short THEN
--     DBMS_OUTPUT.PUT_LINE('Product title must be at least 5 characters long.');
--   WHEN Prod_Description_Too_Short THEN
--     DBMS_OUTPUT.PUT_LINE('Product description must be at least 100 characters long.');
-- END;


-- Create a trigger before insert on any entity which will show the current number of rows in the table
-- CREATE OR REPLACE TRIGGER show_row_num
-- BEFORE INSERT ON MP2_EMPLOYEES
-- DECLARE
--   num_rows NUMBER;
-- BEGIN
--   SELECT COUNT(*) INTO num_rows FROM MP2_EMPLOYEES;
--   DBMS_OUTPUT.PUT_LINE('Current number of rows in EMPLOYEES table: ' || num_rows);
-- END;

-- INSERT INTO MP2_EMPLOYEES (EMPLOYEE_ID, Name, Surname, Age, Phone, Address, Email, Salary) VALUES (8, 'John', 'Doe', 35, '555-555-5555', '123 Main St', 'johndoe@example.com', 15000);

-- SELECT * FROM MP2_EMPLOYEES
