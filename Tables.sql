-- -- Creating Products Category table

-- CREATE TABLE Products_category (
--     Prod_cat_id INT PRIMARY KEY,
--     prod_cat_category VARCHAR(50)
-- );

-- INSERT ALL
--    INTO Products_category (Prod_cat_id, prod_cat_category) VALUES (1, 'Electronics')
--    INTO Products_category (Prod_cat_id, prod_cat_category) VALUES (2, 'Clothing')
--    INTO Products_category (Prod_cat_id, prod_cat_category) VALUES (3, 'Home goods')
--    INTO Products_category (Prod_cat_id, prod_cat_category) VALUES (4, 'Beauty')
--    INTO Products_category (Prod_cat_id, prod_cat_category) VALUES (5, 'Sports')
--    INTO Products_category (Prod_cat_id, prod_cat_category) VALUES (6, 'Toys')
--    INTO Products_category (Prod_cat_id, prod_cat_category) VALUES (7, 'Furniture')
--    INTO Products_category (Prod_cat_id, prod_cat_category) VALUES (8, 'Food')
--    INTO Products_category (Prod_cat_id, prod_cat_category) VALUES (9, 'Books')
--    INTO Products_category (Prod_cat_id, prod_cat_category) VALUES (10, 'Jewelry')
--    INTO Products_category (Prod_cat_id, prod_cat_category) VALUES (11, 'Automotive')
--    INTO Products_category (Prod_cat_id, prod_cat_category) VALUES (12, 'Music')
--    INTO Products_category (Prod_cat_id, prod_cat_category) VALUES (13, 'Movies')
--    INTO Products_category (Prod_cat_id, prod_cat_category) VALUES (14, 'Pet supplies')
--    INTO Products_category (Prod_cat_id, prod_cat_category) VALUES (15, 'Office supplies')
--    INTO Products_category (Prod_cat_id, prod_cat_category) VALUES (16, 'Tools')
--    INTO Products_category (Prod_cat_id, prod_cat_category) VALUES (17, 'Health')
--    INTO Products_category (Prod_cat_id, prod_cat_category) VALUES (18, 'Baby')
--    INTO Products_category (Prod_cat_id, prod_cat_category) VALUES (19, 'Outdoor')
--    INTO Products_category (Prod_cat_id, prod_cat_category) VALUES (20, 'Shoes')
--    INTO Products_category (Prod_cat_id, prod_cat_category) VALUES (21, 'Industrial')
--    INTO Products_category (Prod_cat_id, prod_cat_category) VALUES (22, 'Grocery')
--    INTO Products_category (Prod_cat_id, prod_cat_category) VALUES (23, 'Software')
--    INTO Products_category (Prod_cat_id, prod_cat_category) VALUES (24, 'Cameras')
--    INTO Products_category (Prod_cat_id, prod_cat_category) VALUES (25, 'Musical instruments')
--    INTO Products_category (Prod_cat_id, prod_cat_category) VALUES (26, 'Arts and crafts')
--    INTO Products_category (Prod_cat_id, prod_cat_category) VALUES (27, 'Cell phones')
--    INTO Products_category (Prod_cat_id, prod_cat_category) VALUES (28, 'Watches')
--    INTO Products_category (Prod_cat_id, prod_cat_category) VALUES (29, 'Luggage')
--    INTO Products_category (Prod_cat_id, prod_cat_category) VALUES (30, 'Garden')
-- SELECT 1 FROM dual;













-- -- Creating Products Table

-- CREATE TABLE MP2_Products (
--   Prod_id NUMBER(10) PRIMARY KEY,
--   Prod_name VARCHAR(50),
--   Prod_Category NUMBER(10) REFERENCES MP2_Products_category(Prod_cat_id),
--   Prod_weight FLOAT,
--   Prod_description VARCHAR(4000),
--   Prod_price NUMBER(10),
--   Prod_in_stock NUMBER(10),
--   Prod_status NUMBER(1,0)
-- );

-- INSERT ALL
--     INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status) VALUES (1, 'Apple iPhone 13 Pro', 1, 0.2, 'The latest iPhone with Pro features', 999, 100, 1)
--     INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status) VALUES (2, 'Nike Air Max 90', 2, 0.5, 'Classic sneakers for casual wear', 129, 50, 1)
--     INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status) VALUES (3, 'KitchenAid Stand Mixer', 3, 10, 'Powerful mixer for baking and cooking', 399, 20, 1)
--     INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status) VALUES (4, 'Maybelline Superstay Matte Ink Lipstick', 4, 0.02, 'Long-lasting liquid lipstick in various shades', 9, 200, 1)
--     INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status) VALUES (5, 'Wilson NFL Official Football', 5, 1, 'Official football for games and practice', 25, 30, 1)
--     INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status) VALUES (6, 'LEGO Classic Creative Bricks Set', 6, 2, 'Large set of bricks for building various creations', 59, 10, 1)
--     INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status) VALUES (7, 'IKEA Billy Bookcase', 7, 30, 'Affordable and versatile bookcase for home or office', 69, 5, 1)
--     INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status) VALUES (8, 'Ben & Jerrys Ice Cream Pint', 8, 0.5, 'Various flavors of delicious ice cream', 5, 100, 1)
--     INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status) VALUES (9, 'Harry Potter and the Philosophers Stone', 9, 1, 'The first book in the Harry Potter series', 12, 50, 1)
--     INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status) VALUES (10, '14k Gold Stud Earrings', 10, 0.02, 'Classic and timeless earrings for any occasion', 99, 10, 1)
--     INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status) VALUES (11, 'Michelin Defender T+H All-Season Tire', 11, 20, 'High-performance tire for cars and SUVs', 149, 40, 1)
--     INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status) VALUES (12, 'Sony PlayStation 5 Console', 12, 4.5, 'The latest gaming console from Sony', 499, 10, 1)
--     INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status) VALUES (13, 'Sennheiser HD 650 Headphones', 13, 0.26, 'High-quality headphones for audiophiles', 399, 15, 1)
--     INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status) VALUES (14, 'Polaroid Originals OneStep 2 Camera', 14, 0.61, 'Instant film camera with a vintage look', 99, 25, 1)
--     INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status) VALUES (15, 'Samsung 4K UHD Smart TV', 15, 28, 'Large-screen TV with 4K resolution and smart features', 999, 5, 1)
--     INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status) VALUES (16, 'Sony WH-1000XM4 Wireless Headphones', 16, 0.26, 'High-quality noise-cancelling headphones for music and calls', 349, 25, 1)
--     INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status) VALUES (17, 'Amazon Kindle Paperwhite', 17, 0.2, 'Waterproof e-reader with glare-free display', 149, 30, 1)
--     INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status) VALUES (18, 'Nintendo Switch Console', 18, 1.2, 'Versatile gaming console for home and on-the-go', 299, 10, 1)
--     INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status) VALUES (19, 'Canon EOS R5 Mirrorless Camera', 19, 1.5, 'High-performance camera for professional photography and videography', 3899, 5, 1)
--     INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status) VALUES (20, 'Fitbit Charge 5 Fitness Tracker', 20, 0.02, 'Advanced fitness tracker with built-in GPS and heart rate monitoring', 179, 50, 1)
--     INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status) VALUES (21, 'Starbucks Coffee Beans', 21, 0.5, 'Various flavors of high-quality coffee beans for home brewing', 12, 100, 1)
--     INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status) VALUES (22, 'TCL 55-inch 4K Smart LED TV', 22, 20, 'Large, high-quality TV with smart features and HDR', 499, 15, 1)
--     INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status) VALUES (23, 'Apple iPad Pro', 23, 0.6, 'High-performance tablet with Pro features and Apple Pencil support', 799, 20, 1)
--     INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status) VALUES (24, 'JBL Flip 5 Portable Bluetooth Speaker', 24, 0.54, 'Portable speaker with high-quality sound and waterproof design', 119, 30, 1)
--     INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status) VALUES (25, 'ASUS ROG Strix G15 Gaming Laptop', 25, 2.3, 'High-performance gaming laptop with NVIDIA GeForce RTX graphics', 1499, 10, 1)
--     INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status) VALUES (26, 'Samsung 55-inch QLED 4K Smart TV', 26, 35, 'Ultra-high definition TV with Smart features', 899, 10, 1)
--     INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status) VALUES (27, 'Calvin Klein Euphoria Men Eau de Toilette', 27, 0.5, 'Sensual and masculine fragrance for men', 79, 30, 1)
--     INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status) VALUES (28, 'Bose QuietComfort 35 II Wireless Headphones', 28, 0.25, 'Noise-cancelling headphones for immersive sound', 299, 20, 1)
--     INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status) VALUES (29, 'Nintendo Switch Console', 29, 1, 'Portable gaming console with Joy-Con controllers', 299, 15, 1)
--     INTO MP2_Products (Prod_id, Prod_name, Prod_Category, Prod_weight, Prod_description, Prod_price, Prod_in_stock, Prod_status) VALUES (30, 'Oculus Quest 2 Virtual Reality Headset', 30, 0.57, 'Wireless VR headset with hand controllers', 399, 5, 1)
-- SELECT 1 FROM dual;










