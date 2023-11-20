-- 1.
select c.college_name, count(s.college_id) student_count from colleges c left join students s on c.college_id =s.college_id
group by c.college_name ;

--2.
select colleges.college_name ,courses.course_name ,count(students.std_id)as std_count from colleges inner join course_college on colleges.college_id =course_college.clg_id inner join courses on courses.course_id =course_college.course_id 
left join students on course_college.clg_id =students.college_id and courses.course_id=students.course_id 
group by colleges.college_name ,courses.course_name order by colleges.college_name ,std_count desc

--3.
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

--4.
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

--5.
select std_id ,std_name, college_name, mark AS average_marks,ranking
from(
	select m.std_id ,s.std_name, c.college_name, AVG(m.marks) AS mark,
rank() over(partition by c.college_id order by AVG(m.marks) DESC) as ranking
from marks m 
join students s  on s.std_id  = m.std_id
join colleges c  on c.college_id = s.college_id 
group by m.std_id,s.std_name , c.college_name,c.college_id) student_ranks
where ranking = 1 order by average_marks desc;

--6.
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

--7.
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

--8.
 SELECT m.std_id , s.std_name, AVG(m.marks) AS mark ,c2.course_name
FROM marks m
join students s  on s.std_id  = m.std_id 
join courses c2  on c2.course_id = s.course_id 
GROUP BY m.std_id ,s.std_name ,c2.course_name;

--9.
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
