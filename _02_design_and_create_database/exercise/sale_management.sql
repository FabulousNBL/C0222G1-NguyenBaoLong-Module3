drop database if exists quan_ly_ban_hang;
create database  quan_ly_ban_hang;
use quan_ly_ban_hang;
create table customer(
id int auto_increment primary key,
customer_name varchar(50),
customer_age int
);


create table orders(
id int not null auto_increment primary key, 
customer_id int,
foreign key (customer_id) references customer(id),
odate date,
order_total_price double
);

create table product(
id int not null auto_increment primary key,
product_name varchar (30),
price double
);

create table order_detail(
order_id int ,
product_id int ,
primary key (order_id, product_id),
foreign key (order_id) references orders(id),
foreign key (product_id) references product(id),
product_amount int
);

