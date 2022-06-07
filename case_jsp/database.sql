drop database if exists case_study_servlet;
create database case_study_servlet;
use case_study_servlet;

create table customer_type(
id varchar(45) primary key,
customer_type varchar (45)
);

create table customer(
id varchar(45) primary key,
type_id varchar(45),
foreign key (type_id) references customer_type(id),
`name` varchar(45),
birthday date,
gender bit,
id_card varchar(45),
phone varchar(45),
email varchar(45),
address varchar (45),
`status` bit default 0 
);

create table service_type(
service_type_id varchar (45) primary key,
service_type_name varchar (45)
);

create table rent_type(
rent_type_id varchar (45) primary key,
rent_type_name varchar(45),
rent_cost double
);

create table service( 
service_id varchar(45) primary key,
service_name varchar(45),
service_area double,
service_cost double,
service_max_people int,
rent_type_id varchar (45),
foreign key (rent_type_id) references rent_type(rent_type_id),
service_type_id varchar(45),
foreign key (service_type_id) references service_type(service_type_id),
standard_room varchar(45),
description_other_convenience varchar(45),
pool_area double,
floor_number int,
`status` bit default 0
);

create table if not EXISTS `position`(
position_id INT PRIMARY KEY AUTO_INCREMENT,
position_name VARCHAR(45)
);
create table if not EXISTS `education_degree`(
education_degree_id INT PRIMARY KEY AUTO_INCREMENT,
education_degree_name VARCHAR(45)
);
create table if not EXISTS division(
division_id INT PRIMARY KEY AUTO_INCREMENT,
division_name VARCHAR(45)
);
create TABLE if not EXISTS `user`(
username VARCHAR(255) PRIMARY key,
`password` varchar(255)
);
create table if not EXISTS employee( 
employee_id int(45) PRIMARY key auto_increment ,
employee_name VARchar(45) not null,
employee_birthday DATE not null,
employee_id_card VARCHAR(45) not null,
employee_salary DOUBLE not null,
employee_phone VARCHAR(45) not null,
employee_email varchar(45),
employee_address varchar(120),
position_id INT,
education_degree_id INT ,
division_id INT,
username varchar(45),
`status` bit default 0,
FOREIGN KEY (position_id) REFERENCES `position`(position_id) ,
FOREIGN KEY (education_degree_id) REFERENCES `education_degree`(education_degree_id),
FOREIGN KEY (division_id) REFERENCES `division`(division_id) ,
FOREIGN KEY(username) REFERENCES `user`(username)
);
create table if not EXISTS `role`(
role_id int PRIMARY key AUTO_INCREMENT,
role_name varchar(45)
);
create table if not EXISTS `user_role`(
role_id int,
username varchar(255),
PRIMARY KEY(role_id,username),
FOREIGN KEY (role_id) REFERENCES `role`(role_id),
FOREIGN KEY (username) REFERENCES `user`(username)
);

