insert into colleges(college_name) values ('Idhaya College'),('Bharathidasan college'),('Indira Gandhi college');
INSERT 0 3
insert into colleges(college_name) values ('TAG'),('Community college');
INSERT 0 2
update colleges set college_name='TAC' where college_id=4;
UPDATE 1
university=# insert into courses(course_name) values ('B.A. Tamil');
INSERT 0 1
university=# insert into courses(course_name) values ('B.A. English');
INSERT 0 1
university=# insert into courses(course_name) values ('B.Sc., Maths'),('B.Sc., Physics');
INSERT 0 2
university=# insert into courses(course_name) values ('B.Sc., Chemistry'),('B.Sc., Computer Science');
INSERT 0 2
university=# insert into courses(course_name) values ('BCA'),('MCA');
INSERT 0 2
university=# insert into courses(course_name) values ('M.Sc., Maths'),('M.Sc., Physics');
INSERT 0 2
university=# insert into course_college(course_id,clg_id) values(2,1);
INSERT 0 1
university=# insert into course_college(course_id,clg_id) values(3,1),(4,1);
INSERT 0 2
university=# insert into course_college(course_id,clg_id) values(6,1),(7,1);
INSERT 0 2
university=# insert into course_college(course_id,clg_id) values(9,1);
INSERT 0 1
insert into course_college(course_id,clg_id) values(1,2);
INSERT 0 1
university=# insert into course_college(course_id,clg_id) values(2,2),(3,2),(3,2),(5,2),(6,2);
INSERT 0 5
university=# insert into course_college(course_id,clg_id) values(2,3),(3,3),(4,3),(6,3),(7,3);
INSERT 0 5
university=# insert into course_college(course_id,clg_id) values(1,4),(2,4),(3,4),(5,4),(4,4),(6,4),(9,4),(10,4);
INSERT 0 8
university=# insert into course_college(course_id,clg_id) values(7,5),(8,5),(9,5),(10,5);
INSERT 0 4
university=# insert into subjects(subject_name) values ('Tamil'),('English'),('Tamil2'),('English2');
INSERT 0 4
university=# insert into subjects(subject_name) values ('Silapadhigaram'),('Ilakkana Varalaru'),('Kizhkanakku Noolgal'),('Shakespeare'),('History of Literature'),('Poetry');
INSERT 0 6

university=# insert into subjects(subject_name) values ('Abstract Algebra'),('Linear Algebra'),('Logic and Lattices'),('Trigonometry');
INSERT 0 4
university=# insert into subjects(subject_name) values ('ElectroMagnetism'),('Thermal Physics'),('Quantum Mechanics');
INSERT 0 3
university=# insert into subjects(subject_name) values ('ThermoDynamics'),('HydroCarbons'),('Organic Chemistry');
INSERT 0 3
university=# insert into subjects(subject_name) values ('C'),('Micro Processors'),('Os');
INSERT 0 3
university=# insert into subjects(subject_name) values ('Accounts');
INSERT 0 1
university=# insert into subjects(subject_name) values ('Java'),('PHP'),('Big Data'),('R');
INSERT 0 4
university=# insert into subjects(subject_name) values ('Real Analysis'),('Integral Calculus'),('Differential Calulus');
INSERT 0 3
university=# insert into subjects(subject_name) values ('Relativity'),('Atomic Physics');
INSERT 0 2
--Course_subjects--
university=# insert into course_subjects(sub_id,course_id) values(5,1),(6,1),(7,1);
INSERT 0 3
university=# insert into course_subjects(sub_id,course_id) values(8,2),(9,2),(10,2);
INSERT 0 3
                                                            ^
