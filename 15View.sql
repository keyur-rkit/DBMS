-- Using student tabel from '2Keyword' file
-- Creating a View
CREATE VIEW View_Student_Details AS
SELECT 
    Id, Name, Class, Marks, City
FROM 
    Student
WHERE 
    Marks >= 50;
    
-- Querying the View
SELECT * FROM View_Student_Details;

-- Modifying a View
CREATE OR REPLACE VIEW View_Student_Details AS
SELECT 
    Id, Name, Class, Marks
FROM 
    Student
WHERE 
    Marks >= 70;
    
-- Dropping a View
DROP VIEW View_Student_Details;

