-- Using student tabel from '2Keyword' file
-- Using subject tabel from '12Joins' file

-- Basic UNION (Remove Duplicates)
SELECT 
    Name, Class, Marks
FROM
    Student
WHERE
    Class = 12 
UNION SELECT 
    Name, Class, Marks
FROM
    Student
WHERE
    Class = 11 
UNION SELECT 
    Name, Class, Marks
FROM
    Student
WHERE
    Class = 10;

-- UNION ALL (Include Duplicates)
SELECT 
	Class 
FROM 
	Student
UNION ALL
SELECT 
	Class 
FROM 
	Subject;

-- Combine Student Names with Subject Names
SELECT 
	Name AS EntityName, 'Student' AS EntityType
FROM 
	Student
UNION
SELECT 
	SubjectName AS EntityName, 'Subject' AS EntityType
FROM 
	Subject;

-- Union with ORDER BY
SELECT 
    *
FROM
    (SELECT 
        Name, Class
    FROM
        Student
    WHERE
        Class = 12 UNION SELECT 
        Name, Class
    FROM
        Student
    WHERE
        Class = 11) AS Combined
ORDER BY Class DESC;