-- -- Create Employees
-- CREATE TABLE MP2_Employees(
--   Employee_ID NUMBER(10) PRIMARY KEY,
--   Name VARCHAR2(50),
--   Surname VARCHAR2(50),
--   Age NUMBER,
--   Phone VARCHAR2(20),
--   Address VARCHAR2(100),
--   Email VARCHAR2(100)
-- );

-- INSERT ALL
--     INTO MP2_Employees (Employee_ID, Name, Surname, Age, Phone, Address, Email) VALUES (1, 'Abl', 'Ahm', 18, '87051836304', 'Baikonur 42, Kyzylorda', 'squadradihaip@gmail.com')
--     INTO MP2_Employees (Employee_ID, Name, Surname, Age, Phone, Address, Email) VALUES (2, 'Edige', 'Bissultanov', 20, '87051736304', 'Baikonur 41, Kyzylorda', 'squadradihaipo@gmail.com')
--     INTO MP2_Employees (Employee_ID, Name, Surname, Age, Phone, Address, Email) VALUES (3, 'Rasul', 'Sheriazdanov', 20, '87051736303', 'Baikonur 40, Kyzylorda', 'squadradihuip@gmail.com')
--     INTO MP2_Employees (Employee_ID, Name, Surname, Age, Phone, Address, Email) VALUES (4, 'Emem', 'Lee', 28, '87051736302', 'Baikonur 45, Kyzylorda', 'squadradihqip@gmail.com')
--     INTO MP2_Employees (Employee_ID, Name, Surname, Age, Phone, Address, Email) VALUES (5, 'Patsan', 'Nguyen', 35, '87051736302', 'Baikonur 46, Kyzylorda', 'squadradiwqip@gmail.com')
--     INTO MP2_Employees (Employee_ID, Name, Surname, Age, Phone, Address, Email) VALUES (6, 'Emily', 'Chen', 27, '87051736302', 'Baikonur 47, Kyzylorda', 'squadradiwqip@gmail.com')
--     INTO MP2_Employees (Employee_ID, Name, Surname, Age, Phone, Address, Email) VALUES (7, 'David', 'Garcia', 33, '87051736300', 'Baikonur 49, Kyzylorda', 'squadradiqip@gmail.com')
-- SELECT 1 FROM dual;














-- Creating MP2_Customers table

-- CREATE TABLE MP2_Customers (
--     Cust_ID NUMBER PRIMARY KEY,
--     Cust_Name VARCHAR(50),
--     Cust_Surname VARCHAR(50),
--     Cust_Address VARCHAR(200),
--     Cust_Phone VARCHAR(50),
--     Cust_Email VARCHAR(100),
--     Cust_Age NUMBER,
--     Cust_Wallet NUMBER
-- );

-- INSERT ALL
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_Phone, Cust_Email, Cust_Age, Cust_Wallet) VALUES (1, 'John', 'Smith', '123 Main St', '555-1234', 'john.smith@email.com', 25, 1000)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_Phone, Cust_Email, Cust_Age, Cust_Wallet) VALUES (2, 'Emily', 'Davis', '456 Oak Ave', '555-5678', 'emily.davis@email.com', 30, 500)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_Phone, Cust_Email, Cust_Age, Cust_Wallet) VALUES (3, 'Michael', 'Johnson', '789 Maple Ln', '555-9012', 'michael.johnson@email.com', 40, 2500)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_Phone, Cust_Email, Cust_Age, Cust_Wallet) VALUES (4, 'Avery', 'Williams', '321 Elm St', '555-3456', 'avery.williams@email.com', 28, 1500)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_Phone, Cust_Email, Cust_Age, Cust_Wallet) VALUES (5, 'Sophia', 'Brown', '654 Pine St', '555-7890', 'sophia.brown@email.com', 35, 3000)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_Phone, Cust_Email, Cust_Age, Cust_Wallet) VALUES (6, 'Ethan', 'Garcia', '987 Cedar Rd', '555-2345', 'ethan.garcia@email.com', 22, 200)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_Phone, Cust_Email, Cust_Age, Cust_Wallet) VALUES (7, 'Isabella', 'Martinez', '159 Birch Blvd', '555-6789', 'isabella.martinez@email.com', 27, 750)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_Phone, Cust_Email, Cust_Age, Cust_Wallet) VALUES (8, 'Noah', 'Anderson', '753 Spruce Ave', '555-0123', 'noah.anderson@email.com', 33, 100)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_Phone, Cust_Email, Cust_Age, Cust_Wallet) VALUES (9, 'Mia', 'Thomas', '246 Oak Ave', '555-4567', 'mia.thomas@email.com', 42, 2000)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_Phone, Cust_Email, Cust_Age, Cust_Wallet) VALUES (10, 'William', 'Jackson', '987 Pine St', '555-8901', 'william.jackson@email.com', 29, 1800)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_Phone, Cust_Email, Cust_Age, Cust_Wallet) VALUES (11, 'Ava', 'White', '321 Maple Ln', '555-2345', 'ava.white@email.com', 26, 300)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_Phone, Cust_Email, Cust_Age, Cust_Wallet) VALUES (12, 'James', 'Harris', '654 Cedar Rd', '555-6789', 'james.harris@email.com', 37, 3500)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (13, 'Avery', 'Garcia', '123 Main St', '555-555-1313', 'agarcia@email.com', 28, 500)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (14, 'Isabella', 'Nguyen', '456 Oak Ave', '555-555-1414', 'inguyen@email.com', 35, 700)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (15, 'Elijah', 'Perez', '789 Elm Blvd', '555-555-1515', 'eperez@email.com', 22, 300)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (16, 'Natalie', 'Robinson', '123 Main St', '555-555-1616', 'nrobinson@email.com', 41, 1200)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (17, 'Cameron', 'Cooper', '456 Oak Ave', '555-555-1717', 'ccooper@email.com', 33, 800)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (18, 'Lila', 'Lee', '789 Elm Blvd', '555-555-1818', 'llee@email.com', 29, 600)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (19, 'Nicholas', 'Gonzalez', '123 Main St', '555-555-1919', 'ngonzalez@email.com', 47, 1500)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (20, 'Audrey', 'White', '456 Oak Ave', '555-555-2020', 'awhite@email.com', 26, 400)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (21, 'Hudson', 'Allen', '789 Elm Blvd', '555-555-2121', 'hallen@email.com', 31, 900)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (22, 'Sophia', 'King', '123 Main St', '555-555-2222', 'sking@email.com', 24, 200)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (23, 'Gabriel', 'Wright', '456 Oak Ave', '555-555-2323', 'gwright@email.com', 38, 1100)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (24, 'Chloe', 'Scott', '789 Elm Blvd', '555-555-2424', 'cscott@email.com', 30, 700)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (25, 'Julian', 'Loh', '123 Main St, Apt 2', '555-2984', 'julian_loh@example.com', 34, 2500)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (26, 'Emma', 'Garcia', '123 Main St, Apt 2', '555-1234', 'emma.garcia@example.com', 35, 1500)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (27, 'Aiden', 'Wright', '456 Oak St, Suite 10', '555-5678', 'aiden.wright@example.com', 28, 500)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (28, 'Chloe', 'Smith', '789 Maple St, Apt 5B', '555-9012', 'chloe.smith@example.com', 42, 2500)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (29, 'Luke', 'Hernandez', '321 Elm St, Unit 4', '555-3456', 'luke.hernandez@example.com', 23, 100)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (30, 'Mia', 'Brown', '654 Pine St, Suite 3A', '555-7890', 'mia.brown@example.com', 31, 800)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (31, 'Ethan', 'Johnson', '987 Cedar St, Apt 7', '555-2345', 'ethan.johnson@example.com', 27, 400)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (32, 'Harper', 'Davis', '654 Pine St, Suite 3B', '555-6789', 'harper.davis@example.com', 20, 50)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (33, 'William', 'Gonzalez', '123 Main St, Apt 3', '555-1234', 'william.gonzalez@example.com', 39, 2000)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (34, 'Amelia', 'Rodriguez', '456 Oak St, Suite 11', '555-5678', 'amelia.rodriguez@example.com', 44, 3000)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (35, 'James', 'Lee', '789 Maple St, Apt 5C', '555-9012', 'james.lee@example.com', 52, 5000)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (36, 'Olivia', 'Walker', '321 Elm St, Unit 5', '555-3456', 'olivia.walker@example.com', 24, 150)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (37, 'Mohamed', 'Ali', '456 Elm St', '555-5678', 'mohamed@email.com', 42, 2000)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (38, 'Emily', 'Baker', '789 Oak St', '555-9012', 'emily@email.com', 19, 100)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (39, 'Carlos', 'Garcia', '321 Pine St', '555-3456', 'carlos@email.com', 35, 1500)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (40, 'Anna', 'Kovalenko', '654 Cedar St', '555-7890', 'anna@email.com', 22, 300)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (41, 'Kofi', 'Boateng', '987 Maple St', '555-4321', 'kofi@email.com', 29, 1000)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (42, 'Sophia', 'Nguyen', '741 Pineapple St', '555-8765', 'sophia@email.com', 25, 700)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (43, 'Gabriel', 'Martinez', '852 Oakwood Ave', '555-4321', 'gabriel@email.com', 37, 1200)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (44, 'Fatima', 'Al-Sayed', '963 Appleton St', '555-7890', 'fatima@email.com', 27, 800)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (45, 'William', 'Li', '258 Oakley Blvd', '555-1234', 'william@email.com', 32, 5000)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (46, 'Jasmine', 'Kim', '369 Pine Grove Dr', '555-5678', 'jasmine@email.com', 21, 200)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (47, 'Victor', 'Oliveira', '147 Maplewood Ave', '555-9012', 'victor@email.com', 46, 3000)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (48, 'Maria', 'Rodriguez', '123 Main St', '555-1234', 'maria@email.com', 28, 500)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_Phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (49, 'Isabella', 'Gonzalez', '789 Oak St, Anytown USA', '+1-555-555-9012', 'isabella.gonzalez@example.com', 19, 500)
--    INTO MP2_Customers (Cust_ID, Cust_Name, Cust_Surname, Cust_Address, Cust_Phone, Cust_Email, Cust_Age, Cust_wallet) VALUES (50, 'Max', 'Johnson', '10 Pine St, Anytown USA', '+1-555-555-3456', 'max.johnson@example.com', 42, 3000)
-- SELECT 1 From dual;













