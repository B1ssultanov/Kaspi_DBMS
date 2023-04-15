-- VIEWS

-- CREATE VIEW PRODUCT_CATEGORY_VIEW AS 
-- SELECT * FROM MP2_PRODUCTS P, MP2_PRODUCTS_CATEGORY PC WHERE PC.prod_cat_id = P.prod_category

-- CREATE VIEW PRODUCTS_DETAIL_VIEW AS
-- SELECT PR.Prod_id,PR.Prod_name,PR.Prod_Category ,PR.Prod_weight,PR.Prod_description ,PR.Prod_price ,PR.Prod_in_stock,PR.Prod_status,D.Discounts_id,D.Discount_event ,D.Discount_start_day,D.Discount_duration,V.Vendors_id,V.Vendor_Name,V.Vendor_SupportStatus,V.Phone_Number,R.Review_id,R.Cust_id,R.Review_time,R.Review_desc,PH.Photo_id,PH.Photo_url
-- FROM MP2_PHOTOS PH, MP2_DISCOUNT D, MP2_VENDORS V, MP2_REVIEW R, MP2_PRODUCTS PR 
-- WHERE PR.prod_id = PH.product_id AND PR.prod_id = D.product_id AND PR.prod_id = V.product_id AND PR.prod_id = R.prod_id





-- TRIGGERS

-- CREATE OR REPLACE TRIGGER EMPLOYEES_AGE_CHECK
-- BEFORE INSERT ON MP2_Employees
-- FOR EACH ROW
-- BEGIN
--     IF :NEW.AGE < 18 THEN
--         RAISE_APPLICATION_ERROR(-20001, 'You need to be 18+ for getting to this job');
--     END IF;
-- END;





-- COLLECTION
-- NEED TO WORK BUT DON'T

-- create or replace TRIGGER check_review_desc
-- BEFORE INSERT ON MP2_REVIEW
-- FOR EACH ROW
-- DECLARE
--     TYPE arr IS TABLE OF MP2_REVIEW.REVIEW_DESC%TYPE;
--     bad_words arr;
-- BEGIN
--     bad_words := ('shit', 'awful', 'govno');
--     FOR i IN 1..bad_words.count LOOP
--         IF (LOWER(:NEW.review_desc) LIKE '%' || bad_words(i) || '%') THEN
--             raise_application_error(-20001, 'Cannot insert review with inappropriate language.');
--         END IF;
--     END LOOP;
-- END;

-- DROP TRIGGER check_review_desc





-- EXCEPTION

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





-- PROCEDURE

-- CREATE OR REPlACE PROCEDURE product_in_stock(
--     id_product IN NUMBER,
--     is_in_stock OUT NUMBER
-- ) AS BEGIN
--     SELECT prod_in_stock INTO is_in_stock FROM MP2_PRODUCTS WHERE id_product = prod_id;
-- END;





-- FUNCTION

-- CREATE OR REPLACE FUNCTION my_ship_status(
--     id_ship NUMBER
-- ) RETURN MP2_SHIPS.SHIP_STATUS%TYPE AS res MP2_SHIPS.SHIP_STATUS%TYPE := 'none';
-- BEGIN
--     SELECT ship_status INTO res FROM MP2_SHIPS WHERE id_ship = ship_id;
-- END;





-- CURSOR
-- DECLARE
--     CURSOR Customer_orders (c_id IN MP2_CUSTOMERS.CUST_ID%TYPE) IS
--         SELECT C.CUST_NAME, P.PROD_NAME 
--         FROM MP2_ORDERS O, MP2_PRODUCTS P, MP2_CUSTOMERS C 
--         WHERE c_id = O.CUSTOMER_ID AND O.PRODUCT_ID = P.PROD_ID;
--     customer_name MP2_CUSTOMERS.CUST_NAME%TYPE;
--     product_name  MP2_PRODUCTS.PROD_NAME%TYPE;
-- BEGIN
--     OPEN Customer_orders(4);
--     FETCH Customer_orders INTO customer_name, product_name;
--     DBMS_OUTPUT.PUT_LINE(customer_name || ' ordered: ' || product_name);
--     CLOSE Customer_orders;
-- END;





-- RECORDS 
-- No examples

SELECT * FROM MP2_ORDERS
SELECT * FROM MP2_PRODUCTS
SELECT * FROM MP2_CUSTOMERS