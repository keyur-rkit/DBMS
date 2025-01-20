INSERT INTO Books (ISBN, BookName, Category, Author) VALUES
(1001, 'The Great Gatsby', 'Fiction', 'F. Scott Fitzgerald'),
(1487, 'Python Mastery', 'Technology', 'Sarah Code'),
(2234, 'Love in Paris', 'Romance', 'Emily Rose'),
(9875, 'Data Science 101', 'Educational', 'John Smith'),
(3421, 'Cooking Basics', 'Cooking', 'Gordon Chef'),
(7653, 'Space and Time', 'Science', 'Carl Cosmos'),
(5532, 'Murder Mystery', 'Crime', 'Arthur Holmes');

-- Create (Post)
INSERT INTO Books (ISBN, BookName, Category, Author) VALUES
(1001, 'The Great Gatsby', 'Fiction', 'F. Scott Fitzgerald');

-- read all (GetAll)
SELECT 
    *
FROM
    Books;	

-- read by ISBN (GetByID)
SELECT 
    *
FROM
    Books
WHERE
    ISBN = 1;

-- update (Put)
UPDATE Books SET BookName = "NewName", Category = "NewCategory" , Author = "NewAuthor" WHERE ISBN = 1;

-- delete 
DELETE FROM Books where ISBN =1;