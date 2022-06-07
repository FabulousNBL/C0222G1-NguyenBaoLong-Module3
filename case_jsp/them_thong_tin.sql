use case_study_servlet;
insert into customer_type(id,customer_type) values ("1","Diamond"),("2","Platinum"),("3","Gold"),("4","Silver"),("5","Member");
insert into customer(id,type_id,`name`,birthday,gender,id_card,phone,email,address)
values ("KH123","2","Long","1997-12-24",1,"123456","099870909","long@gmail.com","DN"),
("KH1234","1","Long1","1997-12-24",1,"123556","099870949","long2@gmail.com","HN"),
("KH1232","3","Long3","1997-12-24",0,"1234567","099870209","long1@gmail.com","QN");

INSERT INTO rent_type (rent_type_id,rent_type_name,rent_cost)
VALUES(1,'năm',5000),(2,'tháng',3000),(3,'ngày',1000),(4,'giờ',200);

INSERT INTO service_type (service_type_id,service_type_name)
VALUES(1,'Villa'),(2,'House'),(3,'Room');

insert into service(service_id,service_name,service_area,service_cost,service_max_people,rent_type_id,service_type_id,standard_room,description_other_convenience,pool_area,floor_number,`status`)
values
('1','Villa Beach Front' ,25000 ,10000000 , 10,3, 1,'vip','Có hồ bơi' ,500 ,4 ,0),
('2','House Princess 01' ,14000 ,5000000 , 7, 2, 2,'vip','Có thêm bếp nướng' ,null ,3,0),
('3','Room Twin 01' ,5000 ,1000000 , 2, 4 , 3,'normal','Có tivi' ,null ,null,0),
('4','Villa No Beach Front' ,22000 ,9000000 , 8,3 , 1,'normal','Có hồ bơi' ,300 ,3,0),
('5','House Princess 02' ,10000 ,4000000,5 ,3 , 2,'normal','Có thêm bếp nướng' ,null ,2,0),
('6','Room Twin 02' ,3000 ,900000 , 2,4 , 3,'normal','Có tivi' ,null ,null,0);

insert into education_degree
(education_degree_name)
values ('Trung Cấp'),
       ('Cao Đẳng'),
       ('Đại Học'),
       ('Sau Đại Học');
       
insert into division
(division_name)
values ('Sale-Marketing'),
       ('Hành chính'),
       ('Phục vụ'),
       ('Quản lý');
       
       
INSERT into `user`
values
 ("annguyen@furama.com","annguyen123"),
 ("binhlv@furama.com","binhlv123"),
 ("thiyen@furama.com","thiyen123"),
 ("toan0404@furama.com","toan0404"),
 ("phatphat@furama.com","phatphat123"),
 ("annghi20@furama.com","annghi20"),
 ("nhh0101@furama.com","nhh0101"),
 ("donghanguyen@furama.com","donghanguyen123"),
 ("hoangtong@furama.com","hoangtong123"),
 ("nguyencongdao12@furama.com","nguyencongdao123");
       
INSERT into `role` (role_name)
values("admin"),
       ("user");
       
insert into position
(position_name)
values ('Quản lý'),
       ('Nhân viên');

insert into employee
(employee_name, employee_birthday, employee_id_card, employee_salary, employee_phone, employee_email, employee_address, position_id, education_degree_id, division_id,username)
values ('Nguyễn Văn An', '1970-11-07', '456231786', 10000000, '0901234121', 'annguyen@gmail.com',
        '295 Nguyễn Tất Thành, Đà Nẵng', 1, 3, 1,"annguyen@furama.com"),
       ('Lê Văn Bình', '1997-04-09', '654231234', 7000000, '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', 1,
        2, 2,"binhlv@furama.com"),
       ('Hồ Thị Yến', '1995-12-12', '999231723', 14000000, '0412352315', 'thiyen@gmail.com',
        'K234/11 Điện Biên Phủ, Gia Lai', 1, 3, 2,"thiyen@furama.com"),
       ('Võ Công Toản', '1980-04-04', '123231365', 17000000, '0374443232', 'toan0404@gmail.com',
        '77 Hoàng Diệu, Quảng Trị', 1, 4, 4,"toan0404@furama.com"),
       ('Nguyễn Bỉnh Phát', '1999-12-09', '454363232', 6000000, '0902341231', 'phatphat@gmail.com',
        '43 Yên Bái, Đà Nẵng', 2, 1, 1,"phatphat@furama.com"),
       ('Khúc Nguyễn An Nghi', '2000-11-08', '964542311', 7000000, '0978653213', 'annghi20@gmail.com',
        '294 Nguyễn Tất Thành, Đà Nẵng', 2, 2, 3,"annghi20@furama.com"),
       ('Nguyễn Hữu Hà', '1993-01-01', '534323231', 8000000, '0941234553', 'nhh0101@gmail.com',
        '4 Nguyễn Chí Thanh, Huế', 2, 3, 2,"nhh0101@furama.com"),
       ('Nguyễn Hà Đông', '1989-09-03', '234414123', 9000000, '0642123111', 'donghanguyen@gmail.com',
        '111 Hùng Vương, Hà Nội', 2, 4, 4,"donghanguyen@furama.com"),
       ('Tòng Hoang', '1982-09-03', '256781231', 6000000, '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng',
        2, 4, 4,"hoangtong@furama.com"),
       ('Nguyễn Công Đạo', '1994-01-08', '755434343', 8000000, '0988767111', 'nguyencongdao12@gmail.com',
        '6 Hoà Khánh, Đồng Nai', 2, 3, 2,"nguyencongdao12@furama.com");