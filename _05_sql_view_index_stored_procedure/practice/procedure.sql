use classicmodels;

explain SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.'; 

alter table customers add index idx_customerName(customerName);

explain select * from customers where customerName= '`Land of the Toys Inc. '; 

alter table customers add index ind_full_name(contactFirstName, contactLastName);

explain select * from customers where contactFirstName = "Jean" or contactFirstName = "king";

delimiter //
drop procedure if exists `findAllCustomer` //
create procedure findAllCustomer()
begin
select * from customers where customerNumber= 175;
end //
delimiter ;

call findAllCustomer;


