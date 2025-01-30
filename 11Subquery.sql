-- Using student tabel from '2Keyword' file
-- Subquery in SELECT clause
SELECT 
	Name,
	Marks,
	(SELECT AVG(Marks) FROM Student) AS AvgMarks
FROM 
	Student
HAVING 
	Marks > AvgMarks;
-- Find students with marks higher than the average marks

-- WHERE filters rows before the aggregation.
-- HAVING filters rows after the aggregation

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


-- Subquery with ANY/ALL
SELECT 
	Name,
	Marks
FROM 
	Student
WHERE 
	Marks > ALL (SELECT Marks FROM Student WHERE Class = 7);
-- Find students whose marks are greater than those of all students in class 7

