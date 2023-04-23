
Abylay 

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
