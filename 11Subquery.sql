-- Using student tabel from '2Keyword' file
-- Subquery in SELECT clause
SELECT 
	Name,
	Marks,
	(SELECT AVG(Marks) FROM Student) AS AvgMarks
FROM 
	Student
WHERE 
	Marks > (SELECT AVG(Marks) FROM Student);
-- Find students with marks higher than the average marks


-- Subquery in WHERE clause
SELECT 
	Name,
	Class,
	Marks
FROM
	Student
WHERE 
	Class IN (SELECT Class FROM Student GROUP BY Class HAVING AVG(Marks) > 70);
-- List students from classes where the average marks are greater than 70


-- Correlated Subquery
SELECT 
	Name,
	Class,
	Marks
FROM 
	Student S1
WHERE 
	Marks > (SELECT AVG(Marks) FROM Student S2 WHERE S1.Class = S2.Class);
-- List students who have marks greater than the average marks of their class


-- Subquery to find maximum value
SELECT 
	Name,
	Marks
FROM 
	Student
WHERE 
	Marks = (SELECT MAX(Marks) FROM Student);
-- Find the student(s) with the highest marks


-- Subquery with ANY/ALL
SELECT 
	Name,
	Marks
FROM 
	Student
WHERE 
	Marks > ALL (SELECT Marks FROM Student WHERE Class = 7);
-- Find students whose marks are greater than those of all students in class 7

