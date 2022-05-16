use quan_ly_ban_hang;

insert into customer (customer_name,customer_age) values ( "Minh Quan", 10),("Ngoc Oanh",20),("Hong Ha",50);

insert into orders (customer_id, odate) values ( 1, '2006-3-26'),(2,'2006-3-21'),(1,'2006-3-16');

insert into product (product_name, price) values ("May Giat",3),("Tu Lanh",5), ("Dieu Hoa",7),("Quat",1),("Bep Dien",2);

insert into order_detail (order_id, product_id, product_amount) values (1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);

use quan_ly_ban_hang;

select id, odate,order_total_price from orders;
select c.customer_name, p.product_name from order_detail od 
inner join orders  o on od.order_id = o.id 
inner join customer c on o.customer_id = c.id 
inner join product p on od.product_id = p.id
;

select c.customer_name from customer c 
where c.id not in (select o.customer_id from orders o);

select o.id, o.odate, sum(od.product_amount*p.price) from orders o
inner join order_detail od on o.id = od.order_id
inner join product p on p.id = od.product_id
group by o.id;