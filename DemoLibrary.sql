-- DBMS final demo

CREATE DATABASE DemoLibrary;

USE DemoLibrary;

CREATE TABLE Books (
    ISBN INT NOT NULL,
    BookTitle VARCHAR(50) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    RentalPrice INT NOT NULL,
    Status VARCHAR(50),
    Author VARCHAR(50),
    Publisher VARCHAR(50),
    PRIMARY KEY (ISBN)
);

DROP database library;
DROP TABLE books;

CREATE TABLE Customer (
    CustomerId INT NOT NULL AUTO_INCREMENT,
    CustomerName VARCHAR(50),
    CustomerAddress VARCHAR(100) NOT NULL,
    RegistrationDate DATE NOT NULL,
    PRIMARY KEY (CustomerId)
);

CREATE TABLE IssueStatus (
    IssueId INT NOT NULL AUTO_INCREMENT,
    IssuedCust INT NOT NULL,
    IssuedBookName VARCHAR(50) NOT NULL,
    IssueDate DATE NOT NULL,
    ISBNBook INT NOT NULL,
    PRIMARY KEY (IssueId),
    CONSTRAINT FK_ISBNBook FOREIGN KEY (ISBNBook)
        REFERENCES Books (ISBN),
    CONSTRAINT FK_IssuedCust FOREIGN KEY (IssuedCust)
        REFERENCES Customer (CustomerId)
);

CREATE TABLE ReturnStatus (
    ReturnId INT NOT NULL AUTO_INCREMENT,
    ReturnCust INT NOT NULL,
    ReturnedBookName VARCHAR(50) NOT NULL,
    ReturnDate DATE NOT NULL,
    ISBNBook2 INT NOT NULL,
    PRIMARY KEY (ReturnId),
    CONSTRAINT FK_ISBNBook2 FOREIGN KEY (ISBNBook2)
        REFERENCES Books (ISBN),
    CONSTRAINT FK_ReturnCust FOREIGN KEY (ReturnCust)
        REFERENCES IssueStatus (IssuedCust)
);

INSERT INTO Books (ISBN, BookTitle, Category, RentalPrice, Status, Author, Publisher) VALUES
(1001, 'The Great Gatsby', 'Fiction', 5, 'Available', 'F. Scott Fitzgerald', 'Scribner'),
(1487, 'Python Mastery', 'Technology', 12, NULL, 'Sarah Code', 'Tech House'),
(2234, 'Love in Paris', 'Romance', 4, 'Damaged', 'Emily Rose', 'Love Books'),
(9875, 'Data Science 101', 'Educational', 8, 'Rented', 'John Smith', 'Tech Press'),
(3421, 'Cooking Basics', 'Cooking', 6, NULL, 'Gordon Chef', 'Food Publishing'),
(7653, 'Space and Time', 'Science', 9, 'Available', 'Carl Cosmos', 'Universe Books'),
(5532, 'Murder Mystery', 'Crime', 7, 'Lost', 'Arthur Holmes', 'Mystery Press'),
(8967, 'Gardening Tips', 'Hobby', 3, 'Available', NULL, 'Green Thumb'),
(4489, 'Ancient History', 'History', 6, 'Rented', 'History Master', NULL),
(6743, 'Quantum Physics', 'Science', 11, 'Available', 'Einstein Jr', 'Science Pro'),
(9089, 'Web Development', 'Technology', 15, 'Damaged', 'Tech Guru', 'Code House'),
(2198, 'Healthy Living', 'Health', 5, NULL, 'Dr. Fit', 'Health Press'),
(5567, 'World War II', 'History', 8, 'Available', 'History Buff', 'Past Books'),
(7812, 'Poetry Volume 1', 'Poetry', 4, 'Lost', 'Robert Verse', NULL);

INSERT INTO Customer (CustomerName, CustomerAddress, RegistrationDate) VALUES
('John Doe', '123 Main St', '2024-01-01'),
(NULL, '987 Oak Road', '2023-05-15'),
('Sarah Johnson', '456 Pine Ave', '2023-12-10'),
('Mike Wilson', '230 Oak Lane', '2024-01-15'),
('Emily Brown', '789 Maple Dr', '2023-08-22'),
('Tom Harris', '321 Cedar St', '2023-11-30'),
('Lisa Chen', '654 Birch Rd', '2024-02-01'),
(NULL, '147 Elm Street', '2023-07-14'),
('David Kim', '258 Oak Lane', '2023-09-18'),
('Emma Davis', '369 Pine St', '2024-01-28');

INSERT INTO IssueStatus (IssuedCust, IssuedBookName, IssueDate, ISBNBook) VALUES
(1, 'The Great Gatsby', '2024-01-05', 1001),
(2, 'Python Mastery', '2023-12-15', 1487),
(3, 'Love in Paris', '2024-01-20', 2234),
(4, 'Data Science 101', '2023-11-28', 9875),
(5, 'Cooking Basics', '2024-02-01', 3421),
(7, 'Space and Time', '2023-12-05', 7653),
(7, 'Murder Mystery', '2024-01-10', 5532),
(8, 'Ancient History', '2023-11-15', 4489),
(6, 'Web Development', '2024-01-25', 9089),
(2, 'Healthy Living', '2023-12-20', 2198);

