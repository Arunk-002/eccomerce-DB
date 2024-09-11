E-Commerce Database
Project Description
This SQL script defines the schema for a basic e-commerce system. It includes tables for managing customers, product categories, products, shopping carts, and cart items.

Database Structure
1. Customer
This table stores customer information.

Columns:
customer_id (Primary Key): Unique identifier for each customer.
c_name: Customer's full name.
email: Customer's email address (must be unique).
c_password: Hashed password for account authentication.
phone_number: Customer's phone number (optional).
c_address: Customer's address (optional).
2. Category
This table holds the different product categories available in the store.

Columns:
category_id (Primary Key): Unique identifier for each category.
category_name: Name of the product category.
3. Product
This table contains details about the products being sold.

Columns:
product_id (Primary Key): Unique identifier for each product.
p_name: Name of the product.
p_description: Description of the product.
price: Price of the product.
stock_quantity: Quantity of the product available in stock.
category_id (Foreign Key): Links to the Category table.
4. Cart
This table manages customer shopping carts.

Columns:
cart_id (Primary Key): Unique identifier for each cart.
customer_id (Foreign Key): Links to the Customer table.
5. Cart_Item
This table manages the items in a shopping cart.

Columns:
cart_item_id (Primary Key): Unique identifier for each cart item.
cart_id (Foreign Key): Links to the Cart table.
product_id (Foreign Key): Links to the Product table.
quantity: Quantity of the product in the cart.
Usage
Database Setup:

Ensure you have MySQL installed on your system.
Create a new database by running the following command:
CREATE DATABASE ecommerce;

Run the provided SQL script to create the required tables in the ecommerce database.
Script Execution:

Use a tool like MySQL Workbench or the MySQL command-line client to execute the script.
Example command:
mysql -u username -p ecommerce < e-commerce.session.sql

Future Improvements
Add tables for Orders and Payments to track purchases and transactions.
Implement additional relationships like Product Reviews or Wishlists.
