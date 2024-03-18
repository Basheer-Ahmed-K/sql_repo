-- Using database Company

USE Company
GO

-- Creating Table dept_tbl with id_deptname, emp_name, and salary

CREATE TABLE dept_tbl(id_deptname VARCHAR(50), emp_name VARCHAR(50), salary int)

-- Inserting data into dept_tbl

INSERT INTO dept_tbl VALUES
('1111-MATH', 'RAHUL', 10000), 
('1111-MATH', 'RAKESH', 20000), 
('2222-SCIENCE', 'AKASH', 10000), 
('2222-SCIENCE', 'ANDREW', 10000), 
('2222-CHEM', 'ANKIT', 25000), 
('3333-CHEM', 'SONIKA', 12000), 
('4444-BIO', 'HITESH', 2300), 
('4444-BIO', 'AKSHAY', 10000),
('1111-MATH', 'RAJESH', 15000),
('1111-MATH', 'ROHAN', 18000),
('2222-SCIENCE', 'AARAV', 12000),
('2222-SCIENCE', 'NEHA', 13000),
('3333-CHEM', 'PRIYA', 11000),
('3333-CHEM', 'RAJ', 12500),
('4444-BIO', 'KAVYA', 2400),
('4444-BIO', 'RISHABH', 2100),
('5555-PHYSICS', 'VIVEK', 14000),
('5555-PHYSICS', 'SHIVANI', 13500);

-- Viewing the table

SELECT * FROM dept_tbl;

--Query to find the Total Salary of each Department

SELECT SUBSTRING(id_deptname, CHARINDEX('-', id_deptname)+1, LEN(id_deptname)-CHARINDEX('-', id_deptname)) AS dept_name,
SUM(salary) AS total_salary
FROM dept_tbl
GROUP BY id_deptname;

-- Adding another data into dept_tbl to test query

INSERT INTO dept_tbl VALUES ('5555-PHYSICS', 'SHIVANI', 13500);

-- Deleting the inserted data

DELETE FROM dept_tbl WHERE emp_name = 'SHIVANI' AND salary = 13500;