INSERT INTO ReturnStatus (ReturnCust, ReturnedBookName, ReturnDate, ISBNBook2) VALUES
(1, 'The Great Gatsby', '2024-01-15', 1001),
(2, 'Python Mastery', '2024-05-17', 1487),
(3, 'Love in Paris', '2024-02-01', 2234),
(4, 'Data Science 101', '2023-12-10', 9875),
(7, 'Space and Time', '2023-12-20', 7653),
(7, 'Murder Mystery', '2024-01-20', 5532),
(8, 'Ancient History', '2024-07-15', 4489),
(2, 'Web Development', '2024-02-05', 9089);

-- Data Sorting
-- Ascending order by BookTitle
SELECT 
    *
FROM
    Books
ORDER BY 
	BookTitle ASC;

-- Descending order by RentalPrice
SELECT 
    *
FROM
    Books
ORDER BY 
	RentalPrice DESC;

-- Multiple column sorting
SELECT 
    *
FROM
    Books
ORDER BY 
	Category ASC , RentalPrice DESC;

-- Null Value & Keyword
-- Finding books with NULL status
SELECT 
    *
FROM
    Books
WHERE
    Status IS NULL;

-- Finding customers with non-NULL names
SELECT 
    *
FROM
    Customer
WHERE
    CustomerName IS NOT NULL;

-- DML DQL DCL TCL DDL


-- Limit
-- Get top 5 expensive books
SELECT 
    *
FROM
    Books
ORDER BY 
	RentalPrice DESC 
LIMIT 5;

-- Skip first 5 and get next 5 books
SELECT 
    *
FROM
    Books
LIMIT 5 OFFSET 5;


-- Aggregate functions
-- COUNT total books
SELECT 
    COUNT(ISBN) AS TotalBooks
FROM
    Books;

-- AVG rental price by category
SELECT 
    Category, AVG(RentalPrice) AS AvgPrice
FROM
    Books
GROUP BY Category;

-- MAX and MIN rental prices
SELECT 
    MAX(RentalPrice) AS HighestPrice,
    MIN(RentalPrice) AS LowestPrice,
    COUNT(ISBN) AS TotalBooks,
    AVG(RentalPrice) AS AveragePrice
FROM
    Books;

-- Sub- Queries
-- Find books that are priced higher than average
SELECT 
    *
FROM
    Books
WHERE
    RentalPrice > (SELECT 
            AVG(RentalPrice)
        FROM
            Books);

-- Find customers who have issued books more than once
SELECT 
    CustomerName
FROM
    Customer
WHERE
    CustomerId IN (SELECT 
            IssuedCust
        FROM
            IssueStatus
        GROUP BY IssuedCust
        HAVING COUNT(ISBNBook) > 1);

-- Joins
-- Inner Join to get issued books with customer details
SELECT 
    c.CustomerName, i.IssuedBookName, i.IssueDate
FROM
    Customer c
        INNER JOIN
    IssueStatus i ON c.CustomerId = i.IssuedCust;

-- Left Outer Join to get all books and their issue status
SELECT 
    b.BookTitle, i.IssueDate
FROM
    Books b
        LEFT JOIN
    IssueStatus i ON b.ISBN = i.ISBNBook;


-- Unions
-- Combine lists of book names from issue and return status
SELECT 
    IssuedBookName AS BookName
FROM
    IssueStatus 
UNION SELECT 
    ReturnedBookName
FROM
    ReturnStatus;
    
-- Index
-- Create index on frequently searched columns
CREATE INDEX idx_book_title ON Books(BookTitle);
CREATE INDEX idx_customer_name ON Customer(CustomerName);

-- Show indexes
SHOW INDEX FROM Books;


-- View
-- Create a view for available books
CREATE VIEW AvailableBooks AS
    SELECT 
        ISBN, BookTitle, Category, RentalPrice
    FROM
        Books
    WHERE
        Status = 'Available';

-- Create a view for overdue books
CREATE VIEW OverdueBooks AS
    SELECT 
        i.IssuedBookName, c.CustomerName, i.IssueDate
    FROM
        IssueStatus i
            JOIN
        Customer c ON i.IssuedCust = c.CustomerId
            LEFT JOIN
        ReturnStatus r ON i.IssueId = r.ReturnId
    WHERE
        r.ReturnId IS NULL;


-- Explain
-- EXPLAIN to analyze query performance
EXPLAIN SELECT * FROM Books WHERE Category = 'Science';

EXPLAIN FORMAT = JSON SELECT b.BookTitle, c.CustomerName 
FROM Books b 
JOIN IssueStatus i ON b.ISBN = i.ISBNBook
JOIN Customer c ON i.IssuedCust = c.CustomerId;
