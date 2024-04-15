create database xyz;

use xyz;

-- Query 2
-- create employee table inside the DB store emp info (id,name,salary)

-- QUERY 3
-- add following information in the DB 
-- 1,'adam',25000
-- 2,'bob',30000
-- 3,'cassy',40000

-- QUERY 4
-- select and view all your table data

create table employee(
id int primary key,
name varchar(50),
salary int
); 

insert into employee values(1,"adam",25000),(2,"bob",30000),(3,"cassy",40000);

-- QUERY 4

select * from employee;

