drop database if exists student_management;
create database if not exists student_management;
use student_management;
create table class(
id int primary key not null auto_increment,
`name` varchar (60) not null,
start_date date not null,
`status` bit
);

create table student(
 id int primary key not null auto_increment,
`name` varchar (30) not null,
 address varchar(50),
 phone varchar(20),
 `status` bit,
 class_id int not null,
 foreign key (class_id) references class (id)
 );
 
 create table subjects(
 id int primary key not null auto_increment,
 `name` varchar(30),
 credit tinyint not null default 1 check (credit >= 1),
 `status` bit default 1
 );
 
 CREATE TABLE mark (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    sub_id INT NOT NULL,
    student_id INT NOT NULL,
    mark FLOAT DEFAULT 0 CHECK (mark BETWEEN 0 AND 100),
    exam_times TINYINT DEFAULT 1,
    UNIQUE (sub_id , student_id),
    FOREIGN KEY (sub_id)
	REFERENCES subjects (id),
    FOREIGN KEY (student_id)
	REFERENCES student (id)
);
insert into class (`name`,start_date,`status`) values ('A1','2008-12-20',1);
insert into class (`name`,start_date,`status`) values ('A2','2009-12-22',1);
insert into class (`name`,start_date,`status`) values ('B3',current_date(),0);

insert into student (`name`,address,phone,`status`,class_id) values ("Hung", "Ha Noi", "0912113113", 1 , 1);
insert into student (`name`,address,`status`,class_id) values ("Hoa", "Hai Phong",  1 , 1);
insert into student (`name`,address,phone,`status`,class_id) values ("Manh", "HCM", "0912113113", 0 , 2);

insert into subjects (`name`,credit,`status`) values ( "CF",5,1),
 ( "C",6,1),
 ( "HDJ",5,1),
 ( "RDBMS",10,1);

insert into mark (sub_id, student_id, mark, exam_times) values ( 1,1,8,1),
																( 1,2,10,2),
																( 2,1,12,1);

