use student_management;

select id, `name`, MAX(credit), `status`
from subjects
group by id
having MAX(credit) >= all (select MAX(credit) from subjects);

select s.id, s.`name`, s.credit, s.`status`, max(mark) from subjects s
inner join mark m on s.id = m.sub_id
group by s.id
having max(mark) >= all (select max(mark) from mark);

select s.id, s.`name`, s.address, s.phone, s.`status`, s.class_id, avg(mark) from student s
inner join mark m on s.id = m.student_id
group by s.id 
order by avg(mark) desc;