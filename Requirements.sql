-- (Yedyge)
-- Procedure which does group by information
-- CREATE OR REPLACE PROCEDURE group_by_info IS
--   cursor Products_info is 
--     SELECT P.prod_category, PC.Prod_cat_category, COUNT(*) AS Number_of_Products
--     FROM MP2_Products P, MP2_Products_category PC
--     WHERE P.Prod_category = PC.Prod_cat_id
--     GROUP BY P.prod_category, PC.Prod_cat_category;
-- BEGIN
--   dbms_output.put_line('Product Category | Number of Products');
--   for Product_cat in Products_info loop
--     dbms_output.put_line(Product_cat.Prod_cat_category || ' | ' || Product_cat.Number_of_Products);
--   end loop;
-- END;

-- BEGIN
--     group_by_info;
-- END;

-- (Abyl)
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

-- (Amir)
-- Procedure which uses SQL%ROWCOUNT to determine the number of rows affected
-- CREATE OR REPLACE PROCEDURE update_employee_salary(emp_id IN NUMBER, emp_new_salary IN NUMBER) AS
-- BEGIN
--   UPDATE MP2_EMPLOYEES SET salary = emp_new_salary WHERE Employee_id = emp_id;
--   DBMS_OUTPUT.PUT_LINE('Number of rows affected: '  SQL%ROWCOUNT);
-- END;

-- BEGIN
--   update_employee_salary(2, 5000);
-- END;

-- (Ramazan)
-- Add user-defined exception which disallows to enter title of item (e.g. book) to be less than 5 characters
-- CREATE OR REPLACE PROCEDURE MP2_Insert_Product( p_Prod_Name IN VARCHAR2, p_Prod_Category IN NUMBER, p_Prod_Weight IN FLOAT, p_Prod_Description IN VARCHAR2, p_Prod_Price IN NUMBER, p_Prod_In_Stock IN NUMBER, p_Prod_Status IN NUMBER)
-- IS
--   Prod_Title_Too_Short EXCEPTION;
--   Prod_Description_Too_Short EXCEPTION;
-- BEGIN
--   IF LENGTH(p_Prod_Name) < 5 THEN
--     RAISE Prod_Title_Too_Short;
--   ELSIF LENGTH(p_Prod_Description) < 100 THEN
--     RAISE Prod_Description_Too_Short;
--   ELSE
--     INSERT INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status) VALUES (NULL, p_Prod_Name, p_Prod_Category, p_Prod_Weight, p_Prod_Description, p_Prod_Price, p_Prod_In_Stock, p_Prod_Status);
--   END IF;
-- EXCEPTION
--   WHEN Prod_Title_Too_Short THEN
--     DBMS_OUTPUT.PUT_LINE('Product title must be at least 5 characters long.');
--   WHEN Prod_Description_Too_Short THEN
--     DBMS_OUTPUT.PUT_LINE('Product description must be at least 100 characters long.');
-- END;

-- (Rassul)
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

-- DELETE FROM MP2_EMPLOYEES WHERE EMPLOYEE_ID = 8;
-- SELECT * FROM MP2_EMPLOYEES