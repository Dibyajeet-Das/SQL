show databases;
CREATE DATABASE newdb;
use newdb;
show tables;
select * From booking;
drop table booking;
create Database rahul;
Drop Database rahul;
ALTER DATABASE newdb READ ONLY = 0;
Drop Database newdb;
use rahul;
CREATE TABLE employees(
  employee_id INT,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  hourly_date DECIMAL(15),
  hire_date DATE
);
Select * From workers;

RENAME table workers to employees;
Drop table name;
-- Here we are adding new values to the table --
ALTER TABLE employees ADD Phone_Number VARCHAR(50);
-- we also change the column name using the alter keyword using rename and the column name --
ALTER TABLE employees RENAME COLUMN Phone_Number to Email;
-- we also modify the column --
ALTER Table Employees MODIFY Column email varchar(100);
-- we can aslo move our column from one place to another --
Alter Table employees MODIFY email varchar(100) after last_name;
-- we can aslo to the first postion only mentioning First in the modify --
alter table employees MODIFY email varchar(100) First;
-- Simply we can remove the column --
Alter Table employees Drop Column email;

-- Inserting Rows in the table --
INSERT INTO employees
values(1, "SpongBob", "SquarePants", 25.50, "2023-01-05"),
(2, "Emma", "Andreson", 35.00, "2022-04-22"),
(3, "Camilia", "Talyor", 18.20, "2023-04-25"),
(4, "Luna", "Wilson", 22.80, "2023-03-18");
delete from employees;
Select * From employees;
insert into employees(employee_id,first_name, last_name)
value(5,"Sachin","Yahoo"); 

-- We can Select sepcific column name and call them  --
Select first_name,last_name from employees;
-- Using where Clause to find the sepcific Value --
SELECT * FROM employees WHERE  first_name = "Camilia";
-- Using smaller than and greaterthan symbol to find the values--
Select * from employees where hourly_date >= 25;
select * from employees where employee_id != 1;
Select * from employees where hire_date Is NUll;
Select * From employees where hire_date IS NOT NULL;

-- Using Update And delete  --
SET SQL_SAFE_UPDATES = 0;
UPDATE employees
SET hourly_date = 45.20,
    hire_date = '2022-04-21'
WHERE employee_id = 5; -- if we will not mention this this effect the all the rows --
SET SQL_SAFE_UPDATES = 1;

-- if we want to delete the whole the data --
delete from employees
WHERE employee_id = 5; -- it is recommended to use the the where clause to delte the particular value --
select * From employees;
create table test(
   my_date DATE,
   my_time TIME,
   my_dateTime datetime
);
select * from test;

Insert into test 
-- TO SAVE THE CURRENT DATE AND TIME --
-- VALUES(CURRENT_DATE(),CURRENT_TIME(),NOW()); --
-- We can add and substract through which we can add previous date or the upcoming date both for date and time--
VALUES(CURRENT_DATE() + 1,CURRENT_TIME() + 1,NOW() + 1);

-- uniquie constrant , all values in the column must be different we can add this constraint -- 
-- when we create a table or after the table is created --
CREATE table product(
    product_id INT,
    product_name VARCHAR(15) UNIQUE,
    product_price INT
);
-- if we forget to add the uniquie constarint we can add it later to the table --
Alter table product
ADD constraint
unique(product_id);

INSERT INTO product 
values (1, "Soda", 2.5),
       (2, "Ice Cream", 14.5),
       (3, "Chips", 10.00);
SELECT * FROM product;

-- NOT NULL constarint here we add the constraint so that the value will not be null --
-- we can add at the end of the names of the table we are creating --
-- another way to add if our table is already created --
Alter Table Product
modify product_id INT NOT NULL;
-- Check --
-- check is a constarint that used to limit the value of range we are adding in our table --
-- if add it in a column it will allow only Specific values --
CREATE Table School (
  studemt_id INT,
  Student_name VARCHAR(25),
  Student_marks INT,
  Constraint Check_Mark CHECK(Student_marks >= 100)
);
-- Similarly if the table is present we can add in this manner --
-- ALTER Table School--
-- ADD CONSTRAINT Check_Mark CHECK(Student_marks >= 100)--
-- Remove it Then --
-- Alter Table School --
-- Drop CHECK Check_Mark; --

-- Default write the default value for any column when cretaing a table or after table is --
-- is created you can add specify the thinks to add and the rest of the values will be addedd --
-- automatically by default --
-- Alter Table School --
-- Alter Student_marks SET Default 0; --

-- Auto_Increment is a keyword which automatically generates the uniquie and --
-- sequentially increasing the value when new rows are being inserted --
-- it can only applied to the column that is set as a key --
create table transaction (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount decimal(5, 2)
);
select * from transaction;
INSERT into transaction(amount) values (9.50);

