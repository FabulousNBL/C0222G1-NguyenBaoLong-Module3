use quan_ly_sinh_vien;

select address, count(id_student) as 'số lượng học viên' from student group by address;

select s.student_name, avg(mark) as 'điểm trung bình' from student s inner join 
mark m on s.id_student= m.id_student group by 
s.student_name having 
avg(mark) >= all (select avg(mark) from mark group by mark.id_student);



