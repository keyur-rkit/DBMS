-- to see all users
SELECT 
    user
FROM
    mysql.user;

-- to create user with password
CREATE USER 'keyur'@'localhost' IDENTIFIED BY '123123';

-- to grant permissions
GRANT ALL PRIVILEGES ON practice.* TO 'keyur'@'localhost' WITH GRANT OPTION; 
GRANT SELECT,INSERT ON practice.employee TO 'keyur'@'localhost';

SHOW GRANTS FOR 'keyur'@'localhost';

-- to revoke permissions
REVOKE ALL PRIVILEGES ON practice.* FROM 'keyur'@'localhost';
REVOKE SELECT ON practice.employee FROM 'keyur'@'localhost';