-- FOREIGN KEY -> Using a Foreign key we can provide link between two tables 
-- A foreign key is the field in one table that refers to the primary key of
-- other table. The Table with the foreign key is called as CHild table
-- and table with primary is called as referenced
-- 
Create Table Customers (
    customer_id INT Primary Key AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

Select * from Customers;
INSERT into Customers(first_name, last_name)
values("Mike" , "Tylor"),
	   ("Alex" , "Mercer"),
       ("Jhon" , "Korner");
-- Creating a link between the customer table and the transaction Table
Create Table Transactions (
     transaction_id INT Primary Key Auto_Increment,
     amount Decimal(5, 2),
     customer_id Int,
     Foreign Key(customer_id)references Customers(customer_id) 
);
Select * From Transactions;
-- To Drop the foreign key we can use --
Alter Table Transactions
Drop FOREIGN KEY transactions_ibfk_1;

-- To Add The foreign key in the table --
Alter Table Transactions 
Add Constraint fk_Customer_id
foreign key (customer_id) references Customers(customer_id);


select * from Transactions;
insert Into Transactions (amount, customer_id)
value(4.99, 3),
     (2.42, 3),
     (1.71, 3),
     (3.33, NUll);

-- JOIN Clause --
-- A JOin is clause which is used to combine rows from two or more tables --
-- INNER JOIN --
-- The INNERJOIN Keyword selects record that have matching values --
-- we can aslo use Join Keyword same as Inner Join -- 
SELECT * FROM
Transactions INNER JOIN Customers
ON Transactions.customer_id = Customers.customer_id;
-- Joining any matching row based on some link --
SELECT transaction_id, amount, first_name, last_name
from Transactions INNER JOIN Customers
on Transactions.customer_id = Customers.customer_id;

-- Left Join it will return all records from the left table, and the matching 
-- record form the right table the result will come as 0 if no matching 
-- records are found 
-- As we can see all record will be displayed even the null value will also get displayed
SELECT transaction_id, amount, first_name, last_name
from Transactions LEFT JOIN Customers
on Transactions.customer_id = Customers.customer_id;
-- Similar think will be done with the right join --
SELECT transaction_id, amount, first_name, last_name
from Transactions RIGHT JOIN Customers
on Transactions.customer_id = Customers.customer_id;

-- Functions in My SQL -- 
-- A function is a stored Program that is used to pass the parameter --
-- There are a alot of functions some of them are --
SELECT COUNT(amount) AS count FROM Transactions; -- we can also add the where clause --
-- we are using AS it helping to make our output look more good in look --
SELECT MAX(amount) AS "Maximum Amount" FROM Transactions;
SELECT MIN(amount) AS "Minimum Amount" FROM Transactions;
SELECT AVG(amount) AS average FROM Transactions;
SELECT SUM(amount) AS sum FROM Transactions;
SELECT CONCAT(first_name," ",last_name) AS "Full Name"
From Customers; -- Adding The Value -- 

-- AND,OR and Not (Using logical operator to get the value) --
CREATE TABLE DEMO (
     Customer_id INT,
     first_name VARCHAR(50),
     last_name VARCHAR(50),
     Address VARCHAR(50),
     City VARCHAR(50),
     POstal_Code INT,
     Country VARCHAR(50)
);
Select * From Demo;
Insert INTO Demo
Value (1,"Alfreds", "Futterkiste","Obere Str. 57","Berlin",12209,"Germany"),
      (2,"Ana Trujillo","Emparedados y helados","Avda. de la Constitución 2222","México D.F.",05021,"Mexico"),
	  (3,"Antonio Moreno", "Taquería","Mataderos 2312","México D.F.",05023,"Mexico"),
      (4,"Thomas", "Hardy","120 Hanover Sq.","London",68306,"UK"),
      (5,"Christina", "Berglund","Berguvsvägen 8","Luleå",95822,"Sweden"),
      (6,"Elizabeth", "Lincoln","23 Tsawassen Blvd.","Tsawassen",1010,"Argentina"),
      (7,"Francisco", "Chang","Sierras de Granada 9993","México D.F",05022,"Mexico"); 
-- Using AND Logical --
-- When both the conditons are true then only the value will get execeuted-- 
Select * From Demo where City = "México D.F." AND Country = "Mexico";
-- Using OR Logical -- 
-- where only one condition needs to true --
-- where we can check more than one condtion should be true --
Select * From Demo where  City = "Berlin" OR City = "Mexico";
-- Using Not --
 Select * From Demo where NOT City = "Berlin" AND NOT Country = "Mexico";
 -- Between is used where starting and ending value is defined --
 -- The Between OPerator Selects value withina given range
 Select * From Demo where Customer_id BETWEEN 1 AND 4;
 -- IN Operator --
 -- The IN Operator allows you to specify multiple values in a WHERE clause --
 -- The IN Operator is a Shorthand for multiple Or Conditions -- 
 Select * From Demo WHERE City IN ("Berlin","London");
 
 --  Wild Cards in My SQL % _--
 -- Used to Substitute one or more Characters in a String  --
 -- % in a letter helps to find any number of random characters --
 -- we will use LIke keyword instead of the "=" sign to find the character --
 SELECT * FROM Demo;
 SELECT * FROM Demo WHERE first_name LIKE "a%";
 -- Here we are finding the last letter --
 SELECT * FROM Demo WHERE last_name LIKE "%o";
 -- The underscore wild card represents only one letter --
 -- Filling the gaps --
 SELECT * FROM Demo WHERE Country LIKE "_exico";
 SELECT * FROM Demo WHERE POstal_Code LIKE "502_";
 
 -- Order BY Clause --
 -- It Helps to sort the value either in ascending or descending order --
 Select * From Demo;
 SELECT * FROM Demo ORDER BY first_name;
 SELECT * FROM Demo ORDER BY last_name DESC;
 SELECT * FROM Demo ORDER BY last_name, first_name ASC;
 
 -- Limit clause --
 -- generally used in large no off data set to return the value --
 -- limit clause is used to return the specific number of records availabe in the record  --
 Select * From Demo Limit 3;
 select * From Demo order by last_name desc limit 3;
 
 -- UNION Operator in my sql --
 -- Helps to Combine two or more values 
 -- in order to join two tables they need to have same number of columns --
 select first_name, last_name From Customers
 UNION
 select first_name, last_name From Demo;
 -- we can see the combination of value 
 -- we can use UNION ALL where all the duplicate value will also get implemented--
 