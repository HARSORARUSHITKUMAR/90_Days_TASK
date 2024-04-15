-- **************** CREATE DATABASE *************************** --

create database colleges;

-- ******************** USE DATABASE *************************** --

use colleges;

-- ******************** CREATE TABLE *************************** --

create table students(
rollno int primary key,
name varchar(50),
marks int not null,
grade varchar(1),
city varchar(20)
);

-- ***********************  INSERT VALUE OR DATA(RECORD) ******************************* --

insert into students values(101,"anil",78,"C","pune"),
(102,"bhumika",93,"A","mumbai"),
(103,"chetan",85,"B","mumbai"),
(104,"dhruv",96,"A","delhi"),
(105,"emanuel",12,"F","delhi"),
(106,"farah",82,"B","delhi");


-- ********************** SELECT QUERY **************************** --
-- ******* SELECT ANY DATA  ********* --

select name , marks from students;

-- ************** SELECT ALL  ****************** --

select * from students;

-- ****************** DISTINCT ************************ --
-- **** TO USED TO UNIQUE VALUES *** --
-- *** DO NOT SHOW DUPLICATES VALUES IN THIS SYNTAX *** --

select distinct city from students;

-- ******************************************************* where clause **********************************************--
-- *********** to define some condition
select * from students where marks > 80;

select * from students where city = "mumbai";

select * from students
where marks > 80 and city = "delhi";

-- *********************** where clause with operators ********************--
-- ************ Ariythmetic op

select * from students
where marks+10 > 100;

-- *********************** compariosn op *****************--

select * from students 
where marks = 93;

-- ************************** Logical op *****************--

-- *************** AND ****************--

select * from students 
where marks > 90 and city = "mumbai";

-- ******************* OR **************************** --
-- *** TO CHECK FOR ONE OF THE CONDITION TO BE TRUE *** --

select * from students 
where marks > 90 or city = "mumbai";

-- *** BETWEEN *** --
-- SELECTS FOR A GIVEN RANGE  --

select * from students 
where marks between 80 and 90;

-- *** IN *** --
-- MATCHES ANY VALUE IN THE LIST --

select * from students 
where city in  ("delhi","mumbai");

-- *** NOT *** --
-- TO NEGATE THE GIVEN CONDITION --

select * from students 
where city not in ("delhi","mumbai");

-- ***************** LIMIT CLAUSE ***************** --
-- SETS AN UPPER LIMIT ON NUMBER OF(TUPLES) ROWS TO BE RETURNED  --

select * from students limit 3;

-- other way with WHERE CONDITION --

select * from students 
where marks > 70 
limit 3;

-- *************** ORDER BY CLAUSE ****************** --
-- TO SORT IN ASCENDING(ASC) OR DESCENDING(DESC) --

select * from students 
order by city asc;

select * from students 
order by city desc;

-- **************************** AGGREGATE FUNCTIONS ********************************* --
-- AGGREGATE FUNCTIONS PERFORM A CALCULATION ON A SET OF VALUES,AND RETURN A SINGLE VALUE --

-- TYPES OF FUNCTIONS --
-- COUNT()
-- MAX()
-- MIN()
-- SUM()
-- AVG()

-- ----- COUNT() ---------- --

select count(rollno) from students;

-- ------ MAX() ------ --

select max(marks) from students;

-- ------ MIN() ------ --

select min(marks) from students;

-- ---------- SUM() ---------- --

select sum(marks) from students;	

-- ------- AVG() ------ --

select avg(marks) from students;

-- ****************************** GROUP BY CLAUSE ******************************** --
-- GROUP ROWS THAT HAVE THE SAME VALUE INTO SUMMARY ROWS --
-- IT COLLECTS DATA FROM MULTIPLE RECORDS AND GROUPS THE RESULT BY ONE OR MORE COLUMN --

-- GENERALLY WE USE BY WITH SOME AGGREGRATION FUNCTION --

select city,count(name)
from students 
group by city;

select city from students 
group by city;

-- AVG MARKS OF STUDENTS IN EACH CITY

select city,avg(marks)
from students
group by city;


-- *********************** PRACTICE QUESTION ***************************** --
-- WRITE THE QUERY TO FIND AVG MARKS IN EACH CITY IN ASCRNDING ORDER --

select city,avg(marks)
from students
group by city 
order by  avg(marks);

