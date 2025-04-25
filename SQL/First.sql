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





