USE practice;

-- table with JSON datatype
CREATE TABLE users(
	id INT AUTO_INCREMENT PRIMARY KEY Comment "ID",
    name VARCHAR(50),
    details JSON
);

-- inserting JSON datatype
INSERT INTO users (name,details) VALUES ('Keyur','{"age":20,"city":"Morbi"}');

-- inserting complex JSON datatype
INSERT INTO users (name,details) VALUES ('Hit','{"age":21,"city":"Morbi","skills":["C++","React"]}');

-- fetching entire JSON
SELECT details FROM users;

-- Extractimg Specific Data 
SELECT JSON_EXTRACT(details,'$.age') AS age FROM users;
SELECT details->'$.city' FROM users WHERE name = "Hit";

-- updating JSON data
UPDATE users 
SET 
    details = JSON_SET(details, '$.city', 'Surat')
WHERE
    name = 'Hit';

UPDATE users 
SET 
    details = JSON_INSERT(details, '$.state', 'Gujrat');

UPDATE users 
SET 
    details = JSON_REMOVE(details, '$.state', 'Gujrat')
WHERE
    name = 'Keyur';
    
-- Aggregating JSON data
-- JSON array
SELECT JSON_ARRAYAGG(name) AS user_names FROM users;
-- Grouping into JSON
SELECT JSON_OBJECTAGG(id,name) AS user_data FROM users;

-- Validating JSON
SELECT JSON_VALID(details) AS is_valid FROM users;
SELECT JSON_VALID(name) AS is_valid FROM users;

SET SQL_SAFE_UPDATES = 0;
DROP TABLE users;
