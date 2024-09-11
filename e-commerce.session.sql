--@block
USE ecommerce;

--@block
CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    c_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    c_password VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    c_address TEXT
);

--@block
CREATE TABLE Category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

--@block
CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    p_name VARCHAR(255) NOT NULL,
    p_description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);
--@block
CREATE TABLE Cart (
    cart_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE
);

CREATE TABLE Cart_Item (
    cart_item_id INT AUTO_INCREMENT PRIMARY KEY,
    cart_id INT,
    product_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (cart_id) REFERENCES Cart(cart_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Product(product_id) ON DELETE CASCADE
);

--@block
CREATE TABLE `Order` (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    total_amount DECIMAL(10, 2) NOT NULL,
    order_status VARCHAR(50) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE
);

--@block
CREATE TABLE Order_Item (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Product(product_id) ON DELETE CASCADE
);

--@block
INSERT INTO Customer (c_name, email, c_password, phone_number, c_address) VALUES
('nick', 'nick@example.com', '123ss', '995703401', 'tvm'),
('Bobby', 'bob@example.com', 'sdafads', '995703423', 'mlp');

--@block
INSERT INTO Category (category_name) VALUES
('Electronics'),
('Books'),
('Clothing');

--@block
INSERT INTO Product (p_name, p_description, price, stock_quantity, category_id) VALUES
('Smartphone', 'good  camera', 699.99, 50, 1),
('Laptop', 'Lightweight laptop', 999.99, 30, 1),
('Aadujeevitham', 'novel by benyamin', 14.99, 100, 2),
('T-shirt', 'Cotton in various colors', 9.99, 200, 3);

--@block
INSERT INTO Cart (customer_id) VALUES
(1),
(2);

--@block
INSERT INTO Cart_Item (cart_id, product_id, quantity) VALUES
(1, 1, 1),  -- nick cart has 1 Smartphone
(1, 3, 2),  -- nick cart has 2 copies of aadujeevitham
(2, 2, 1),  -- Bob's cart has 1 Laptop
(2, 4, 3);  -- Bob's cart has 3 T-shirts

--@block
INSERT INTO `Order` (customer_id, total_amount, order_status) VALUES
(1, 724.97, 'Processing'),  -- Total for nicks's order
(2, 1029.96, 'Shipped');    -- Total for Bob's order

--@block
INSERT INTO Order_Item (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 699.99),  -- nicks's order includes 1 Smartphone at 699.99
(1, 3, 2, 14.99),   -- nicks's order includes 2 copies of aadujeevitham at 14.99 each
(2, 2, 1, 999.99),  -- Bob's order includes 1 Laptop at 999.99
(2, 4, 3, 9.99);    -- Bob's order includes 3 T-shirts at 9.99 each


--@block
SELECT c_name from Customer;
