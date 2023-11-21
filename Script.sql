-- 1. get students count college wise

select c.college_name, count(s.college_id) student_count from colleges c left join students s on c.college_id =s.college_id
group by c.college_name ;

--2.get students count in a college, course wise

select colleges.college_name ,courses.course_name ,count(students.std_id)as std_count from colleges inner join course_college on colleges.college_id =course_college.clg_id inner join courses on courses.course_id =course_college.course_id 
left join students on course_college.clg_id =students.college_id and courses.course_id=students.course_id 
group by colleges.college_name ,courses.course_name order by colleges.college_name ,std_count desc

--3.get the university rank holder across all courses(1 student)

SELECT m.std_id, s.std_name , AVG(m.marks) AS mark ,c3.course_name, c.college_name 
FROM marks m
join students  s on s.std_id = m.std_id  
join courses c3  on c3.course_id = s.course_id 
join colleges c  on c.college_id = s.college_id 
GROUP BY m.std_id ,s.std_name ,c3.course_name,c.college_name
HAVING AVG(marks) = (
    SELECT MAX(avg_marks)
    FROM (
        SELECT AVG(marks) AS avg_marks
        FROM marks
        GROUP by std_id
    ) AS max_avg
);

--4.get the list of rank holders each course

 SELECT 
    std_id,
    std_name,
    course_name,
    mark AS average_marks
FROM (
    SELECT 
        s.std_id,
        s.std_name,
        c.course_name,
        AVG(m.marks) AS mark,
        rank() OVER(PARTITION BY c.course_id ORDER BY AVG(m.marks) DESC) AS rank
    FROM 
        marks m
    JOIN 
        students s  ON s.std_id = m.std_id
    JOIN 
        courses c ON c.course_id = s.course_id
    GROUP BY 
        s.std_id, 
        s.std_name,
        c.course_name,
        c.course_id 
) ranked_students 
WHERE rank =1;

--5.get the college topper across all courses

select std_id ,std_name, college_name, mark AS average_marks,ranking
from(
	select m.std_id ,s.std_name, c.college_name, AVG(m.marks) AS mark,
rank() over(partition by c.college_id order by AVG(m.marks) DESC) as ranking
from marks m 
join students s  on s.std_id  = m.std_id
join colleges c  on c.college_id = s.college_id 
group by m.std_id,s.std_name , c.college_name,c.college_id) student_ranks
where ranking = 1 order by average_marks desc;

--6.get the college toppers each course

--select std_id ,std_name, college_name, mark AS average_marks,ranking,course_name 
--from(
--	select m.std_id ,s.std_name, c.college_name, AVG(m.marks) AS mark,c2.course_name ,
--rank() over(partition by c2.course_id, c.college_id order by AVG(m.marks) DESC) as ranking
--from marks m 
--join students s  on s.std_id  = m.std_id
--join colleges c  on c.college_id = s.college_id 
--join courses c2 on c2.course_id = s.course_id  
--group by m.std_id,s.std_name , c.college_name,c.college_id,c2.course_name,c2.course_id) student_ranks
--where ranking = 1 order by average_marks desc;


select std_id ,std_name, college_name, mark AS average_marks,ranking,course_name 
from(
	select m.std_id ,s.std_name, c.college_name, AVG(m.marks) AS mark,c2.course_name ,
rank() over(partition by  c.college_id order by AVG(m.marks) DESC) as ranking
from marks m 
join students s  on s.std_id  = m.std_id
join colleges c  on c.college_id = s.college_id 
join courses c2 on c2.course_id = s.course_id  
group by m.std_id,s.std_name , c.college_name,c.college_id,c2.course_name) student_ranks
where ranking = 1 order by average_marks desc;

--7. get the failed students count each subject 


--SELECT s2.subject_name, COUNT(m.std_id) AS num_failed_students
--FROM marks m
--JOIN subjects s2  ON m.sub_id  = s2.subject_id
--WHERE m.marks < 30 or m.marks is null 
--GROUP BY s2.subject_name;

SELECT s2.subject_name, COUNT(m.std_id) AS num_failed_students
FROM marks m
JOIN subjects s2  ON m.sub_id  = s2.subject_id
WHERE m.marks < 30 
GROUP BY s2.subject_name;

--insert into marks (std_id,sem_id,marks,sub_id) values (7,1,25,5);
--insert into marks (std_id,sem_id,marks,sub_id) values (7,1,-1,6);

--8.get over all students list with semester marks 


 SELECT m.std_id , s.std_name, AVG(m.marks) AS mark ,c2.course_name
FROM marks m
join students s  on s.std_id  = m.std_id 
join courses c2  on c2.course_id = s.course_id 
GROUP BY m.std_id ,s.std_name ,c2.course_name;

--9.get the student list who wasnt appear to the exams


SELECT s.std_id , s.std_name 
FROM students s 
LEFT JOIN marks m ON s.std_id  = m.std_id 
WHERE m.marks = -1 OR m.marks IS NULL
group by s.std_name ,s.std_id ;

--insert into students (std_name,dob,phone_no,address,joining_batch,course_id,college_id)values('Ram','2002-11-20',9876543210,'Trichy',2020,7,3)
--insert into marks (std_id,sem_id,marks,sub_id) values (11,1,98,21),(11,1,99,22),(11,1,97,23),(11,1,100,24)
--update marks set marks=99 where mark_id=2;
--update marks set marks=99 where mark_id=5;
--update marks set marks=99 where mark_id=1;
--insert into students (std_name,dob,phone_no,address,joining_batch,course_id,college_id)values('Radha','2002-11-22',9876543211,'Tirunelveli',2020,1,2)
--insert into marks (std_id,sem_id,marks,sub_id) values (12,1,55,5),(12,1,35,6)


                                                                           ---- Task 3----