university=# insert into course_subjects(sub_id,course_id) values(1,3),(2,3),(11,3),(12,3),(13,3);
INSERT 0 5
university=# insert into course_subjects(sub_id,course_id) values(14,3);
INSERT 0 1
university=# insert into course_subjects(sub_id,course_id) values(15,4),(16,4),(17,4);
INSERT 0 3
university=# insert into course_subjects(sub_id,course_id) values(18,5),(19,5),(20,5);
INSERT 0 3
university=# insert into course_subjects(sub_id,course_id) values(21,6),(22,6),(23,6);
INSERT 0 3
university=# insert into course_subjects(sub_id,course_id) values(21,7),(22,7),(23,7),(24,7),(1,7),(2,7);
INSERT 0 6
university=# insert into course_subjects(sub_id,course_id) values(25,8),(26,8),(27,8),(28,8);
INSERT 0 4
university=# insert into course_subjects(sub_id,course_id) values(29,9),(30,9),(31,9);
INSERT 0 3
university=# insert into course_subjects(sub_id,course_id) values(32,10),(33,10);
INSERT 0 2
--semester--
university=# insert into semester(sem_month,sem_year) values ('April',2023);
INSERT 0 1
--students--
insert into students (std_name,dob,phone_no,address,joining_batch,course_id,college_id) values ('priya','2001-03-17',8248352157,'Pondicherry',2021,8,5);
ERROR:  integer out of range

university=# alter table students alter column "phone_no" type bigint;
ALTER TABLE
university=# insert into students (std_name,dob,phone_no,address,joining_batch,course_id,college_id) values ('priya','2001-03-17',8248352157,'Pondicherry',2021,8,5);
INSERT 0 1
university=# insert into students (std_name,dob,phone_no,address,joining_batch,course_id,college_id) values ('Kabipriya','2001-03-17',8248352157,'Pondicherry',2021,8,5);
INSERT 0 1
university=# update students set phone_no=7698744543 where std_id =2;
UPDATE 1
university=# update students set course_id=7 where std_id =2;
UPDATE 1
university=# update students set college_id=3 where std_id =2;
UPDATE 1
university=# update students set joining_batch=2020 where std_id =2;
UPDATE 1
university=# insert into students (std_name,dob,phone_no,address,joining_batch,course_id,college_id) values ('Sriram','2000-08-09',8248352157,'Pondicherry',2021,8,5);
INSERT 0 1
university=# update students set phone_no=8248352156 where std_id =3;
UPDATE 1
                                   ^
university=# update students set address='Chennai' where std_id =3;
UPDATE 1
university=# update students set joining_batch=2018 where std_id =3;
UPDATE 1
university=# update students set college_id=3 where std_id =4;
UPDATE 0
university=# update students set college_id=4 where std_id =3;
UPDATE 1
university=# update students set course_id=4 where std_id =3;
UPDATE 1
university=# update students set joining_batch=2020 where std_id =3;
UPDATE 1
university=# INSERT INTO students (std_name, dob, phone_no, address, joining_batch, course_id, college_id)
VALUES ('Akila', '2000-05-21', 9876543210, 'Chidambaram', 2021, 7, 3);
INSERT 0 1
university=# INSERT INTO students (std_name, dob, phone_no, address, joining_batch, course_id, college_id)
VALUES ('Akila', '2000-05-21', 9876543210, 'Chidambaram'^C2021, 7, 3);
university=# INSERT INTO students (std_name, dob, phone_no, address, joining_batch, course_id, college_id)
VALUES ('Aishwarya', '2002-02-10', 7654321098, 'Mayiladuthurai', 2020, 6, 2);
INSERT 0 1
university=# INSERT INTO students (std_name, dob, phone_no, address, joining_batch, course_id, college_id)
VALUES ('Pavithra', '2003-05-15', 7654321089, 'Trichy', 2020, 1, 4);
INSERT 0 1

