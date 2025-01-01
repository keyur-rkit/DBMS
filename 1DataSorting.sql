CREATE DATABASE Practice;
USE Practice;

CREATE TABLE Employee (
	Id INT,
    Name VARCHAR(50),
    Salary INT
);

INSERT INTO Employee (Id,Name,Salary) VALUES
(1,"Keyur",25000),
(2,"Hit",30000),
(3,"Meet",40000),
(4,"Vivek",35000),
(5,"Vivek",50000);

-- Sort employee name alphabetically (default for order by is asc)
SELECT 
	Id,Name
FROM
	Employee
ORDER BY 
	Name;
        
-- Sort employee by salary in Descending order
SELECT 
	Name,Salary
FROM
	Employee
ORDER BY
	Salary desc;
    
-- Sort by name then sort by salary in Descending order
SELECT 
	Id,Name,Salary
FROM 
	Employee
ORDER BY
	Name,Salary desc;