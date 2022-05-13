create database if not exists point_management;
use point_management;
create table  student(
student_id int auto_increment primary key not null,
`name` varchar(50),
dob date,
class_name varchar(10),
gender varchar(10)
);
create table teacher(
teacher_id int primary key auto_increment,
teacher_name varchar(50),
phone int(10)
);
create table  subjects(
subject_id int auto_increment primary key not null,
subject_name varchar (50),
teachers_id int,
foreign key (teachers_id) references teacher(teacher_id)
);
create table point_table(
test_point int not null,
test_days date,
stu_id int,
sub_id int,
FOREIGN key (stu_id) references student(student_id),
foreign key (sub_id) references subjects(subject_id)
);
drop database point_management;-- 

