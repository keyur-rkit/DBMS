-- Using student tabel from '2Keyword' file
-- Retrieve All Records
SELECT 
	* 
FROM 
	Student;

-- Retrieve Specific Columns
SELECT 
	Name, City 
FROM 
	Student;

-- Filter Records Using WHERE
SELECT 
	* 
FROM 
	Student 
WHERE 
	City = 'Surat';
    
-- Filter Record with Like
SELECT 
    *
FROM
    Student
WHERE
    City LIKE '%t';
    
SELECT 
    *
FROM
    Student
WHERE
    City LIKE 'sur_t';

-- Sort Records Using ORDER BY
SELECT 
	* 
FROM 
	Student 
ORDER BY 
	Class DESC;

-- Group Records Using GROUP BY
SELECT 
    City, COUNT(Id) AS StudentCount
FROM
    Student
GROUP BY City
HAVING StudentCount > 2
ORDER BY City DESC
LIMIT 2;
    

-- USE PRACTICE;