-- Creating Discount Table
-- CREATE TABLE MP2_Discount ( 
--     Discounts_id Number(10) PRIMARY KEY, 
--     Discount_event VARCHAR(200), 
--     Product_id Number(10) REFERENCES MP2_Products(Prod_id), 
--     Discount_start_day date, 
--     Discount_duration Number(12) 
-- ); 
 
-- Drop Table MP2_Discount 
 
-- INSERT ALL 
--     INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration)  
--     VALUES (1, 'Spring Sale', 1, '04/10-2023', 6) 
--     INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration)  
--     VALUES (2, 'Summer Sale', 2, '06/01-2023', 12) 
--     INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration)  
--     VALUES (3, 'Winter Clearance', 3, '01/15-2023', 12) 
--     INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration)  
--     VALUES (4, 'New Year Sale', 4, '01/01-2023', 6) 
--     INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration)  
--     VALUES (5, 'Back to School', 5, '08/15-2023', 12) 
--     INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration)  
--     VALUES (6, 'Holiday Sale', 6, '12/10-2023', 6) 
--     INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration)  
--     VALUES (7, 'End of Summer Sale', 7, '09/01-2023', 12) 
--     INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration)  
--     VALUES (8, 'Labor Day Sale', 8, '09/04-2023', 3) 
--     INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration)  
--     VALUES (9, 'Black Friday Sale', 9, '11/24-2023', 3) 
--     INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration)  
--     VALUES (10, 'Cyber Monday', 10, '11/27-2023', 3) 
--     INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration)  
--     VALUES (11, 'Valentine Day Sale', 11, '02/14-2023', 6) 
--     INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration)  
--     VALUES (12, 'Mother Day Sale', 12, '05/14-2023', 3) 
--     INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration)  
--       VALUES (13, 'Summer Sale , 13,-2023 '06-01-2023', 3) 
--     INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration)  
--       VALUES (14, 'Back to School , 14,-2023 '08-01-2023', 6) 
--     INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration)  
--       VALUES (15, 'Fall Collection , 15,-2023 '09-15-2023', 3) 
--     INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration)  
--       VALUES (16, 'Halloween Sale , 16,-2023 '10-15-2023', 12) 
--     INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration)  
--       VALUES (17, 'Thanksgiving , 17,-2023 '11-15-2023', 12) 
--     INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration)  
--       VALUES (18, 'Christmas Sale , 18,-2023 '12-01-2023', 12) 
--     INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration)  
--       VALUES (19, 'New Year Sale 2024', 19, '2024-01-01', 12) 
--     INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration)  
--       VALUES (20, 'Valentines Day Sale 2024', 20, '2024-02-01', 12)
-- INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration)  
--       VALUES (21, 'Spring Sale 2024', 21, '2024-03-01', 12) 
--     INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration)  
--       VALUES (22, 'Easter Sale 2024', 22, '2024-04-01', 12) 
--     INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration)  
--       VALUES (23, 'Mothers Day Sale 2024', 23, '2024-05-01', 6) 
--     INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration)  
--       VALUES (24, 'Memorial Day Sale 2024', 24, '2024-05-27', 3) 
--     INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration) 
--       VALUES (25, 'Summer sale', 25, '06-01-2023', 12) 
--     INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration) 
--       VALUES (26, 'Summer sale', 26, '06-01-2023', 12) 
--     INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration) 
--       VALUES (27, 'Summer sale', 27, '06-01-2023', 3) 
--     INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration) 
--       VALUES (28, 'Summer sale', 28, '06-01-2023', 6) 
--     INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration) 
--       VALUES (29, 'Summer sale', 29, '06-01-2023', 12) 
--     INTO MP2_Discount (Discounts_id, Discount_event, Product_id, Discount_start_day, Discount_duration) 
--      VALUES (30, 'Summer sale', 30, '06-01-2023', 12)
-- SELECT 1 FROM dual;












