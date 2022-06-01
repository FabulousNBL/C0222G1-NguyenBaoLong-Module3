drop database if exists demo;
create database demo;
use demo;
create table users (
 id  int primary key NOT NULL AUTO_INCREMENT,
 `name` varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120)
 
);

insert into users(name,email,country) values("Long","nguyenblong2412@gmail.com", "Việt Nam"),
("Minh","minh1234@gmail.com", "Việt Nam"),
("Huong","huong4312@gmail.com", "Việt Nam");