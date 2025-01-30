-- database for DBMS CURD and final demo of basic api
Use library;
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


CREATE TABLE user (
	id int primary key auto_increment,
    username varchar(150) unique,
    password varchar(150) not null,
    role varchar(20) not null
);

SELECT * FROM user;