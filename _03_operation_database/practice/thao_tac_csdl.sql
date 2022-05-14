use student_management;
select * from student;

select * from student where `status`=1;

select * from subjects where credit <10;

select student.id, student.`name`, student.class_id 
from student inner join class on student.class_id = class.id where class.`name` = 'A1';

select student.id, student.`name`, subjects.`name`, mark.mark 
from student join mark on student.id = mark.student_id 
join subjects on mark.sub_id= subjects.id where subjects.`name`='CF';