--1,update the mark to 40 those who were scored the marks between 35 to 39

update marks set "marks"=40 where marks between 35 and 39

--3,choose any select query from tast 2 and insert the values into a temp table

--SELECT
--    select_list
--INTO [ TEMPORARY | TEMP | UNLOGGED ] [ TABLE ] new_table_name
--FROM
--    table_name
--WHERE
--    search_condition;


--taking query 9 from task 2

select s.std_id,s.std_name into temporary table temp_table from students s LEFT JOIN marks m ON s.std_id  = m.std_id 
WHERE m.marks = -1 OR m.marks IS NULL
group by s.std_name ,s.std_id ;

select * from temp_table;

--6,remove the duplicate values in the mark table(insert values for your convenient)

insert into marks (std_id,sem_id,marks,sub_id) values (11,1,98,21),(11,1,99,22),(11,1,55,23),(11,1,100,24)
insert into marks (std_id,sem_id,marks,sub_id) values (12,1,56,5),(12,1,35,6)

select * from marks 

--DELETE  FROM
--    basket a
--        USING basket b
--WHERE
--    a.id > b.id
--    AND a.fruit = b.fruit;
--delete from marks m1 using marks m2 where m1.mark_id > m2.mark_id and m1.marks = m2.marks
--select * from marks 


insert into marks (mark_id ,std_id,sem_id,marks,sub_id) values (27,11,1,98,21),(28,11,1,99,22),(29,11,1,97,23),(30,11,1,100,24)

--delete from marks where mark_id =33

--DELETE FROM table_name
--WHERE id IN
--    (SELECT id
--    FROM 
--        (SELECT id,
--         ROW_NUMBER() OVER( PARTITION BY column_1,
--         column_2
--        ORDER BY  id ) AS row_num
--        FROM table_name ) t
--        WHERE t.row_num > 1 );
begin transaction ;

delete from marks 
where mark_id in (select mark_id 
from 
(select mark_id, 
row_number() over (partition by std_id,sub_id 
order by mark_id)as row_num 
from marks )t
WHERE t.row_num > 1 );

select  * from marks m 

commit
---------------------------------------------------
update marks set "marks" = 35 where mark_id = 26 returning *;

begin transaction ;
	update marks set "marks" =98  where "marks" = 99 returning *;

rollback;
-------------------------

--2, get the history of marks that are changed

CREATE TABLE marks_history (
    history_id SERIAL PRIMARY KEY,
    std_id INT,
    old_marks INT,
    new_marks INT,
    subject_id INT,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    changed_by VARCHAR(50),
    status varchar
);
/*
drop table marks_history 

DROP TRIGGER IF EXISTS audit_marks ON marks;
DROP TRIGGER IF EXISTS marks_audit_trigger ON marks;
*/
CREATE OR REPLACE FUNCTION audit_marks()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO marks_history (std_id, old_marks, new_marks, subject_id, changed_by, status)
        VALUES (NEW.std_id, NULL, NEW.marks, NEW.sub_id, current_user, 'INSERT');

    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO marks_history (std_id, old_marks, new_marks, subject_id, changed_by, status)
        VALUES (OLD.std_id, OLD.marks, NEW.marks, OLD.sub_id, current_user, 'UPDATE');

    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO marks_history (std_id, old_marks, new_marks, subject_id, changed_by, status)
        VALUES (OLD.std_id, OLD.marks, NULL, OLD.sub_id, current_user, 'DELETE');
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER marks_audit_trigger
AFTER INSERT OR UPDATE OR DELETE ON marks
FOR EACH ROW EXECUTE FUNCTION audit_marks();

update marks set marks = 97 where mark_id =5;

select * from marks_history 

--5,alter all the tables add audit columns 

ALTER TABLE marks 
ADD COLUMN createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN createBy VARCHAR default current_user,
ADD COLUMN updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
ADD COLUMN updatedBy VARCHAR default current_user;

update marks set marks = 99 where mark_id =5;
----
--begin transaction ;
--	update marks set "marks" =10 where mark_id  = 1;
--	select * from marks m 
--rollback;
-----


--4,delete a college and its respective things

--ALTER TABLE Cars ADD CONSTRAINT clr_prmrykey PRIMARY KEY ( Color);


ALTER TABLE course_college
DROP CONSTRAINT course_college_clg_id_fkey;


ALTER TABLE course_college
ADD CONSTRAINT course_college_clg_id_fkey
FOREIGN KEY (clg_id) REFERENCES colleges(college_id) ON DELETE CASCADE;


ALTER TABLE students 
DROP CONSTRAINT students_college_id_fkey

ALTER TABLE students 
ADD CONSTRAINT students_college_id_fkey
FOREIGN KEY (college_id) REFERENCES colleges(college_id) ON DELETE CASCADE;

ALTER TABLE marks  
DROP CONSTRAINT marks_std_id_fkey;

ALTER TABLE marks  
ADD CONSTRAINT marks_std_id_fkey
FOREIGN KEY (std_id) REFERENCES students(std_id) ON DELETE CASCADE;

begin transaction;
delete from colleges where college_id =1;
select * from colleges c 
select * from students s order by std_name
select * from marks m 
commit;
--rollback;
