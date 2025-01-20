USE Practice;

CREATE TABLE Student (
	Id INT,
	Name VARCHAR(50),
	Class INT,
	Marks INT,
	City VARCHAR(30),
	SubjectId INT
);

truncate table student;

INSERT INTO Student (Id, Name, Class, Marks, City, SubjectId) VALUES
(1, 'Keyur', 12, 80, NULL, 1),
(2, 'Hit', 11, 77, 'surat', 3),
(3, 'Meet', 7, 65, 'rajkot', 5),
(4, 'Vivek', 10, 97, NULL, 4),
(5, 'Drashti', 5, 79, 'surat', NULL),
(6, 'Prashil', 12, 35, 'morbi', 2),
(7, 'Dhruv', 10, 45, 'rajkot', 4),
(8, 'Madhav', 12, 99, NULL, 1),
(9, 'Purv', 11, 12, 'morbi', 3),
(10, 'Mann', 9, 68, 'ahemdabad', 6),
(11, 'Piyush', 7, 87, 'surat', 5);

-- finding null City roows
SELECT
	*
FROM 
	Student
WHERE
	City IS NULL;
    
-- finding non null City rows
SELECT
	*
FROM
	Student
WHERE
	City IS NOT NULL;
    
-- finding Student with Id between 2 and 3
SELECT
	*
FROM 
	Student
WHERE 
	Id BETWEEN 5 AND 9;

-- finding Student which has 't' on end
SELECT
	*
FROM 
	Student
WHERE 
	Name LIKE '%t';
    
-- finding Student which has Id in (2,5,6)
SELECT
	*
FROM 
	Student
WHERE 
	Id IN (2,5,6);