university=# INSERT INTO students (std_name, dob, phone_no, address, joining_batch, course_id, college_id)
VALUES ('Sineka','2001-10-26',5854564984,'Shimla',2019,1,2);
INSERT 0 1
university=# INSERT INTO students (std_name, dob, phone_no, address, joining_batch, course_id, college_id)
VALUES ('Priyanka', '2003-07-15', 8765432101, 'Chennai', 2022, 3, 3);
INSERT 0 1
university=# INSERT INTO students (std_name, dob, phone_no, address, joining_batch, course_id, college_id)
VALUES ('Ananya', '2002-11-05', 8901234567, 'Hyderabad', 2022, 10, 5);
INSERT 0 1
university=# INSERT INTO students (std_name, dob, phone_no, address, joining_batch, course_id, college_id)
VALUES ('Ananya', '2002-11-05', 8901234567, 'Cuddalore', 2021, 6, 1);
INSERT 0 1
update students set std_name='vishnu' where std_id=10;
UPDATE 1
university=# INSERT INTO marks (std_id,sem_id,marks,sub_id) values (1,1,90,25);
INSERT 0 1
university=# INSERT INTO marks (std_id,sem_id,marks,sub_id) values (1,1,80,26);
INSERT 0 1
university=# INSERT INTO marks (std_id,sem_id,marks,sub_id) values (1,1,80,26),(1,1,95,27);
INSERT 0 2
university=# INSERT INTO marks (std_id,sem_id,marks,sub_id) values (1,1,89,28);
INSERT 0 1
               
university=# delete from marks where mark_id=3;
DELETE 1
university=# INSERT INTO marks (std_id,sem_id,marks,sub_id) values (2,1,91,21);
INSERT 0 1
university=# INSERT INTO marks (std_id,sem_id,marks,sub_id) values (2,1,76,22);
INSERT 0 1
university=# INSERT INTO marks (std_id,sem_id,marks,sub_id) values (2,1,74,23);
INSERT 0 1
university=# INSERT INTO marks (std_id,sem_id,marks,sub_id) values (2,1,88,24);
INSERT 0 1
university=# insert into course_subjects(sub_id,course_id) values(2,1);
INSERT 0 1
university=# insert into course_subjects(sub_id,course_id) values(2,4);
INSERT 0 1
university=# INSERT INTO marks (std_id,sem_id,marks,sub_id) values (3,1,93,15);
INSERT 0 1
university=# INSERT INTO marks (std_id,sem_id,marks,sub_id) values (3,1,63,16),(3,1,77,17);
INSERT 0 2
university=# INSERT INTO marks (std_id,sem_id,marks,sub_id) values (3,1,63,1);
INSERT 0 1
university=# delete from marks where mark_id =13;
DELETE 1
university=# INSERT INTO marks (std_id,sem_id,marks,sub_id) values (3,1,63,2);
INSERT 0 1
university=# insert into course_subjects(sub_id,course_id) values(4,10);
INSERT 0 1
university=# INSERT INTO marks (std_id,sem_id,marks,sub_id) values (10,1,66,32),(10,1,96,33);
INSERT 0 2
university=# insert into course_subjects(sub_id,course_id) values(3,10);
INSERT 0 1
university=# INSERT INTO marks (std_id,sem_id,marks,sub_id) values (10,1,87,3),(10,1,66,4);
INSERT 0 2
insert into marks (std_id,sem_id,marks,sub_id) values (7,1,25,5);
insert into marks (std_id,sem_id,marks,sub_id) values (7,1,-1,6);

insert into students (std_name,dob,phone_no,address,joining_batch,course_id,college_id)values('Ram','2002-11-20',9876543210,'Trichy',2020,7,3)
insert into marks (std_id,sem_id,marks,sub_id) values (11,1,98,21),(11,1,99,22),(11,1,97,23),(11,1,100,24)
update marks set marks=99 where mark_id=2;
update marks set marks=99 where mark_id=5;
update marks set marks=99 where mark_id=1;
insert into students (std_name,dob,phone_no,address,joining_batch,course_id,college_id)values('Radha','2002-11-22',9876543211,'Tirunelveli',2020,1,2)
insert into marks (std_id,sem_id,marks,sub_id) values (12,1,55,5),(12,1,35,6)




