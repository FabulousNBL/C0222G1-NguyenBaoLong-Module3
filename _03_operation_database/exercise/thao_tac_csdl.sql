use quan_ly_ban_hang;

insert into customer (customer_name,customer_age) values ( "Minh Quan", 10),("Ngoc Oanh",20),("Hong Ha",50);

insert into orders (customer_id, odate) values ( 1, '2006-3-26'),(2,'2006-3-21'),(1,'2006-3-16');

insert into product (product_name, price) values ("May Giat",3),("Tu Lanh",5), ("Dieu Hoa",7),("Quat",1),("Bep Dien",2);

insert into order_detail (order_id, product_id, product_amount) values (1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);

