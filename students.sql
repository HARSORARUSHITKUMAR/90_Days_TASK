create table students(
rollno int primary key,
name varchar(50),
marks int not null,
grade varchar(1),
city varchar(20)
);

insert into students values(101,"anil",78,"C","pune"),
(102,"bhumika",93,"A","mumbai"),
(103,"chetan",85,"B","mumbai"),
(104,"dhruv",96,"A","delhi"),
(105,"emanuel",12,"F","delhi"),
(106,"farah",82,"B","delhi");

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