-- Creating Vendors
-- CREATE TABLE MP2_Vendors ( 
--     Vendors_id Number(10) PRIMARY KEY, 
--     Vendor_Name VARCHAR(50), 
--     Product_id Number(10) REFERENCES MP2_Products(Prod_id), 
--     Vendor_SupportStatus Number(1,0), 
--     Phone_Number Number(9) 
-- ); 
 
 
-- INSERT ALL 
--    INTO MP2_Vendors (Vendors_id, Vendor_Name, Product_id, Vendor_SupportStatus, Phone_Number)  
--       VALUES (1, 'Vendor1', 1, 1, 123456789) 
--    INTO MP2_Vendors (Vendors_id, Vendor_Name, Product_id, Vendor_SupportStatus, Phone_Number)  
--       VALUES (2, 'Vendor2', 2, 0, 987654321) 
--    INTO MP2_Vendors (Vendors_id, Vendor_Name, Product_id, Vendor_SupportStatus, Phone_Number)  
--       VALUES (3, 'Vendor3', 3, 1, 555555555) 
--    INTO MP2_Vendors (Vendors_id, Vendor_Name, Product_id, Vendor_SupportStatus, Phone_Number)  
--       VALUES (4, 'Vendor4', 4, 0, 111111111) 
--    INTO MP2_Vendors (Vendors_id, Vendor_Name, Product_id, Vendor_SupportStatus, Phone_Number)  
--       VALUES (5, 'Vendor5', 5, 1, 222222222) 
--    INTO MP2_Vendors (Vendors_id, Vendor_Name, Product_id, Vendor_SupportStatus, Phone_Number)  
--       VALUES (6, 'Vendor6', 6, 0, 333333333) 
--    INTO MP2_Vendors (Vendors_id, Vendor_Name, Product_id, Vendor_SupportStatus, Phone_Number)  
--       VALUES (7, 'Vendor7', 7, 1, 444444444) 
--    INTO MP2_Vendors (Vendors_id, Vendor_Name, Product_id, Vendor_SupportStatus, Phone_Number)  
--       VALUES (8, 'Vendor8', 8, 0, 777777777) 
--    INTO MP2_Vendors (Vendors_id, Vendor_Name, Product_id, Vendor_SupportStatus, Phone_Number)  
--       VALUES (9, 'Vendor9', 9, 1, 888888888) 
--    INTO MP2_Vendors (Vendors_id, Vendor_Name, Product_id, Vendor_SupportStatus, Phone_Number)  
--       VALUES (10, 'Vendor10', 10, 0, 999999999) 
--    INTO MP2_Vendors (Vendors_id, Vendor_Name, Product_id, Vendor_SupportStatus, Phone_Number)  
--       VALUES (11, 'Vendor11', 11, 1, 444444444) 
--    INTO MP2_Vendors (Vendors_id, Vendor_Name, Product_id, Vendor_SupportStatus, Phone_Number)  
--       VALUES (12, 'Vendor12', 12, 0, 777777777) 
--    INTO MP2_Vendors (Vendors_id, Vendor_Name, Product_id, Vendor_SupportStatus, Phone_Number)  
--       VALUES (13, 'Vendor13', 13, 1, 888888888) 
--    INTO MP2_Vendors (Vendors_id, Vendor_Name, Product_id, Vendor_SupportStatus, Phone_Number)  
--       VALUES (14, 'Vendor14', 14, 0, 999999999) 
--    INTO MP2_Vendors (Vendors_id, Vendor_Name, Product_id, Vendor_SupportStatus, Phone_Number)  
--       VALUES (15, 'Vendor15', 15, 1, 444444444) 
--    INTO MP2_Vendors (Vendors_id, Vendor_Name, Product_id, Vendor_SupportStatus, Phone_Number)  
--       VALUES (16, 'Vendor 16', 16, 1, 123456789) 
--    INTO MP2_Vendors (Vendors_id, Vendor_Name, Product_id, Vendor_SupportStatus, Phone_Number)  
--       VALUES (17, 'Vendor 17', 17, 0, 234567890) 
--    INTO MP2_Vendors (Vendors_id, Vendor_Name, Product_id, Vendor_SupportStatus, Phone_Number)  
--       VALUES (18, 'Vendor 18', 18, 1, 345678901) 
--    INTO MP2_Vendors (Vendors_id, Vendor_Name, Product_id, Vendor_SupportStatus, Phone_Number)  
--       VALUES (19, 'Vendor 19', 19, 0, 456789012) 
--    INTO MP2_Vendors (Vendors_id, Vendor_Name, Product_id, Vendor_SupportStatus, Phone_Number)  
--       VALUES (20, 'Vendor 20', 20, 1, 567890123) 
--    INTO MP2_Vendors (Vendors_id, Vendor_Name, Product_id, Vendor_SupportStatus, Phone_Number)  
--       VALUES (21, 'Vendor 21', 21, 0, 678901234) 
--    INTO MP2_Vendors (Vendors_id, Vendor_Name, Product_id, Vendor_SupportStatus, Phone_Number)  
--       VALUES (22, 'Vendor 22', 22, 1, 789012345) 
--    INTO MP2_Vendors (Vendors_id, Vendor_Name, Product_id, Vendor_SupportStatus, Phone_Number)  
--       VALUES (23, 'Vendor 23', 23, 0, 890123456) 
--    INTO MP2_Vendors (Vendors_id, Vendor_Name, Product_id, Vendor_SupportStatus, Phone_Number)  
--       VALUES (24, 'Vendor 24', 24, 1, 901234567) 
--    INTO MP2_Vendors (Vendors_id, Vendor_Name, Product_id, Vendor_SupportStatus, Phone_Number)  
--       VALUES (25, 'Vendor 25', 25, 0, 123456789) 
--    INTO MP2_Vendors (Vendors_id, Vendor_Name, Product_id, Vendor_SupportStatus, Phone_Number)  
--       VALUES (26, 'Vendor 26', 26, 1, 234567890) 
--    INTO MP2_Vendors (Vendors_id, Vendor_Name, Product_id, Vendor_SupportStatus, Phone_Number)
-- VALUES (27, 'Vendor 27', 27, 0, 345678901) 
--    INTO MP2_Vendors (Vendors_id, Vendor_Name, Product_id, Vendor_SupportStatus, Phone_Number)  
--       VALUES (28, 'Vendor 28', 28, 1, 456789012) 
--    INTO MP2_Vendors (Vendors_id, Vendor_Name, Product_id, Vendor_SupportStatus, Phone_Number)  
--       VALUES (29, 'Vendor 29', 29, 0, 567890123) 
--    INTO MP2_Vendors (Vendors_id, Vendor_Name, Product_id, Vendor_SupportStatus, Phone_Number)  
--       VALUES (30, 'Vendor 30', 30, 1, 678901234) 
-- SELECT 1 FROM DUAL;










-- Creating Reviews

-- CREATE TABLE MP2_Review (
--   Review_id NUMBER(10) PRIMARY KEY,
--   Cust_id NUMBER(10),
--   Prod_id NUMBER(10),
--   Review_time TIMESTAMP,
--   Review_desc VARCHAR2(1000),
--   CONSTRAINT fk_customer_id FOREIGN KEY (Cust_id) REFERENCES MP2_Customers(Cust_id),
--   CONSTRAINT fk_product_id FOREIGN KEY (Prod_id) REFERENCES MP2_Products(Prod_id)
-- );

