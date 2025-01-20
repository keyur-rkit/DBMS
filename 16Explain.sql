SELECT USER();

-- mysqldump -u [username] -p [database_name] > backup.sql
-- mysql -u [username] -p [database_name] < backup.sql

EXPLAIN SELECT * FROM Student WHERE Marks > 50 ORDER BY Marks ;
EXPLAIN SELECT * FROM Student where id=10;

EXPLAIN ANALYZE SELECT * FROM Student WHERE Marks > 50;

EXPLAIN FORMAT = TREE SELECT * FROM Student WHERE Marks > 50;

EXPLAIN FORMAT = JSON SELECT * FROM Student WHERE Marks > 50;