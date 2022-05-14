use student_management;

select * from student where student.`name` like "h%";

select class.id, class.`name`,class.`status` from class where month(class.start_date)=12;

select subjects.id,subjects.`name`,subjects.`status` from subjects where subjects.credit between 3 and 5;
select * from subjects;

-- select * from class;

update student set student.class_id=2 where student.`name`='Hung' and student.id>0;

select * from mark;
select s.`name`,sub.`name`,m.mark from student s 
inner join subjects sub on sub.id= s.id 
inner join mark m on sub.id = m.sub_id 
order by m.mark desc, sub.`name` asc;