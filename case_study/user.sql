drop database if exists demo;
create database demo;
use demo;
create table users (
 id  int primary key NOT NULL AUTO_INCREMENT,
 `name` varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 `status` bit
);

insert into users(`name`,email,country,`status`) values("Long","nguyenblong2412@gmail.com", "Việt Nam",0),
("Minh","minh1234@gmail.com", "Việt Nam",0),
("Huong","huong4312@gmail.com", "Việt Nam",0);