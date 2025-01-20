USE Practice;

-- creating table with auto_increment 
CREATE TABLE Student2 (
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO Student2 (Id,Name) VALUES
(null,"Keyur"),
(15,"Hit"),
(null,"Meet"),
(10,"Vivek"),
(null,"Drashti");

-- changing auto_increment start value
ALTER TABLE Student2 AUTO_INCREMENT = 100;

-- changing auto_increment gap
SET @@auto_increment_increment = 3;

SELECT 
	*
FROM 
	Student2;

DROP table student2;

