-- Create Database ecommerce
CREATE DATABASE ecommerce;

-- Use ecommerce database
USE ecommerce;

-- Create table gold_member_users
CREATE TABLE gold_member_users (
    userid INT,
    username VARCHAR(25),
    signup_date DATE
);

-- Insert data into gold_member_users
INSERT INTO gold_member_users (userid, username, signup_date)
VALUES
(001, 'John', '2014-09-02'),
(002, 'Mary', '2014-04-11'),
(004, 'Krishna', '2016-07-25'),
(005, 'Prathibha', '2017-03-12'),
(007, 'Kuldeep', '2019-11-18');

-- Create table users
CREATE TABLE users (
    userid INT,
    username VARCHAR(25),
    signup_date DATE
);

-- Insert data into users
INSERT INTO users (userid, username, signup_date)
VALUES
(001, 'John', '2014-09-02'),
(002, 'Mary', '2014-04-11'),
(003, 'Michel', '2015-01-15'),
(004, 'Krishna', '2016-07-25'),
(005, 'Prathibha', '2017-03-12'),
(006, 'Amit', '2018-09-30'),
(007, 'Kuldeep', '2019-11-18'),
(008, 'Baseer', '2020-05-02'),
(009, 'Jessica', '2021-08-14'),
(010, 'Emily', '2022-02-28');

-- Create table sales
CREATE TABLE sales (
    userid INT,
    username VARCHAR(25),
    created_date DATE,
    product_id INT
);

-- Insert data into sales
INSERT INTO sales (userid, username, created_date, product_id)
VALUES
(001, 'John', '2017-04-19', 2),
(002, 'Mary', '2019-12-18', 1),
(004, 'Krishna', '2018-10-10', 1),
(003, 'Michel', '2020-07-20', 3),
(001, 'John', '2019-10-23', 2),
(004, 'Krishna', '2017-08-15', 3),
(005, 'Prathibha', '2017-04-05', 1),
(005, 'Prathibha', '2018-06-20', 3),
(001, 'John', '2018-03-19', 3),
(002, 'Mary', '2016-12-20', 2),
(006, 'Amit', '2018-10-15', 2),
(006, 'Amit', '2019-02-28', 1),
(001, 'John', '2016-11-09', 1),
(001, 'John', '2016-05-20', 3),
(004, 'Krishna', '2019-12-25', 2),
(002, 'Michel', '2017-09-24', 1),
(001, 'John', '2017-03-11', 2),
(001, 'John', '2016-03-11', 1),
(002, 'Mary', '2016-11-10', 1),
(002, 'Mary', '2017-12-07', 2),
(007, 'Kuldeep', '2020-05-15', 2),
(007, 'Kuldeep', '2021-09-20', 3),
(003, 'Michel', '2020-05-20', 1),
(003, 'Michel', '2020-01-20', 3);

-- Create table products
CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(255),
    price int
);

-- Insert data into products
INSERT INTO products (product_id, product_name, price)
VALUES
(1, 'Mobile', 980),
(2, 'Ipad', 870),
(3, 'Laptop', 330);

-- Show all tables in the ecommerce database
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

-- Count all records of all four tables using single query
SELECT 'users' AS table_name, COUNT(*) AS record_count FROM users
UNION ALL
SELECT 'sales' AS table_name, COUNT(*) AS record_count FROM sales
UNION ALL
SELECT 'products' AS table_name, COUNT(*) AS record_count FROM products
UNION ALL
SELECT 'gold_members' AS table_name, COUNT(*) AS record_count FROM gold_member_users;

-- What is the total amount each customer spent on ecommerce company
SELECT s.userid, u.username, SUM(p.price) AS total_amount_spent
FROM sales s
JOIN products p ON s.product_id = p.product_id
JOIN users u ON s.userid = u.userid
GROUP BY s.userid, u.username
ORDER BY total_amount_spent DESC;

-- Find the distinct dates of each customer visited the website
SELECT DISTINCT s.created_date AS date, u.username AS customer_name
FROM sales s
JOIN users u ON s.userid = u.userid
ORDER BY date, customer_name;

-- Find the first product purchased by each customer using 3 tables(users, sales, product)
SELECT u.username AS customer_name,
       p.product_name AS first_product_purchased,
	   p.product_id AS product_id
FROM (
    SELECT userid, MIN(created_date) AS first_purchase_date
    FROM sales
    GROUP BY userid
) AS first_purchases
JOIN sales s ON first_purchases.userid = s.userid AND first_purchases.first_purchase_date = s.created_date
JOIN products p ON s.product_id = p.product_id
JOIN users u ON s.userid = u.userid;

-- What is the most purchased item of each customer and how many times the customer has purchased it
SELECT u.username AS customer_name,
       MAX(p.product_name) AS most_purchased_item,
       MAX(s.item_count) AS item_count
FROM (
    SELECT userid, product_id, COUNT(*) AS item_count
    FROM sales
    GROUP BY userid, product_id
) AS s
JOIN products p ON s.product_id = p.product_id
JOIN users u ON s.userid = u.userid
GROUP BY u.username;

-- Find out the customer who is not the gold_member_user
SELECT u.userid, u.username
FROM users u
LEFT JOIN gold_member_users gm ON u.userid = gm.userid
WHERE gm.userid IS NULL;

-- What is the amount spent by each customer when he was the gold_member user
SELECT u.userid,
       u.username,
       SUM(p.price) AS amount_spent
FROM sales s
JOIN users u ON s.userid = u.userid
JOIN products p ON s.product_id = p.product_id
JOIN gold_member_users gm ON u.userid = gm.userid
GROUP BY u.userid, u.username;

-- Find the Customers names whose name starts with M
SELECT username
FROM users
WHERE username LIKE 'M%';

-- Find the Distinct customer Id of each customer
SELECT DISTINCT userid, username
FROM users;

-- Change the Column name from product table as price_value from price
EXEC sp_rename 'products.price' , 'price_value' ,'COLUMN';

-- Change the Column value product_name – Ipad to Iphone from product table
UPDATE products
SET product_name = 'Iphone'
WHERE product_name = 'Ipad';

-- Change the table name of gold_member_users to gold_membership_users
EXEC sp_rename 'gold_member_users', 'gold_membership_users';

-- Create a new column as Status in the table gold_membership_users
ALTER TABLE gold_membership_users
ADD Status VARCHAR(3);

-- Update the Status column
UPDATE gold_membership_users
SET Status = CASE WHEN EXISTS (SELECT 1 FROM gold_membership_users gm WHERE gm.userid = gold_membership_users.userid)
                 THEN 'Yes'
                 ELSE 'No'
            END;

-- Start a transaction to delete user_ids 1 and 2 from users table and rollback the changes
BEGIN TRANSACTION;

-- Delete user_id 1
DELETE FROM users WHERE userid = 1;

-- Check the result after deleting user_id 1
SELECT * FROM users;

-- Rollback the changes
ROLLBACK TRANSACTION;

-- Check the result after rollback
SELECT * FROM users;

-- Insert one more record as same (3,'Laptop',330) as product table
INSERT INTO products (product_id, product_name, price_value) VALUES (3, 'Laptop', 330);

-- Write a query to find the duplicates in product table
SELECT product_name
FROM products
GROUP BY product_name
HAVING COUNT(*) > 1;

-- Show all records from products table
SELECT * FROM products;
