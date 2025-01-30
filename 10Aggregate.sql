-- COUNT()
SELECT 
	COUNT(Id) AS TotalStudents
FROM 
	Student;

-- SUM()
SELECT 
	SUM(Marks) AS TotalStudentMarks
FROM 
	Student;

-- AVG()
SELECT 
	AVG(Marks) AS AverageMarks
FROM 
	Student;
    
-- Round
SELECT 
	ROUND(AVG(Marks)) AS AverageMarks
FROM 
	Student;
    
-- Format
SELECT 
	FORMAT(AVG(Marks),2) AS AverageMarks
FROM 
	Student;

-- Using student tabel from '2Keyword' file
-- MAX()
SELECT 
	MAX(Marks) AS MaxMarks
FROM 
	Student;

-- MIN()
SELECT 
	MIN(Marks) AS MinMarks
FROM 
	Student;

-- GROUP BY with Aggregate Functions
SELECT 
	City, MAX(Marks) AS MaxMarksInCity
FROM 
	Student
GROUP BY 
	City;

-- combines the results into a single string
SELECT group_concat(marks," ",city) from student ;
