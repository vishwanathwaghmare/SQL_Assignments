create database StudentCourse
use[StudentCourse]
----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Trainer (
    trainer_id INT PRIMARY KEY,
    trainer_name VARCHAR(255),
    join_date DATE,
    email VARCHAR(255),
    experience_in_years INT
)
INSERT INTO Trainer (trainer_id, trainer_name, join_date, email, experience_in_years)
VALUES
    (301, 'Aniket', '2018-03-15', 'aniket@gmail.com', 9),
    (302, 'Kalyani', '2019-06-20', 'kalyani@gmail.com', 4),
    (303, 'Nisha', '2020-01-10', 'nisha@gmail.com', 6),
    (304, 'Simran', '2017-09-05', 'simran@gmail.com', 7)
	 
	select * from Trainer
----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(255),
    duration_months INT,
    trainer_id INT,
    total_fees DECIMAL(10, 2)
	foreign key (trainer_id) references Trainer(trainer_id)
)

INSERT INTO Course (course_id, course_name, duration_months, trainer_id, total_fees)
VALUES
    (101, '.NET', 12, 301, 30000.00),
    (102, 'Java', 8, 302, 2400.00),
    (103, 'ML', 24, 303, 5000.00),
    (104, 'Python', 12, 304, 3500.00),
    (105, 'C#', 6, 302, 1800.00)

	select * from Course
----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Students (
    rollno INT PRIMARY KEY,
    sname VARCHAR(25),
    degree VARCHAR(25),
    birthdate DATE,
    course_id INT,
    batch_id INT,
    fees_paid DECIMAL(10, 2),
    Remark VARCHAR(25),
    is_placed VARCHAR(3)
	foreign key (course_id) references Course(course_id)

)
select * from Students

drop table Students
INSERT INTO Students(rollno, sname, degree, birthdate, course_id, batch_id, fees_paid, Remark, is_placed)
VALUES
    (1, 'vishwanath', 'MCA', '1995-01-15', 101, 201, 1500.00, '', 'no'),
    (2, 'Suraj', 'BCA', '1997-05-20', 102, 202, 2000.00, '', 'yes'),
    (3, 'Akash', 'B.Tech', '1998-09-10', 103, 201, 1800.00, '', 'no'),
    (4, 'Diksha', 'M.tech', '1996-03-30', 104, 203, 2500.00, '', 'no'),
    (5, 'Ganesh', 'B.Sc', '1999-11-05', 105, 202, 2200.00, '', 'yes')

----------------------------------------------------------------------------------------------------------------------------------------

	select * from Students
	select * from Course
	select * from Trainer


---------------------------------------------------------------------------------------------------------------------------------------
--1) Show list of students. List contains roll no, student name, course name, trainer name in order of course name and student name.
SELECT s.rollno, s.sname AS student_name, c.course_name, t.trainer_name
FROM Students s
JOIN Course c ON s.course_id = c.course_id
JOIN Trainer t ON c.trainer_id = t.trainer_id
ORDER BY c.course_name, s.sname
----------------------------------------------------------------------------------------------------------------------------------------
--2) Show list of students who have pending fees more than 1000rs. List should have student name, course name, balance fees. Show this list in descending order of balance fees.
SELECT s.sname AS student_name, c.course_name, (c.total_fees - s.fees_paid) AS balance_fees
FROM Students s
JOIN Course c ON s.course_id = c.course_id
WHERE (c.total_fees - s.fees_paid) > 1000
ORDER BY balance_fees DESC
----------------------------------------------------------------------------------------------------------------------------------------
-- 3)Append letter ‘_spl’ to all batch ids of trainer ‘Kalyani’.

----------------------------------------------------------------------------------------------------------------------------------------
--4) Update table student. Update ‘remark’ field. Remark should be ‘Eligible for exam’ if fees paid by student is more than 60%.
UPDATE Students
SET Remark = 'Eligible for exam'
WHERE (fees_paid / (SELECT total_fees FROM Course WHERE course_id = Students.course_id)) > 0.6;

select * from Students
---------------------------------------------------------------------------------------------------------------------------------------
--5) Create an index to make retrieval faster based on course name.
--CREATE INDEX idx_course_name1 ON Course(course_name)
---------------------------------------------------------------------------------------------------------------------------------------
--6) List name of course for which more than 20 students are enrolled.
SELECT c.course_name
FROM Course c
JOIN Students s ON c.course_id = s.course_id
GROUP BY c.course_name
HAVING COUNT(*) >20
---------------------------------------------------------------------------------------------------------------------------------------
--7) List name of course for which maximum revenue was generated (max fee collection).
SELECT top 1 c.course_name
FROM Course c
JOIN Students s ON c.course_id = s.course_id
GROUP BY c.course_name
ORDER BY SUM(s.fees_paid) DESC

---------------------------------------------------------------------------------------------------------------------------------------
--8) Select name of student who are in same batch as ‘Suraj’.
SELECT s.sname
FROM Students s
JOIN Students suraj ON s.batch_id = suraj.batch_id
WHERE suraj.sname = 'Suraj'

---------------------------------------------------------------------------------------------------------------------------------------
--9) Delete all students who are in a course which is less than 2 months duration.
DELETE FROM Students
WHERE course_id IN (SELECT course_id FROM Course WHERE duration_months < 2)
---------------------------------------------------------------------------------------------------------------------------------------
--10) Delete all students for whom 'is_placed' is 'yes' and who have paid all the fees of their course.
DELETE FROM Students
WHERE is_placed = 'yes' AND fees_paid >= (SELECT total_fees FROM Course WHERE course_id = Students.course_id)
--------------------------------------------------------------------------------------------------------------------------------------
--11) Create a trigger to add student data in ex-student table if student is deleted from student table.
CREATE TABLE Ex_Student (
    rollno INT PRIMARY KEY,
    sname VARCHAR(255),
    degree VARCHAR(255),
    birthdate DATE,
    course_id INT,
    batch_id INT,
    fees_paid DECIMAL(10, 2),
    Remark VARCHAR(255),
    is_placed VARCHAR(3)
	foreign key (course_id)references Course(course_id)
)
-------------------------------------------------------------------------------------------------------------------------------------
--12) Create a view which shows name of trainer and number of students he is training.
CREATE VIEW Trainer_Student_Count AS
SELECT t.trainer_name, COUNT(*) AS student_count
FROM Trainer t
JOIN Course c ON t.trainer_id = c.trainer_id
JOIN Students s ON c.course_id = s.course_id
GROUP BY t.trainer_name

-------------------------------------------------------------------------------------------------------------------------------------
--13) Show names of students who are more than 20 years old.

-------------------------------------------------------------------------------------------------------------------------------------
--14) Show names of students who have paid all the fees.
SELECT sname
FROM Students
WHERE fees_paid >= (SELECT total_fees FROM Course WHERE course_id = Students.course_id)

-------------------------------------------------------------------------------------------------------------------------------------

