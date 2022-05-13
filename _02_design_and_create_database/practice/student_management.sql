create database if not exists student_management;
use student_management;
create table class(
class_id int primary key not null auto_increment,
class_name varchar (60) not null,
start_date datetime,
`status` bit
);

create table student(
student_id int primary key not null auto_increment,
student_name varchar (30) not null,
 address varchar(50),
 phone int(20),
 `status` bit,
 class_id int,
 foreign key (class_id) references class (class_id)
 );
 
 create table subjects(
 sub_id int primary key not null auto_increment,
 sub_name varchar(30),
 credit tinyint not null default 1 check (credit >= 1),
 `status` bit default 1
 );
 
 CREATE TABLE mark (
    mark_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    sub_id INT NOT NULL,
    student_id INT NOT NULL,
    mark FLOAT DEFAULT 0 CHECK (mark BETWEEN 0 AND 100),
    exam_times TINYINT DEFAULT 1,
    UNIQUE (sub_id , student_id),
    FOREIGN KEY (sub_id)
	REFERENCES subjects (sub_id),
    FOREIGN KEY (student_id)
	REFERENCES student (student_id)
);