-- INSERT ALL
--     INTO MP2_Review (Review_id, Cust_id, Prod_id, Review_time, Review_desc) VALUES (1, 1, 1, TIMESTAMP '03-23-2022 10:23:54', 'Great product, will definitely buy again.')
--     INTO MP2_Review (Review_id, Cust_id, Prod_id, Review_time, Review_desc) VALUES (2, 2, 1, TIMESTAMP '04-01-2022 12:45:12', 'Really happy with my purchase, arrived on time and in good condition.')
--     INTO MP2_Review (Review_id, Cust_id, Prod_id, Review_time, Review_desc) VALUES (3, 3, 1, TIMESTAMP '04-10-2022 09:10:23', 'The product was not what I expected, but customer service was helpful in resolving the issue.')
--     INTO MP2_Review (Review_id, Cust_id, Prod_id, Review_time, Review_desc) VALUES (4, 4, 2, TIMESTAMP '05-05-2022 14:20:43', 'This is the best product I have ever bought, highly recommended!')
--     INTO MP2_Review (Review_id, Cust_id, Prod_id, Review_time, Review_desc) VALUES (5, 5, 2, TIMESTAMP '05-20-2022 11:35:16', 'Product arrived damaged, but the seller provided a replacement quickly.')
--     INTO MP2_Review (Review_id, Cust_id, Prod_id, Review_time, Review_desc) VALUES (6, 6, 2, TIMESTAMP '06-01-2022 16:50:39', 'The product did not meet my expectations, but the seller was willing to provide a partial refund.')
--     INTO MP2_Review (Review_id, Cust_id, Prod_id, Review_time, Review_desc) VALUES (7, 7, 3, TIMESTAMP '06-22-2022 10:15:07', 'Very satisfied with the product and the customer service.')
--     INTO MP2_Review (Review_id, Cust_id, Prod_id, Review_time, Review_desc) VALUES (8, 8, 3, TIMESTAMP '07-03-2022 09:30:56', 'Product arrived on time and in good condition.')
--     INTO MP2_Review (Review_id, Cust_id, Prod_id, Review_time, Review_desc) VALUES (9, 9, 3, TIMESTAMP '07-18-2022 14:40:02', 'The product did not work as expected, but the seller was helpful in resolving the issue.')
--     INTO MP2_Review (Review_id, Cust_id, Prod_id, Review_time, Review_desc) VALUES (10, 10, 4, TIMESTAMP 5-202-20222 15:12:36', 'I am very happy with my purchase, the product is high quality and exactly as described.')
--     INTO MP2_Review (Review_id, Cust_id, Prod_id, Review_time, Review_desc) VALUES (11, 11, 4, TIMESTAMP 9-202-20222 12:20:08', 'The product arrived late, but the seller provided a discount to make up for the inconvenience.')
--     INTO MP2_Review (Review_id, Cust_id, Prod_id, Review_time, Review_desc) VALUES (12, 12, 4, TIMESTAMP 1-202-20222 09:55:43', 'I am very satisfied with the product and the seller.')
--     INTO MP2_Review (Review_id, Cust_id, Prod_id, Review_time, Review_desc) VALUES (13, 7, 16, TIMESTAMP 0-202-20222 10:35:00', 'Great product, very satisfied.')
--     INTO MP2_Review (Review_id, Cust_id, Prod_id, Review_time, Review_desc) VALUES (14, 14, 2, TIMESTAMP 5-202-20222 15:20:00', 'Not the best product, but it gets the job done.')
--     INTO MP2_Review (Review_id, Cust_id, Prod_id, Review_time, Review_desc) VALUES (15, 2, 23, TIMESTAMP 7-202-20222 09:45:00', 'Excellent quality, would recommend to others.')
--     INTO MP2_Review (Review_id, Cust_id, Prod_id, Review_time, Review_desc) VALUES (16, 17, 5, TIMESTAMP 0-202-20222 13:30:00', 'Disappointed with this product, it broke after a few uses.')
--     INTO MP2_Review (Review_id, Cust_id, Prod_id, Review_time, Review_desc) VALUES (17, 5, 18, TIMESTAMP 2-202-20222 14:15:00', 'Good value for money.')
--     INTO MP2_Review (Review_id, Cust_id, Prod_id, Review_time, Review_desc) VALUES (18, 9, 9, TIMESTAMP '-2022-2022 11:50:00', 'Great customer service.')
--     INTO MP2_Review (Review_id, Cust_id, Prod_id, Review_time, Review_desc) VALUES (19, 13, 15, TIMESTAMP '-2022-2022 16:10:00', 'Very happy with this purchase.')
--     INTO MP2_Review (Review_id, Cust_id, Prod_id, Review_time, Review_desc) VALUES (20, 5, 8, TIMESTAMP '03022 0-20228:55:00', 'Not what I expected, very disappointed.')
--     INTO MP2_Review (Review_id, Cust_id, Prod_id, Review_time, Review_desc) VALUES (21, 12, 26, TIMESTAMP '-2022-2022 12:30:00', 'Good quality product.')
--     INTO MP2_Review (Review_id, Cust_id, Prod_id, Review_time, Review_desc) VALUES (22, 1, 1, TIMESTAMP '03022 1-20224:05:00', 'Excellent product, highly recommend it.')
--     INTO MP2_Review (Review_id, Cust_id, Prod_id, Review_time, Review_desc) VALUES (23, 8, 20, TIMESTAMP '02022 -202216:40:00', 'Not as good as I was expecting.')
--     INTO MP2_Review (Review_id, Cust_id, Prod_id, Review_time, Review_desc) VALUES (24, 14, 10, TIMESTAMP '-2022-2022 10:25:00', 'Would not recommend this product.')
--     INTO MP2_Review (Review_id, Cust_id, Prod_id, Review_time, Review_desc) VALUES (25, 15, 6, TIMESTAMP '02022 -202209:00:00', 'Happy with my purchase.')
--     INTO MP2_Review (Review_id, Cust_id, Prod_id, Review_time, Review_desc) VALUES (26, 12, 7, TIMESTAMP'05022 1-20225:10:00', 'This item was exactly what I was looking for. It arrived quickly and in perfect condition.')
--     INTO MP2_Review (Review_id, Cust_id, Prod_id, Review_time, Review_desc) VALUES (27, 41, 11, TIMESTAMP'-2022-2022 18:45:00', 'I bought this as a gift for my friend and she loved it! The packaging was really nice too.')
--     INTO MP2_Review (Review_id, Cust_id, Prod_id, Review_time, Review_desc) VALUES (28, 26, 2, TIMESTAMP'03-22 12-2022:30:00', 'Im really happy with this purchase. The product is high quality and arrived on time.')
--     INTO MP2_Review (Review_id, Cust_id, Prod_id, Review_time, Review_desc) VALUES (29, 8, 9, TIMESTAMP'02022 0-20229:15:00', 'The product arrived with a scratch on it, but the customer service team was really helpful in resolving the issue.')
--     INTO MP2_Review (Review_id, Cust_id, Prod_id, Review_time, Review_desc) VALUES (30, 17, 3, TIMESTAMP'01-22 14-2022:55:00', 'This item was a bit smaller than I expected, but the quality is good and it looks really nice on my shelf.')
-- SELECT * F




-2022-- Creatinrs 

-2022-- CREATE TABLE mp2_orders (
--   order_id INT NOT NULL,
--   order_weight_status VARCHAR(50),
--   order_price DECIMAL(10,2),
--   customer_id INT,
--   product_id INT,
--   PRIMARY KEY (order_id),
--   CONSTRAINT FK_ProductOrder FOREIGN KEY (product_id) REFERENCES mp2_products(PROD_ID),
--   CONSTRAINT FK_CustomerOrder FOREIGN KEY (customer_id) REFERENCES mp2_customers(cust_id)
-- );

-- INSERT ALL
--     INTO mp2_orders (order_id, order_weight_status, order_price, customer_id, product_id) VALUES (1001, 'Underweight', 50.99, 1, 1)
--     INTO mp2_orders (order_id, order_weight_status, order_price, customer_id, product_id) VALUES (1002, 'Overweight', 120.50, 2, 2)
--     INTO mp2_orders (order_id, order_weight_status, order_price, customer_id, product_id) VALUES (1003, 'Normal', 75.00, 3, 3)
--     INTO mp2_orders (order_id, order_weight_status, order_price, customer_id, product_id) VALUES (1004, 'Underweight', 25.99, 4, 4)
--     INTO mp2_orders (order_id, order_weight_status, order_price, customer_id, product_id) VALUES (1005, 'Overweight', 150.75, 5, 5)
--     INTO mp2_orders (order_id, order_weight_status, order_price, customer_id, product_id) VALUES (1006, 'Normal', 85.25, 6, 6)
--     INTO mp2_orders (order_id, order_weight_status, order_price, customer_id, product_id) VALUES (1007, 'Underweight', 30.99, 7, 7)
--     INTO mp2_orders (order_id, order_weight_status, order_price, customer_id, product_id) VALUES (1008, 'Overweight', 210.00, 8, 8)
--     INTO mp2_orders (order_id, order_weight_status, order_price, customer_id, product_id) VALUES (1009, 'Normal', 95.50, 9, 9)
--     INTO mp2_orders (order_id, order_weight_status, order_price, customer_id, product_id) VALUES (1010, 'Underweight', 45.99, 10, 10)
--     INTO mp2_orders (order_id, order_weight_status, order_price, customer_id, product_id) VALUES (1011, 'Overweight', 170.25, 11, 11)
--     INTO mp2_orders (order_id, order_weight_status, order_price, customer_id, product_id) VALUES (1012, 'Normal', 65.00, 12, 12)
--     INTO mp2_orders (order_id, order_weight_status, order_price, customer_id, product_id) VALUES (1013, 'Underweight', 20.99, 13, 13)
--     INTO mp2_orders (order_id, order_weight_status, order_price, customer_id, product_id) VALUES (1014, 'Overweight', 190.50, 14, 14)
--     INTO mp2_orders (order_id, order_weight_status, order_price, customer_id, product_id) VALUES (1015, 'Normal', 105.00, 15, 15)
--     INTO mp2_orders (order_id, order_weight_status, order_price, customer_id, product_id) VALUES (1016, 'Underweight', 35.99, 16, 16)
--     INTO mp2_orders (order_id, order_weight_status, order_price, customer_id, product_id) VALUES (1017, 'Overweight', 230.75, 17, 17)
--     INTO mp2_orders (order_id, order_weight_status, order_price, customer_id, product_id) VALUES (1018, 'Normal', 125.50, 18, 18)
--     INTO mp2_orders (order_id, order_weight_status, order_price, customer_id, product_id) VALUES (1019, 'Underweight', 55.99, 19, 19)
--     INTO mp2_orders (order_id, order_weight_status, order_price, customer_id, product_id) VALUES (1020, 'Overweight', 250.50, 20, 20)
--     INTO mp2_orders (order_id, order_weight_status, order_price, customer_id, product_id) VALUES (1021, 'Normal', 135.00, 21, 21)
--     INTO mp2_orders (order_id, order_weight_status, order_price, customer_id, product_id) VALUES (1022, 'Underweight', 40.99, 22, 22)
--     INTO mp2_orders (order_id, order_weight_status, order_price, customer_id, product_id) VALUES (1023, 'Overweight', 190.25, 23, 23)
--     INTO mp2_orders (order_id, order_weight_status, order_price, customer_id, product_id) VALUES (1024, 'Normal', 95.50, 24, 24)
--     INTO mp2_orders (order_id, order_weight_status, order_price, customer_id, product_id) VALUES (1025, 'Underweight', 28.99, 25, 25)
--     INTO mp2_orders (order_id, order_weight_status, order_price, customer_id, product_id) VALUES (1026, 'Overweight', 130.75, 26, 26)
--     INTO mp2_orders (order_id, order_weight_status, order_price, customer_id, product_id) VALUES (1027, 'Normal', 75.50, 27, 27)
--     INTO mp2_orders (order_id, order_weight_status, order_price, customer_id, product_id) VALUES (1028, 'Underweight', 35.99, 28, 28)
--     INTO mp2_orders (order_id, order_weight_status, order_price, customer_id, product_id) VALUES (1029, 'Overweight', 170.50, 29, 29)
--     INTO mp2_orders (order_id, order_weight_status, order_price, customer_id, product_id) VALUES (1030, 'Normal', 125.00, 30, 30)
-- SELECT 1 FROM DUAL;










-- Creating Photos
-- CREATE TABLE MP2_Photos ( 
--     Photo_id Number(10) PRIMARY KEY, 
--     Product_id Number(10) REFERENCES MP2_Products(Prod_id), 
--     Photo_url Varchar(400) 
-- ); 
 
 
-- INSERT ALL 
-- INTO MP2_Photos (Photo_id, Product_id, Photo_url) VALUES (1, 1, 'https://example.com/photos/1.jpg') 
-- INTO MP2_Photos (Photo_id, Product_id, Photo_url) VALUES (2, 2, 'https://example.com/photos/2.jpg') 
-- INTO MP2_Photos (Photo_id, Product_id, Photo_url) VALUES (3, 3, 'https://example.com/photos/3.jpg') 
-- INTO MP2_Photos (Photo_id, Product_id, Photo_url) VALUES (4, 4, 'https://example.com/photos/4.jpg') 
-- INTO MP2_Photos (Photo_id, Product_id, Photo_url) VALUES (5, 5, 'https://example.com/photos/5.jpg') 
-- INTO MP2_Photos (Photo_id, Product_id, Photo_url) VALUES (6, 6, 'https://example.com/photos/6.jpg') 
-- INTO MP2_Photos (Photo_id, Product_id, Photo_url) VALUES (7, 7, 'https://example.com/photos/7.jpg') 
-- INTO MP2_Photos (Photo_id, Product_id, Photo_url) VALUES (8, 8, 'https://example.com/photos/8.jpg') 
-- INTO MP2_Photos (Photo_id, Product_id, Photo_url) VALUES (9, 9, 'https://example.com/photos/9.jpg') 
-- INTO MP2_Photos (Photo_id, Product_id, Photo_url) VALUES (10, 10, 'https://example.com/photos/10.jpg') 
-- INTO MP2_Photos (Photo_id, Product_id, Photo_url) VALUES (11, 11, 'https://example.com/photos/11.jpg') 
-- INTO MP2_Photos (Photo_id, Product_id, Photo_url) VALUES (12, 12, 'https://example.com/photos/12.jpg') 
-- INTO MP2_Photos (Photo_id, Product_id, Photo_url) VALUES (13, 13, 'https://example.com/photos/13.jpg') 
-- INTO MP2_Photos (Photo_id, Product_id, Photo_url) VALUES (14, 14, 'https://example.com/photos/14.jpg') 
-- INTO MP2_Photos (Photo_id, Product_id, Photo_url) VALUES (15, 15, 'https://example.com/photos/15.jpg') 
-- INTO MP2_Photos (Photo_id, Product_id, Photo_url) VALUES (16, 16, 'https://example.com/photos/16.jpg') 
-- INTO MP2_Photos (Photo_id, Product_id, Photo_url) VALUES (17, 17, 'https://example.com/photos/17.jpg') 
-- INTO MP2_Photos (Photo_id, Product_id, Photo_url) VALUES (18, 18, 'https://example.com/photos/18.jpg') 
-- INTO MP2_Photos (Photo_id, Product_id, Photo_url) VALUES (19, 19, 'https://example.com/photos/19.jpg') 
-- INTO MP2_Photos (Photo_id, Product_id, Photo_url) VALUES (20, 20, 'https://example.com/photos/20.jpg') 
-- INTO MP2_Photos (Photo_id, Product_id, Photo_url) VALUES (21, 21, 'https://example.com/photos/21.jpg') 
-- INTO MP2_Photos (Photo_id, Product_id, Photo_url) VALUES (22, 22, 'https://example.com/photos/22.jpg') 
-- INTO MP2_Photos (Photo_id, Product_id, Photo_url) VALUES (23, 23, 'https://example.com/photos/23.jpg') 
-- INTO MP2_Photos (Photo_id, Product_id, Photo_url) VALUES (24, 24, 'https://example.com/photos/24.jpg') 
-- INTO MP2_Photos (Photo_id, Product_id, Photo_url) VALUES (25, 25, 'https://example.com/photos/25.jpg') 
-- INTO MP2_Photos (Photo_id, Product_id, Photo_url) VALUES (26, 26, 'https://example.com/photos/26.jpg') 
-- INTO MP2_Photos (Photo_id, Product_id, Photo_url) VALUES (27, 27, 'https://example.com/photos/27.jpg') 
-- INTO MP2_Photos (Photo_id, Product_id, Photo_url) VALUES (28, 28, 'https://example.com/photos/28.jpg') 
-- INTO MP2_Photos (Photo_id, Product_id, Photo_url) VALUES (29, 29, 'https://example.com/photos/29.jpg') 
-- INTO MP2_Photos (Photo_id, Product_id, Photo_url) VALUES (30, 30, 'https://example.com/photos/30.jpg') 
-- SELECT 1 FROM DUAL;









-- Creating Guarantee
-- CREATE TABLE MP2_Guarantee (
--   Prod_id NUMBER PRIMARY KEY,
--   Guarantee_time TIMESTAMP,
--   Guarantee_description VARCHAR2(4000),
--   CONSTRAINT fk_guarantee_product_id FOREIGN KEY (Prod_id) REFERENCES MP2_Products(Prod_id)
-- );

-- INSERT ALL
--     INTO MP2_Guarantee (Prod_id, Guarantee_time, Guarantee_description) VALUES (1, TO_TIMESTAMP('01-01-2022 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'This product is guaranteed to work for 1 year.')
--     INTO MP2_Guarantee (Prod_id, Guarantee_time, Guarantee_description) VALUES (2, TO_TIMESTAMP('02-01-2022 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'If this product breaks within the first year, we will replace it for free.')
--     INTO MP2_Guarantee (Prod_id, Guarantee_time, Guarantee_description) VALUES (3, TO_TIMESTAMP('03-01-2022 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'This product is guaranteed to be free from defects for 2 years.')
--     INTO MP2_Guarantee (Prod_id, Guarantee_time, Guarantee_description) VALUES (4, TO_TIMESTAMP('04-01-2022 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'This product is guaranteed to work for 3 years.')
--     INTO MP2_Guarantee (Prod_id, Guarantee_time, Guarantee_description) VALUES (5, TO_TIMESTAMP('05-01-2022 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'If this product breaks within the first 6 months, we will replace it for free.')
--     INTO MP2_Guarantee (Prod_id, Guarantee_time, Guarantee_description) VALUES (6, TO_TIMESTAMP('06-01-2022 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'This product is guaranteed to be free from defects for 1 year.')
--     INTO MP2_Guarantee (Prod_id, Guarantee_time, Guarantee_description) VALUES (7, TO_TIMESTAMP('07-01-2022 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'This product is guaranteed to work for 5 years.')
--     INTO MP2_Guarantee (Prod_id, Guarantee_time, Guarantee_description) VALUES (8, TO_TIMESTAMP('08-01-2022 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'If this product breaks within the first year, we will replace it for free.')
--     INTO MP2_Guarantee (Prod_id, Guarantee_time, Guarantee_description) VALUES (9, TO_TIMESTAMP('09-01-2022 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'This product is guaranteed to be free from defects for 2 years.')
--     INTO MP2_Guarantee (Prod_id, Guarantee_time, Guarantee_description) VALUES (10, TO_TIMESTAMP('-2022-2022 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'This product is guaranteed to work for 1 year.')
--     INTO MP2_Guarantee (Prod_id, Guarantee_time, Guarantee_description) VALUES (11, TO_TIMESTAMP('-2022-2022 22:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'If this product breaks within the first year, we will replace it for free.')
--     INTO MP2_Guarantee (Prod_id, Guarantee_time, Guarantee_description) VALUES (12, TO_TIMESTAMP('-2022-2022 23:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'This product is guaranteed to be free from defects for 2 years')
--     INTO MP2_Guarantee (Prod_id, Guarantee_time, Guarantee_description) VALUES (13, TO_TIMESTAMP('-2022-2022 23:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'This product is guaranteed to be free from defects for 2 years')
--     INTO MP2_Guarantee (Prod_id, Guarantee_time, Guarantee_description) VALUES (14, TO_TIMESTAMP('02-01-2022 01:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'If this product breaks within the first 6 months, we will replace it for free.')
--     INTO MP2_Guarantee (Prod_id, Guarantee_time, Guarantee_description) VALUES (15, TO_TIMESTAMP('03-01-2022 02:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'This product is guaranteed to be free from defects for 1 year.')
--     INTO MP2_Guarantee (Prod_id, Guarantee_time, Guarantee_description) VALUES (16, TO_TIMESTAMP('04-01-2022 03:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'This product is guaranteed to work for 5 years.')
--     INTO MP2_Guarantee (Prod_id, Guarantee_time, Guarantee_description) VALUES (17, TO_TIMESTAMP('05-01-2022 04:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'If this product breaks within the first year, we will replace it for free.')
--     INTO MP2_Guarantee (Prod_id, Guarantee_time, Guarantee_description) VALUES (18, TO_TIMESTAMP('06-01-2022 05:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'This product is guaranteed to be free from defects for 2 years.')
--     INTO MP2_Guarantee (Prod_id, Guarantee_time, Guarantee_description) VALUES (19, TO_TIMESTAMP('27-01 -202206:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'This product is guaranteed to work for 1 year.')
--     INTO MP2_Guarantee (Prod_id, Guarantee_time, Guarantee_description) VALUES (20, TO_TIMESTAMP('28-01 -202207:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'If this product breaks within the first year, we will replace it for free.')
--     INTO MP2_Guarantee (Prod_id, Guarantee_time, Guarantee_description) VALUES (21, TO_TIMESTAMP('29-01 -202208:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'This product is guaranteed to be free from defects for 2 years.')
--     INTO MP2_Guarantee (Prod_id, Guarantee_time, Guarantee_description) VALUES (22, TO_TIMESTAMP('20-01 -202209:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'This product is guaranteed to work for 3 years.')
--     INTO MP2_Guarantee (Prod_id, Guarantee_time, Guarantee_description) VALUES (23, TO_TIMESTAMP('11-01-2023 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'If this product breaks within the first 6 months, we will replace it for free.')
--     INTO MP2_Guarantee (Prod_id, Guarantee_time, Guarantee_description) VALUES (24, TO_TIMESTAMP('12-01-2023 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'This product is guaranteed to be free from defects for 1 year.')
--     INTO MP2_Guarantee (Prod_id, Guarantee_time, Guarantee_description) VALUES (25, TO_TIMESTAMP('2024-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'This product is guaranteed to work for')
--     INTO MP2_Guarantee (Prod_id, Guarantee_time, Guarantee_description) VALUES (26, TO_TIMESTAMP('2024-02-01 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'If this product breaks within the first year, we will replace it for free.')
--     INTO MP2_Guarantee (Prod_id, Guarantee_time, Guarantee_description) VALUES (27, TO_TIMESTAMP('2024-03-01 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'This product is guaranteed to be free from defects for 2 years.')
--     INTO MP2_Guarantee (Prod_id, Guarantee_time, Guarantee_description) VALUES (28, TO_TIMESTAMP('2024-04-01 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'This product is guaranteed to work for 1 year.')
--     INTO MP2_Guarantee (Prod_id, Guarantee_time, Guarantee_description) VALUES (29, TO_TIMESTAMP('2024-05-01 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'If this product breaks within the first year, we will replace')
--     INTO MP2_Guarantee (Prod_id, Guarantee_time, Guarantee_description) VALUES (30, TO_TIMESTAMP('2024-05-01 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'If this product breaks within the first year, we will replace')
-- SELECT 1 FROM DUAL;






-- Creating MP2_Ships

CREATE TABLE MP2_Ships (
  ship_id NUMBER(10) PRIMARY KEY,
  ship_out_time DATE,
  ship_appro_time DATE,
  ship_in_time DATE,
  ship_order_id NUMBER(10),
  ship_address VARCHAR2(100),
  ship_status VARCHAR2(100),
  CONSTRAINT fk_order_id FOREIGN KEY (ship_order_id) REFERENCES MP2_Orders(order_id)
);

-- Drop TABLE MP2_ships

INSERT ALL
    INTO MP2_Ships (ship_id, ship_out_time, ship_appro_time, ship_in_time, ship_order_id, ship_address, ship_status) VALUES (1, '01-01-2022', '01-05-2022', '01-10-2022', 1, '123 Main St, Anytown USA', 'Delivered')
    INTO MP2_Ships (ship_id, ship_out_time, ship_appro_time, ship_in_time, ship_order_id, ship_address, ship_status) VALUES (2, '02-02-2022', '02-07-2022', '02-12-2022', 2, '456 Elm St, Anytown USA', 'Delivered')
    INTO MP2_Ships (ship_id, ship_out_time, ship_appro_time, ship_in_time, ship_order_id, ship_address, ship_status) VALUES (3, '03-03-2022', '03-08-2022', '03-10-2022', 3, '789 Oak St, Anytown USA', 'In Transit')
    INTO MP2_Ships (ship_id, ship_out_time, ship_appro_time, ship_in_time, ship_order_id, ship_address, ship_status) VALUES (4, '04-04-2022', '04-10-2022', '04-10-2022', 4, '111 Pine St, Anytown USA', 'In Transit')
    INTO MP2_Ships (ship_id, ship_out_time, ship_appro_time, ship_in_time, ship_order_id, ship_address, ship_status) VALUES (5, '05-05-2022', '05-11-2022', '05-12-2022', 5, '222 Maple St, Anytown USA', 'In Transit')
    INTO MP2_Ships (ship_id, ship_out_time, ship_appro_time, ship_in_time, ship_order_id, ship_address, ship_status) VALUES (6, '06-06-2022', '06-12-2022', '06-06-2022', 6, '333 Oak St, Anytown USA', 'Delivered')
    INTO MP2_Ships (ship_id, ship_out_time, ship_appro_time, ship_in_time, ship_order_id, ship_address, ship_status) VALUES (7, '07-07-2022', '07-05-2022', '07-07-2022', 7, '444 Main St, Anytown USA', 'In Transit')
    INTO MP2_Ships (ship_id, ship_out_time, ship_appro_time, ship_in_time, ship_order_id, ship_address, ship_status) VALUES (8, '08-08-2022', '08-06-2022', '08-01-2022', 8, '555 Elm St, Anytown USA', 'Delivered')
    INTO MP2_Ships (ship_id, ship_out_time, ship_appro_time, ship_in_time, ship_order_id, ship_address, ship_status) VALUES (9, '09-09-2022', '09-08-2022', '09-02-2022', 9, '666 Oak St, Anytown USA', 'Delivered')
    INTO MP2_Ships (ship_id, ship_out_time, ship_appro_time, ship_in_time, ship_order_id, ship_address, ship_status) VALUES (10, '06-01-2022', '06-02-2022', '06-05-2022', 10, '123 Main St', 'Delivered')
    INTO MP2_Ships (ship_id, ship_out_time, ship_appro_time, ship_in_time, ship_order_id, ship_address, ship_status) VALUES (11, '06-02-2022', '06-03-2022', '06-06-2022', 11, '456 Elm St', 'Shipped')
    INTO MP2_Ships (ship_id, ship_out_time, ship_appro_time, ship_in_time, ship_order_id, ship_address, ship_status) VALUES (12, '06-03-2022', '06-04-2022', '06-07-2022', 12, '789 Oak St', 'Delivered')
    INTO MP2_Ships (ship_id, ship_out_time, ship_appro_time, ship_in_time, ship_order_id, ship_address, ship_status) VALUES (13, '06-04-2022', '06-05-2022', '06-08-2022', 13, '321 Maple St', 'Shipped')
    INTO MP2_Ships (ship_id, ship_out_time, ship_appro_time, ship_in_time, ship_order_id, ship_address, ship_status) VALUES (14, '06-05-2022', '06-06-2022', '06-09-2022', 14, '654 Birch St', 'Delivered')
    INTO MP2_Ships (ship_id, ship_out_time, ship_appro_time, ship_in_time, ship_order_id, ship_address, ship_status) VALUES (15, '06-06-2022', '06-07-2022', '06-10-2022', 15, '987 Pine St', 'Shipped')
    INTO MP2_Ships (ship_id, ship_out_time, ship_appro_time, ship_in_time, ship_order_id, ship_address, ship_status) VALUES (16, '06-07-2022', '06-08-2022', '06-11-2022', 16, '246 Cedar St', 'Delivered')
    INTO MP2_Ships (ship_id, ship_out_time, ship_appro_time, ship_in_time, ship_order_id, ship_address, ship_status) VALUES (17, '06-08-2022', '06-09-2022', '06-12-2022', 17, '369 Walnut St', 'Shipped')
    INTO MP2_Ships (ship_id, ship_out_time, ship_appro_time, ship_in_time, ship_order_id, ship_address, ship_status) VALUES (18, '06-09-2022', '06-10-2022', '06-03-2022', 18, '582 Oak St', 'Delivered')
    INTO MP2_Ships (ship_id, ship_out_time, ship_appro_time, ship_in_time, ship_order_id, ship_address, ship_status) VALUES (19, '06-10-2022', '06-11-2022', '06-04-2022', 19, '792 Pine St', 'Shipped')
    INTO MP2_Ships (ship_id, ship_out_time, ship_appro_time, ship_in_time, ship_order_id, ship_address, ship_status) VALUES (20, '05-10-2022', '05-11-2022', '05-04-2022', 20, '123 Main St', 'Shipped')
    INTO MP2_Ships (ship_id, ship_out_time, ship_appro_time, ship_in_time, ship_order_id, ship_address, ship_status) VALUES (21, '06-01-2022', '06-02-2022', '06-05-2022', 21, '456 Oak St', 'Delivered')
    INTO MP2_Ships (ship_id, ship_out_time, ship_appro_time, ship_in_time, ship_order_id, ship_address, ship_status) VALUES (22, '07-04-2022', '07-05-2022', '07-08-2022', 22, '789 Pine St', 'Shipped')
    INTO MP2_Ships (ship_id, ship_out_time, ship_appro_time, ship_in_time, ship_order_id, ship_address, ship_status) VALUES (23, '08-05-2022', '08-06-2022', '08-09-2022', 23, '1010 Elm St', 'Delivered')
    INTO MP2_Ships (ship_id, ship_out_time, ship_appro_time, ship_in_time, ship_order_id, ship_address, ship_status) VALUES (24, '09-08-2022', '09-09-2022', '09-12-2022', 24, '1111 Maple St', 'Shipped')
    INTO MP2_Ships (ship_id, ship_out_time, ship_appro_time, ship_in_time, ship_order_id, ship_address, ship_status) VALUES (25, '10-11-2022', '10-12-2022', '10-05-2022', 25, '1313 Cedar St', 'Delivered')
    INTO MP2_Ships (ship_id, ship_out_time, ship_appro_time, ship_in_time, ship_order_id, ship_address, ship_status) VALUES (26, '04-05-2023', '04-06-2023', '04-07-2023', 26, '123 Main St', 'In transit')
    INTO MP2_Ships (ship_id, ship_out_time, ship_appro_time, ship_in_time, ship_order_id, ship_address, ship_status) VALUES (27, '04-06-2023', '04-07-2023', '04-08-2023', 27, '456 Elm St', 'In transit')
    INTO MP2_Ships (ship_id, ship_out_time, ship_appro_time, ship_in_time, ship_order_id, ship_address, ship_status) VALUES (28, '04-07-2023', '04-08-2023', '04-09-2023', 28, '789 Oak St', 'In transit')
    INTO MP2_Ships (ship_id, ship_out_time, ship_appro_time, ship_in_time, ship_order_id, ship_address, ship_status) VALUES (29, '02-04-2023', '04-09-2023', '04-10-2023', 29, '321 Pine St', 'Delivered')
    INTO MP2_Ships (ship_id, ship_out_time, ship_appro_time, ship_in_time, ship_order_id, ship_address, ship_status) VALUES (30, '04-09-2023', '04-10-2023', '04-11-2023', 30, '654 Maple St', 'Delivered')
SELECT 1 FROM DUAL;
