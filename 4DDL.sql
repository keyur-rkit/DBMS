-- 1. CREATE Command
-- Create a database
CREATE DATABASE Practice;

-- Create a table
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Position VARCHAR(255),
    HireDate DATE,
    Department VARCHAR(100)
);


-- 2. ALTER Command
-- Add a new column to the table
ALTER TABLE Employees ADD Salary DECIMAL(10, 2);

-- Modify the data type of an existing column
ALTER TABLE Employees MODIFY Department VARCHAR(150);

-- Rename a column
ALTER TABLE Employees CHANGE HireDate JoiningDate DATE;

-- Drop a column
ALTER TABLE Employees DROP COLUMN Salary;

-- Rename the table
ALTER TABLE Employees RENAME TO CompanyEmployees;


-- 3. RENAME Command
-- Rename Employees to NewEmployees
RENAME TABLE CompanyEmployees TO NewEmployees;


-- 4. COMMENT Command
-- Adding a comment to a table
ALTER TABLE NewEmployees COMMENT 'This table stores Employee data records';

-- Adding a comment to a column
ALTER TABLE NewEmployees MODIFY Position VARCHAR(255) COMMENT 'Contains position details';


-- 5. DROP Command
-- Drop a table
DROP TABLE NewEmployees;

-- Drop a database
DROP DATABASE Practice;


-- 6. TRUNCATE Command
-- Truncate a table
CREATE TABLE Sample (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50)
);

-- Insert sample data
INSERT INTO Sample (Name) VALUES 
('Keyur'), 
('Hit');

-- Truncate the table
TRUNCATE TABLE Sample;

