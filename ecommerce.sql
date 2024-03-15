CREATE DATABASE ecommerce

CREATE TABLE gold_member_users(username varchar(25), signup_date date)

ALTER TABLE gold_member_users
ADD userid int NOT NULL Primary key;

INSERT INTO gold_member_users(userid, username, signup_date)
VALUES(001, 'John', '09-22-2017')
INSERT INTO gold_member_users(userid, username, signup_date)
VALUES(002, 'Mary','04-21-2017')
INSERT INTO gold_member_users(userid, username, signup_date)
VALUES (003, 'David', '12-15-2018')
INSERT INTO gold_member_users(userid, username, signup_date)
VALUES (004, 'Emily', '06-30-2019')
INSERT INTO gold_member_users(userid, username, signup_date)
VALUES (005, 'Michael', '10-12-2016')
INSERT INTO gold_member_users(userid, username, signup_date)
VALUES (006, 'Sophia', '02-03-2020')
INSERT INTO gold_member_users(userid, username, signup_date)
VALUES (007, 'Jacob', '08-19-2015')
INSERT INTO gold_member_users(userid, username, signup_date)
VALUES (008, 'Emma', '05-24-2021')
INSERT INTO gold_member_users(userid, username, signup_date)
VALUES (009, 'Daniel', '11-08-2017')
INSERT INTO gold_member_users(userid, username, signup_date)
VALUES (010, 'Olivia', '07-11-2018')
INSERT INTO gold_member_users(userid, username, signup_date)
VALUES (011, 'Matthew', '03-28-2019')
INSERT INTO gold_member_users(userid, username, signup_date)
VALUES (012, 'Isabella', '09-05-2020')

SELECT * FROM gold_member_users


CREATE TABLE users(userid int, username varchar(25), signup_date date)

INSERT INTO users(userid, username, signup_date)
VALUES (001, 'Matthew', '05-05-2019')
INSERT INTO users(userid, username, signup_date)
VALUES (002, 'Emma', '11-15-2019')
INSERT INTO users(userid, username, signup_date)
VALUES (003, 'James', '08-02-2016')
INSERT INTO users(userid, username, signup_date)
VALUES(004, 'Sophia', '04-25-2020')
INSERT INTO users(userid, username, signup_date)
VALUES(005, 'Alexander', '10-09-2018')
INSERT INTO users(userid, username, signup_date)
VALUES(006, 'Ava', '06-17-2017')
INSERT INTO users(userid, username, signup_date)
VALUES(007, 'Ethan', '01-30-2021')
INSERT INTO users(userid, username, signup_date)
VALUES(008, 'Mia', '07-22-2019')
INSERT INTO users(userid, username, signup_date)
VALUES(009, 'William', '03-14-2016')
INSERT INTO users(userid, username, signup_date)
VALUES(010, 'Charlotte', '09-07-2020')
INSERT INTO users(userid, username, signup_date)
VALUES(011, 'Benjamin', '05-18-2018')

ALTER TABLE users
ALTER COLUMN userid int NOT NULL;

ALTER TABLE users
ADD PRIMARY KEY (userid);

SELECT * FROM users


CREATE TABLE sales(userid INT NOT NULL PRIMARY KEY, username VARCHAR(25), created_date DATE, product_id int)

