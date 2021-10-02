--TASK 1(A)--

select *
from course
where  credits > 3;

--1(B)--
SELECT * from classroom
     WHERE  classroom.building  = 'Watson' OR classroom.building =  'Packard';

--1(C)--
select * from course
where dept_name = 'Comp. Sci.';

--1(D)
select course_id from takes
where semester = 'Fall';

--1(E)
select name, id
from student
where tot_cred between 45 and 90;

--1(F)
select name from student
where name like '%a' or name like '%e' or name like '%i' or name like '%o' or name like '%u' or name like '%y';

--1(G)
select course_id from prereq
where prereq_id = 'CS-101';

--TASK 2(A)
SELECT dept_name, AVG(salary) FROM instructor GROUP BY dept_name ORDER BY AVG ASC;

--2(B)
select building, count ( course_id ) x
from section
group by building
order by x desc;

--2(C)
select dept_name, count (dept_name) x
from department
group by dept_name
order by x asc;

--2(D)
select student.id, student.name
from student,takes
where student.id = takes.id and student.dept_name = 'Comp. Sci.'
group by student.id having count(takes.id) > 3;


--2(E)
select *
from instructor
where dept_name = 'Biology' or dept_name = 'Philosophy' or dept_name = 'Music';

--2(F)
select distinct takes.id, teaches.id, takes.year, teaches.year
from teaches, takes
where teaches.year = 2018 and takes.year = 2018;

--TASK 3(A)
select *
from takes, course
where course.dept_name = 'Comp. Sci.' and (grade = 'A' or grade = 'A-');

--3(B)
select id, grade from takes
where grade <> 'B' and grade <> 'A' and grade <> 'A-' and grade <> 'B+';

--3(C)
select distinct dept_name
from student, takes
where student.id = takes.id and grade = 'F' or grade = 'C';

--3(D)
select distinct teaches.id
from teaches, takes
where teaches.course_id = takes.course_id and grade = 'A'
group by teaches.id;

--3(E)
select time_slot.end_hr , section.course_id
from time_slot , section
where section.time_slot_id = time_slot.time_slot_id and end_hr < 13;
