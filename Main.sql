CREATE DATABASE ecommerce_db;
USE ecommerce_db;

CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    city VARCHAR(50),
    state VARCHAR(50)
);

CREATE TABLE Category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    stock INT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

CREATE TABLE Order_Master (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATETIME DEFAULT NOW(),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Order_Detail (
    order_id INT,
    product_id INT,
    quantity INT,
    subtotal DECIMAL(10,2),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Order_Master(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

CREATE TABLE Payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_mode VARCHAR(20),
    payment_date DATETIME DEFAULT NOW(),
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Order_Master(order_id)
);

CREATE TABLE Shipment (
    shipment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    address VARCHAR(200),
    city VARCHAR(50),
    status VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES Order_Master(order_id)
);

CREATE TABLE Review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    rating INT,
    comments VARCHAR(200),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

USE ecommerce_db;

show tables;
-- =======================
-- CATEGORY
-- =======================
INSERT INTO Category (category_name) VALUES
('Electronics'),
('Clothing'),
('Books'),
('Home Appliances'),
('Sports'),
('Beauty');

-- =======================
-- PRODUCT
-- =======================
INSERT INTO Product (product_name, price, stock, category_id) VALUES
('Laptop', 60000, 15, 1),
('Smartphone', 25000, 40, 1),
('Bluetooth Speaker', 4000, 30, 1),
('Headphones', 2000, 50, 1),
('T-Shirt', 800, 120, 2),
('Jeans', 1500, 100, 2),
('Jacket', 3500, 60, 2),
('Novel', 400, 80, 3),
('Textbook', 1000, 70, 3),
('Cookbook', 600, 40, 3),
('Microwave', 7000, 25, 4),
('Refrigerator', 18000, 18, 4),
('Air Conditioner', 32000, 10, 4),
('Treadmill', 25000, 8, 5),
('Cricket Bat', 2500, 50, 5),
('Football', 900, 60, 5),
('Shampoo', 300, 100, 6),
('Perfume', 1500, 70, 6),
('Moisturizer', 600, 90, 6),
('Hair Dryer', 2000, 40, 6);

-- =======================
-- CUSTOMER
-- =======================
INSERT INTO Customer (customer_name, email, phone, city, state) VALUES
('Amit Sharma', 'amit@gmail.com', '9876543210', 'Delhi', 'Delhi'),
('Riya Verma', 'riya@gmail.com', '9898989898', 'Mumbai', 'Maharashtra'),
('Karan Singh', 'karan@gmail.com', '9797979797', 'Chennai', 'Tamil Nadu'),
('Neha Mehta', 'neha@gmail.com', '9787878787', 'Bengaluru', 'Karnataka'),
('Rahul Das', 'rahul@gmail.com', '9123456789', 'Kolkata', 'West Bengal'),
('Priya Patel', 'priya@gmail.com', '9998877665', 'Ahmedabad', 'Gujarat'),
('Sahil Khan', 'sahil@gmail.com', '9933221100', 'Lucknow', 'Uttar Pradesh'),
('Ananya Rao', 'ananya@gmail.com', '8899007766', 'Hyderabad', 'Telangana'),
('Vikas Yadav', 'vikas@gmail.com', '7766554433', 'Pune', 'Maharashtra'),
('Sneha Kapoor', 'sneha@gmail.com', '9090909090', 'Jaipur', 'Rajasthan');

-- =======================
-- ORDER_MASTER
-- =======================
INSERT INTO Order_Master (customer_id, order_date, total_amount) VALUES
(1, '2025-01-02', 0),
(2, '2025-01-04', 0),
(3, '2025-01-06', 0),
(4, '2025-01-10', 0),
(5, '2025-02-01', 0),
(6, '2025-02-03', 0),
(7, '2025-02-05', 0),
(8, '2025-02-10', 0),
(9, '2025-02-11', 0),
(10, '2025-02-15', 0),
(1, '2025-03-02', 0),
(2, '2025-03-04', 0),
(3, '2025-03-06', 0),
(4, '2025-03-10', 0),
(5, '2025-04-01', 0);

-- =======================
-- ORDER_DETAIL
-- =======================
INSERT INTO Order_Detail (order_id, product_id, quantity, subtotal) VALUES
(1, 1, 1, 60000),
(1, 4, 2, 4000),
(2, 5, 3, 2400),
(2, 6, 2, 3000),
(3, 2, 1, 25000),
(3, 8, 2, 800),
(4, 7, 1, 3500),
(4, 9, 1, 1000),
(5, 11, 1, 7000),
(5, 13, 1, 32000),
(6, 15, 2, 5000),
(6, 16, 1, 900),
(7, 17, 3, 900),
(8, 19, 2, 1200),
(8, 20, 1, 2000),
(9, 14, 1, 25000),
(10, 12, 1, 18000),
(11, 10, 2, 1200),
(12, 18, 1, 1500),
(13, 3, 2, 8000),
(14, 6, 1, 1500),
(15, 1, 1, 60000),
(15, 2, 1, 25000);

-- =======================
-- PAYMENT
-- =======================
INSERT INTO Payment (order_id, payment_mode, payment_date, amount) VALUES
(1, 'UPI', '2025-01-02', 64000),
(2, 'CARD', '2025-01-04', 5400),
(3, 'CASH', '2025-01-06', 25800),
(4, 'UPI', '2025-01-10', 4500),
(5, 'CARD', '2025-02-01', 39000),
(6, 'CASH', '2025-02-03', 5900),
(7, 'CARD', '2025-02-05', 900),
(8, 'UPI', '2025-02-10', 3200),
(9, 'CASH', '2025-02-11', 25000),
(10, 'CARD', '2025-02-15', 18000),
(11, 'UPI', '2025-03-02', 1200),
(12, 'CASH', '2025-03-04', 1500),
(13, 'CARD', '2025-03-06', 8000),
(14, 'UPI', '2025-03-10', 1500),
(15, 'CASH', '2025-04-01', 85000);

-- =======================
-- SHIPMENT
-- =======================
INSERT INTO Shipment (order_id, address, city, status) VALUES
(1, 'A-10, Lajpat Nagar', 'Delhi', 'Delivered'),
(2, 'B-21, Bandra', 'Mumbai', 'Delivered'),
(3, 'C-32, Velachery', 'Chennai', 'In Transit'),
(4, 'D-11, Indiranagar', 'Bengaluru', 'Delivered'),
(5, 'E-10, Salt Lake', 'Kolkata', 'In Transit'),
(6, 'F-19, Navrangpura', 'Ahmedabad', 'Delivered'),
(7, 'G-22, Hazratganj', 'Lucknow', 'Pending'),
(8, 'H-13, Jubilee Hills', 'Hyderabad', 'Delivered'),
(9, 'I-8, Kalyani Nagar', 'Pune', 'Delivered'),
(10, 'J-9, Vaishali Nagar', 'Jaipur', 'Delivered'),
(11, 'A-44, Rohini', 'Delhi', 'Pending'),
(12, 'B-9, Dadar', 'Mumbai', 'Delivered'),
(13, 'C-55, Anna Nagar', 'Chennai', 'In Transit'),
(14, 'D-7, Koramangala', 'Bengaluru', 'Delivered'),
(15, 'E-66, Park Street', 'Kolkata', 'Delivered');

-- =======================
-- REVIEW
-- =======================
INSERT INTO Review (customer_id, product_id, rating, comments) VALUES
(1, 1, 5, 'Excellent Laptop!'),
(2, 5, 4, 'Good Quality T-Shirt.'),
(3, 2, 5, 'Amazing Phone!'),
(4, 8, 4, 'Nice novel.'),
(5, 11, 3, 'Works fine.'),
(6, 15, 5, 'Very strong bat!'),
(7, 19, 4, 'Soft and smooth moisturizer.'),
(8, 20, 5, 'Hair dryer is powerful!'),
(9, 12, 5, 'Perfect refrigerator.'),
(10, 7, 4, 'Warm and stylish jacket.'),
(1, 16, 4, 'Football quality good.'),
(2, 18, 3, 'Average perfume.'),
(3, 9, 5, 'Textbook is very useful.'),
(4, 14, 5, 'Nice treadmill.'),
(5, 13, 4, 'Air conditioner works well.');

-- 1. Customers with their orders
SELECT o.order_id, c.customer_name, o.total_amount
FROM Order_Master o
JOIN Customer c ON o.customer_id = c.customer_id;

-- 2. Order details with product info
SELECT c.customer_name, p.product_name, od.quantity, od.subtotal
FROM Customer c
JOIN Order_Master o ON c.customer_id = o.customer_id
JOIN Order_Detail od ON o.order_id = od.order_id
JOIN Product p ON od.product_id = p.product_id;

-- 3. Products without reviews
SELECT p.product_name
FROM Product p
LEFT JOIN Review r ON p.product_id = r.product_id
WHERE r.product_id IS NULL;

DELIMITER //
CREATE PROCEDURE calc_total(IN p_order_id INT)
BEGIN
    DECLARE v_total DECIMAL(10,2);
    SELECT SUM(subtotal) INTO v_total
    FROM Order_Detail
    WHERE order_id = p_order_id;

    UPDATE Order_Master
    SET total_amount = v_total
    WHERE order_id = p_order_id;
END //
DELIMITER ;


CALL calc_total(1);
CALL calc_total(2);

DELIMITER //
CREATE FUNCTION get_discount(p_amount DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE discount DECIMAL(10,2);
    IF p_amount >= 5000 THEN
        SET discount = p_amount * 0.10;
    ELSEIF p_amount >= 2000 THEN
        SET discount = p_amount * 0.05;
    ELSE
        SET discount = 0;
    END IF;
    RETURN discount;
END //
DELIMITER ;


SELECT get_discount(7000);

DELIMITER //
CREATE TRIGGER trg_update_stock
AFTER INSERT ON Order_Detail
FOR EACH ROW
BEGIN
    UPDATE Product
    SET stock = stock - NEW.quantity
    WHERE product_id = NEW.product_id;
END //
DELIMITER ;

CREATE TABLE Customer_North AS
SELECT * FROM Customer WHERE state = 'Delhi';

select * from Customer_North; 

CREATE TABLE Customer_West AS
SELECT * FROM Customer WHERE state = 'Maharashtra';

select * from Customer_West; 

CREATE TABLE Product_Basic AS
SELECT product_id, product_name, category_id FROM Product;

CREATE TABLE Product_PriceStock AS
SELECT product_id, price, stock FROM Product;

DELIMITER //
CREATE TRIGGER trg_update_total_amount
AFTER INSERT ON Order_Detail
FOR EACH ROW
BEGIN
    UPDATE Order_Master
    SET total_amount = (
        SELECT SUM(subtotal)
        FROM Order_Detail
        WHERE order_id = NEW.order_id
    )
    WHERE order_id = NEW.order_id;
END //
DELIMITER ;




CALL calc_total(2);
