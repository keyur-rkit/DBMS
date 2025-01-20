-- Create expenses table
CREATE TABLE expenses (
    expenseId INT PRIMARY KEY,
    expensesName VARCHAR(50),
    expensesTotal DECIMAL(10,2)
);

-- Insert sample data into expenses table
INSERT INTO expenses
VALUES 
    (1, "salary", 0),
    (2, "taxes", 0);

-- to check trigger wroks or not
SELECT * FROM expenses;

SELECT * FROM employee;

TRUNCATE TABLE expenses;

-- Update salary expense based on total salary in the employee table
UPDATE expenses 
SET expensesTotal = (SELECT SUM(salary) FROM employee) 
WHERE expensesName = "salary";

-- Disable safe updates to allow updates without a WHERE clause
SET SQL_SAFE_UPDATES = 0;

-- Triggers to update salary expense after insert, update, or delete in the employee table
CREATE TRIGGER afterSalaryInsert 
AFTER INSERT ON employee
FOR EACH ROW
UPDATE expenses
SET expensesTotal = (SELECT SUM(salary) FROM employee) 
WHERE expensesName = "salary";

CREATE TRIGGER afterSalaryDelete 
AFTER DELETE ON employee
FOR EACH ROW
UPDATE expenses
SET expensesTotal = (SELECT SUM(salary) FROM employee) 
WHERE expensesName = "salary";

CREATE TRIGGER afterSalaryUpdate
AFTER UPDATE ON employee
FOR EACH ROW
UPDATE expenses
SET expensesTotal = (SELECT SUM(salary) FROM employee) 
WHERE expensesName = "salary";

-- Insert, delete, and update employee to trigger salary changes
INSERT INTO employee VALUES (6, "Drashti", 35000);
DELETE FROM employee WHERE id = 6;
UPDATE employee SET salary = 50000 WHERE id = 1;

-- Show all triggers
SHOW TRIGGERS;

-- Create stored procedure with cursor to update NULL cities in student table
DELIMITER $$  
CREATE PROCEDURE ReadCursor()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE stuID INT;
    DECLARE stuCity VARCHAR(50);
    DECLARE readNullCursor CURSOR FOR SELECT id, city FROM student;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN readNullCursor;
    readLoop: LOOP
        FETCH readNullCursor INTO stuID, stuCity;
        IF done THEN LEAVE readLoop; END IF;
        IF stuCity IS NULL THEN 
            UPDATE student SET city = "Morbi" WHERE id = stuID;
        END IF;
    END LOOP;

    SELECT * FROM student;
    CLOSE readNullCursor;
END $$
DELIMITER ;

-- Call procedure to update student cities
CALL ReadCursor();

-- Clean up by dropping procedure
DROP PROCEDURE ReadCursor;

-- View updated student table
SELECT * FROM student;
