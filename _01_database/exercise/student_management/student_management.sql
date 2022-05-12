create database if not exists student_management;
use student_management;
create table if not exists class(
id int primary key,
`name` varchar(50)
);
create table if not exists teacher (
id int primary key,
`name` varchar(50),
age int,
country varchar(50)
);
insert into class values (1,"10A");
insert into class values (2,"10B");
insert into teacher values(1,"Long",18,"Da Nang");
insert into teacher values(2,"Linh",18,"Da Nang");
select * from class;
select * from teacher;
update class set `name` = "11A" where id = 1;
update teacher set `name`= "Truong";-- 
drop database student_management;-- 