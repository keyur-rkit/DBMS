CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    City VARCHAR(50),
    IsFullTime BOOL
);

-- INSERT
-- Insert Single Row
INSERT INTO Employees (EmployeeID, Name, City, IsFullTime) VALUE (1, 'Keyur','Morbi',TRUE);

-- Insert Multiple Rows
INSERT INTO Employees (EmployeeID, Name, City, IsFullTime) VALUES 
(2, 'Hit','Surat',TRUE),
(3, 'Meet','Surat',FALSE),
(4, 'Vivek','Vadodara',TRUE);

-- UPDATE
-- Update Single Column
UPDATE Employees
SET IsFullTime = TRUE
WHERE EmployeeID = 1;

-- Update Multiple Columns
UPDATE Employees
SET IsFullTime = TRUE, City = 'Rajkot'
WHERE EmployeeId = 2;


-- DELETE
-- Delete Specific Rows
DELETE FROM Employees
WHERE Name = 'Vivek';

-- Delete All Rows From a Table
DELETE FROM Employees;


-- For update or delete records without specifying a key
SET SQL_SAFE_UPDATES = 0;
SHOW VARIABLES LIKE 'SQL_SAFE_UPDATES';

