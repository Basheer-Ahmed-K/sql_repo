# SQL REPOSITORY

This repository contains SQL scripts and queries for SQL assignment.

# Question 1

## Steps

1. **Database Creation**: 
   - Create a new database named `ecommerce`.
   - Use the `ecommerce` database.

2. **Table Creation and Data Insertion**:
   - Create four tables: `gold_membership_users`, `users`, `sales`, and `products`.
   - Insert data into each table with respective data types.

3. **Show Tables**:
   - View all the tables created in the `ecommerce` database.

4. **Count Records**:
   - Count all the records in each table using a single query.

5. **Total Amount Spent by Each Customer**:
   - Calculate the total amount spent by each customer on the ecommerce platform.

6. **Distinct Dates of Customer Visits**:
   - Find the distinct dates on which each customer visited the website.

7. **First Product Purchased by Each Customer**:
   - Determine the first product purchased by each customer.

8. **Most Purchased Item by Each Customer**:
   - Identify the most purchased item by each customer along with the count of purchases.

9. **Customers Who are Not Gold Members**:
   - Find out customers who are not gold members.

10. **Amount Spent by Gold Member Customers**:
    - Calculate the amount spent by each customer when they were gold members.

11. **Customers Whose Name Starts with 'M'**:
    - Retrieve the usernames of customers whose names start with 'M'.

12. **Distinct Customer IDs**:
    - Get the distinct customer IDs and usernames.

13. **Rename Column and Value**:
    - Change the column name 'price' to 'price_value' in the products table.
    - Update the product name 'Ipad' to 'Iphone'.

14. **Rename Table**:
    - Rename the table 'gold_member_users' to 'gold_membership_users'.

15. **Add New Column**:
    - Add a new column 'Status' to the 'gold_membership_users' table to indicate gold membership status.

16. **Delete and Rollback**:
    - Delete user IDs 1 and 2 from the 'users' table and rollback the changes.

17. **Insert Duplicate Record**:
    - Insert a duplicate record into the 'products' table.

18. **Find Duplicates**:
    - Write a query to find duplicates in the 'products' table.

19. **View Products Table**:
    - View all records from the 'products' table.

# Question 2

## Steps

1. **Database Creation**: 
   - Create a new database named `Company`.

2. **Using the Database**: 
   - Use the `Company` database for further operations.

3. **Create Table**: 
   - Create a table named `sales` with columns `sell_date` (DATE) and `product_name` (VARCHAR(50)).

4. **Insert Data**: 
   - Insert data into the `sales` table with respective dates and product names.

5. **View Table**: 
   - View the records inserted into the `sales` table.

6. **Query Execution**:
   - Execute the query to find, for each date, the number of different products sold and their names.

# Question 3

## Steps

1. **Using the Database**: 
   - Use the existing `Company` database for further operations.

2. **Create Table**: 
   - Create a table named `dept_tbl` with columns `id_deptname` (VARCHAR(50)), `emp_name` (VARCHAR(50)), and `salary` (INT).

3. **Insert Data**: 
   - Insert data into the `dept_tbl` table with department names, employee names, and their respective salaries.

4. **View Table**: 
   - View the records inserted into the `dept_tbl` table.

5. **Query Execution**:
   - Execute the query to find the total salary of each department.

6. **Additional Data Insertion**:
   - Add another record into the `dept_tbl` table to test the query.

7. **Data Deletion**:
   - Delete the recently inserted data to maintain consistency.

# Question 4

## Steps

1. **Using the Database**: 
   - Ensure you are using the existing `Company` database.

2. **Create Table**: 
   - Create a table named `email_signup` with columns `id` (INT), `email_id` (VARCHAR(50)), and `signup_date` (DATE).

3. **Insert Data**: 
   - Insert data into the `email_signup` table with email IDs and signup dates.

4. **Replace NULL Values**: 
   - Update the `signup_date` column in the `email_signup` table to replace NULL values with '1970-01-01'.

5. **Query Execution**:
   - Execute the query to find Gmail accounts with the latest and first signup date, along with the difference between both dates.

# Question 5

## Steps

1. **Using the Database**: 
   - Ensure you are using the existing `Company` database.

2. **Create Table**: 
   - Create a table named `sales_data` with columns `product_id` (INT), `sale_date` (DATE), and `quantity_sold` (INT).

3. **Insert Data**: 
   - Insert data into the `sales_data` table with product IDs, sale dates, and quantities sold.

4. **Query Execution**:
   - Execute queries to analyze sales data:
     - Assign rank by partition based on product ID and find the latest product ID sold.
     - Retrieve the quantity sold value from a previous row and compare it with the current quantity sold.
     - Partition based on product ID and return the first and last values in the ordered set.


# Question 6 

Entity Relationship Diagram for University Database System:

Entities:
- Student (student_id, name, date_of_birth, email)
- Course (course_code, title, credit_hours)
- Instructor (instructor_id, name, office_location)
- Major (major_id, name)
- Department (department_id, name)

Relationships:
- Enroll (student_id, course_code) [Many-to-Many]
- Teach (instructor_id, course_code) [One-to-Many]
- BelongTo (course_code, department_id) [Many-to-One]
- HasMajor (student_id, major_id) [Many-to-One]

Attributes:
- Student: student_id (Primary Key), name, date_of_birth, email
- Course: course_code (Primary Key), title, credit_hours
- Instructor: instructor_id (Primary Key), name, office_location
- Major: major_id (Primary Key), name
- Department: department_id (Primary Key), name

Cardinality Constraints:
- Each student can enroll in multiple courses, and each course can have multiple enrolled students (Many-to-Many relationship between Student and Course).
- Each course is taught by exactly one instructor, and an instructor can teach multiple courses (One-to-Many relationship between Instructor and Course).
- Each student can have one major, and each major can have multiple students (Many-to-One relationship between Student and Major).
- Each course can belong to one department, and each department can offer multiple courses (Many-to-One relationship between Course and Department).



