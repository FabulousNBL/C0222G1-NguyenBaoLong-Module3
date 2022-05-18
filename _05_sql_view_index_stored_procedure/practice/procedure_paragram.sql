USE `classicmodels`;

DELIMITER //

CREATE PROCEDURE getCusById

(IN cusNum INT(11))

BEGIN

  SELECT * FROM customers WHERE customerNumber = cusNum;

END //

DELIMITER ;

call getCusById(175);

delimiter //
create procedure GetCustomersCountByCity(
in in_city varchar(50),
out total int )
begin
select count(customerNumber)
into total 
from customers
where city = in_city ;
end //
delimiter ;

call GetCustomersCountByCity('Lyon', @total);
select @total;

delimiter //
create procedure setCounter(
inout counter int,
in inc int)
begin
set counter = counter + inc;
end //
delimiter ;

set @counter =1;
call setCounter(@counter,1);
call setCounter(@counter,1);
call setCounter(@counter,5);
select @counter;