-- to see all users
SELECT 
    user
FROM
    mysql.user;

-- to create user with password
CREATE USER 'keyur'@'localhost' IDENTIFIED BY '123123';

-- to grant permissions
GRANT ALL ON practice.* TO 'keyur'@'localhost' WITH GRANT OPTION; 
GRANT SELECT,INSERT ON practice.employee TO 'keyur'@'localhost';

SHOW GRANTS FOR 'keyur'@'localhost';

-- to revoke permissions
REVOKE ALL ON *.* FROM 'keyur'@'localhost';
REVOKE INSERT ON practice.employee FROM 'keyur'@'localhost';