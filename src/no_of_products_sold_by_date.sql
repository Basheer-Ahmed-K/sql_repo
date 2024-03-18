CREATE DATABASE Company;

USE Company
GO

CREATE TABLE sales(sell_date DATE, product_name VARCHAR(50));

INSERT INTO sales VALUES
('2020-05-30', 'Headphones'), 
('2020-06-01','Pencil'), 
('2020-06-02','Mask'), 
('2020-05-30','Basketball'), 
('2020-06-01','Book'), 
('2020-06-02', ' Mask '), 
('2020-05-30','T-Shirt'),
('2020-06-03', 'Sunglasses'),
('2020-06-04', 'Water Bottle'),
('2020-06-05', 'Notebook'),
('2020-06-03', 'Running Shoes'),
('2020-06-04', 'Backpack'),
('2020-06-05', 'Umbrella'),
('2020-06-03', 'Gaming Mouse'),
('2020-06-04', 'Laptop Sleeve'),
('2020-06-05', 'Wireless Keyboard'),
('2020-06-03', 'Desk Lamp');

SELECT * FROM sales;

SELECT sell_date, COUNT(DISTINCT product_name) AS num_sold,
STRING_AGG(product_name,', ') AS product
FROM sales
GROUP BY sell_date
ORDER BY num_sold;

