-- Using student tabel from '2Keyword' file
-- Retrieve the First N Rows
SELECT 
	* 
FROM 
	Student 
LIMIT 5;

-- Skip Rows and Retrieve the Next N Rows
SELECT 
	* 
FROM 
    Student 
LIMIT 5 OFFSET 5;

-- Retrieve a Limited Number of Rows with Sorting
SELECT 
	* 
FROM 
    Student 
ORDER BY 
    Class DESC 
LIMIT 3;