-- ************************ PRACTICE QUESTION ***************************** --
-- FOR THE GIVEN TABLE, FIND THE TOTAL PAYMENT ACCORDING TO EACH PAYMENT METHOD  --

create table customer(
customer_id int primary key,
customer_name varchar (50),
mode varchar (35),
city varchar (50)
);

insert into customer values(101,"Olivia Barret","Net Banking","Portland"),
(102,"Ethan Sinclair","Credit Card","Miami"),
(103,"Maya Hernandez","Credit Card","Seattle"),
(104,"Liam Donovan","Net Banking","Denver"),
(105,"Sophia Nguyen","Credit Card","New Orleans"),
(106,"Caleb Foster","Debit Card","Minneapolis"),
(107,"Ava Patel","Debit card","Phoenix"),
(108,"Lucas Carter","Net Banking","Boston"),
(109,"Isabella Martinez","Net Banking","Nashville"),
(110,"Jackson Brooks","Credit Card","Boston");


select * from customer;

-- FOR THE GIVEN TABLE, FIND THE TOTAL PAYMENT ACCORDING TO EACH PAYMENT METHOD  --

	select mode,count(customer_name)
	from customer
	group by mode;
    
    -- ****************************** HAVING CLAUSE ************************************** --
    --  SIMILAR TO WHERE I.E. APPLIES SOME CONDITION ON ROWS--
    -- USED WHEN WE WANT TO AAPLY ANY CONDITION AFTER GROUPING. --
    -- APPLIES SOME CONDITION ON GROUPING --
    
    -- COUNT NUMBER OF STUDENTS IN EACH CITY WHERE MAX MARKS CROSS 90 --
    
    select count(name),city
    from students
    group by city
    having max(marks) > 90;
    
    -- *** GENERAL ORDER OF WRITTING CLAUSES *** --
    -- SELECT COLUMN(S)
    -- FROM TABLE_NAME
    -- WHERE CONDITION
    -- GROUP BY COLUMN(S)
    -- HAVING CONDITION
    -- ORDER BY COLUMN(S) ASC;
    
    -- *** EXAMPLE *** --
    
    select city from students 
    where grade = "a"
    group by city
    having max(marks) > 93;
    
    -- ******** TABLE RELATED QUERIES ******** --
    -- *** UPDATE *** --
    -- HOW ON OFF SQL SAFE MODE ON WORKBENCH --
    -- SET SQL_SAFE_UPDATES=0; --
    
    SET SQL_SAFE_UPDATES=0;
    
    
    update students
    set grade = "O"
    where marks between  90 and 100;
    
    select * from students;
    
    
    
    update students
    set marks = 82
    where grade = "F";
    
    update students 
    set grade = "B"
    where marks between 80 and 90;
    
    select * from students;
    
    update students 
    set marks = marks + 1;
    
    update students
    set marks = 12
    where rollno = 105;
    
    -- DELETE --
    
    delete from students
    where marks < 33;
    
    select * from students;
    
    -- *********************** CASCADING FOR FK ************************* --
    -- ** ON DELETE CASCADE ** --
    -- WHEN WE CREATE A FOREIGN KEY USING THIS OPTION IT DELETES REFERENCES ROWS IN THE CHILD TABLE
    -- WHEN THE REFERENCED ROW IS DELETED IN THE PARENT TABLE WHICH HAS A PRIMARY KEY
    
    -- ** ON UPDATE CASCADE ** --
    -- WHEN WE CREATE FOREIGN KEY USING UPDATE CASCADE THE REFERENCES ROW ARE UPDATED IN THE TABLE
    -- WHEN THE REFERENCED ROW IS UPDATED IN THE PARENT TABLE WHICH HAS A PRIMARY KEY
    
    create table department(
id int primary key,
name varchar(50)
);

insert into department values (101,"DSA"),
(102,"C++"),
(103,"DBMS"),
(104,"WD"),
(105,"REACT");

select * from department;


create table teachers(
id int primary key,
name varchar(50),
dept_id int,
foreign key (dept_id) references department (id)
on update cascade
on delete cascade
);

insert into teachers values (101,"HKP",101),
(102,"ADAM",104),
(103,"EVE",102),
(104,"KHER",105),
(105,"JARDOS",103);

select * from teachers;

update department
set id = 106
where id = 105;
