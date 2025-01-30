-- Using student tabel from '2Keyword' file
CREATE TABLE Subject (
	SubjectId INT,
	SubjectName VARCHAR(50),
	Class INT
);

INSERT INTO Subject (SubjectId, SubjectName, Class) VALUES
(1, 'Maths', 12),
(2, 'Physics', 12),
(3, 'Chemistry', 11),
(4, 'Hindi', 10),
(5, 'Computer', 7),
(6, 'Gujrati', 9),
(7,'Sanskrit',11);

SELECT * FROM student;
SELECT * FROM Subject;

-- INNER JOIN
SELECT 
	S.Name AS StudentName,
	S.Class,
	Sub.SubjectName
FROM 
	Student S
INNER JOIN 
	Subject Sub
ON 
	S.SubjectId = Sub.SubjectId;
-- Get students and their subjects based on SubjectId

-- LEFT OUTER JOIN 
SELECT 
	S.Name AS StudentName,
	S.Class,
	Sub.SubjectName
FROM 
	Student S
LEFT JOIN 
	Subject Sub
ON 
	S.SubjectId = Sub.SubjectId;
-- Get all students and their subjects, including students without a subject assigned

-- RIGHT OUTER JOIN 
SELECT 
	S.Name AS StudentName,
	S.Class,
	Sub.SubjectName
FROM 
	Student S
RIGHT JOIN 
	Subject Sub
ON 
	S.SubjectId = Sub.SubjectId;
-- Get all subjects and the students enrolled in those subjects, including subjects without students

-- FULL OUTER JOIN
SELECT 
	S.Name AS StudentName,
	S.Class,
	Sub.SubjectName
FROM 
	Student S
LEFT JOIN 
	Subject Sub
ON 
	S.SubjectId = Sub.SubjectId
UNION
SELECT 
	S.Name AS StudentName,
	S.Class,
	Sub.SubjectName
FROM 
	Student S
RIGHT JOIN 
	Subject Sub
ON 
	S.SubjectId = Sub.SubjectId;
-- Get all students and subjects, including those without matching entries (simulated using UNION)

-- CROSS JOIN
SELECT 
	S.Name AS StudentName,
	Sub.SubjectName
FROM 
	Student S
CROSS JOIN 
	Subject Sub;
-- Get all possible combinations of students and subjects

-- NATURAL JOIN
SELECT 
    *
FROM
    student
        NATURAL JOIN
    subject;
