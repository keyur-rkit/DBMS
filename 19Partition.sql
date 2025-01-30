
USE Practice;

-- Create a partitioned table.
CREATE TABLE IF NOT EXISTS sales (
    id INT NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    sales_amount DECIMAL(10, 2) NOT NULL,
    sales_date DATE NOT NULL
)
PARTITION BY RANGE (YEAR(sales_date)) (
    PARTITION p0 VALUES LESS THAN (2015), -- Data before 2015
    PARTITION p1 VALUES LESS THAN (2020), -- Data from 2015 to 2019
    PARTITION p2 VALUES LESS THAN (2025), -- Data from 2020 to 2024
    PARTITION p3 VALUES LESS THAN MAXVALUE -- Data from 2025 onward
);

-- Insert data into the table.
INSERT INTO sales (id, product_name, sales_amount, sales_date) VALUES
(1, 'Product A', 1000.00, '2014-12-31'),
(2, 'Product B', 1500.00, '2016-07-15'),
(3, 'Product C', 2000.00, '2021-03-10'),
(4, 'Product D', 2500.00, '2023-11-05'),
(5, 'Product E', 3000.00, '2026-01-01');

-- Retrieve all records to see how data is stored across partitions.
SELECT * FROM sales;

EXPLAIN SELECT * FROM Sales;
 
SELECT TABLE_NAME, PARTITION_NAME , TABLE_ROWS
FROM INFORMATION_SCHEMA.PARTITIONS 
WHERE TABLE_SCHEMA = "Practice" AND TABLE_NAME="Sales";


-- Add partition 
ALTER TABLE sales ADD PARTITION (
    PARTITION p4 VALUES LESS THAN (2030)
);

-- Drop partition
ALTER TABLE sales DROP PARTITION p3;

-- DROP TABLE sales;

