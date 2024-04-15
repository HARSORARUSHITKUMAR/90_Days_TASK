use college;

create table temp1(
id int unique
);

insert into temp1 values(101);
insert into temp1 values(101);

select * from temp1;

create table emp(
id int primary key,
name varchar(50),
salary int default 35000
);

insert into emp (id,name)values (1,"rushit");

select * from emp;