-- Displays the current MySQL user
SELECT USER();  

  -- Shows how MySQL plans to execute the query to filter and order rows
EXPLAIN SELECT * FROM Student WHERE Marks > 50 ORDER BY Marks;

EXPLAIN SELECT * FROM Student WHERE id = 10; 

-- Executes the query and shows the execution plan along with actual runtime statistics
EXPLAIN ANALYZE SELECT * FROM Student WHERE Marks > 50;  

-- Provides the execution plan in a tree format (more detailed and hierarchical)
EXPLAIN FORMAT = TREE SELECT * FROM Student WHERE Marks > 50;  

 -- Provides the execution plan in JSON format (machine-readable format)
EXPLAIN FORMAT = JSON SELECT * FROM Student WHERE Marks > 50; 
