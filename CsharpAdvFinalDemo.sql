-- Database from Csharp Adv Final Demo

CREATE DATABASE BookStoreFinal;

USE BookStoreFinal;

CREATE TABLE USR01(
	R01F01 INT AUTO_INCREMENT PRIMARY KEY COMMENT "UserId",
    R01F02 VARCHAR(50) NOT NULL UNIQUE COMMENT "Username",
    R01F03 VARCHAR(255) NOT NULL UNIQUE COMMENT "Email",
    R01F04 VARCHAR(255) NOT NULL COMMENT "Password",
    R01F05 VARCHAR(50) NOT NULL COMMENT "Role",
    R01F06 DATETIME NOT NULL COMMENT "CreatedAt",
    R01F07 DATETIME NOT NULL COMMENT "UpdatedAt"
) COMMENT "Users"; 

CREATE TABLE AUH01(
	H01F01 INT AUTO_INCREMENT PRIMARY KEY COMMENT "AuthorId",
    H01F02 VARCHAR(50) NOT NULL COMMENT "Name",
    H01F03 VARCHAR(255) COMMENT "Bio",
    H01FO4 DATETIME NOT NULL COMMENT "CreatedAt",
    H01F05 DATETIME NOT NULL COMMENT "UpdatedAt"
) COMMENT "Authors"; 

CREATE TABLE CAT01(
	T01F01 INT AUTO_INCREMENT PRIMARY KEY COMMENT "CategoryId",
    T01F02 VARCHAR(50) NOT NULL COMMENT "Name",
    T01F03 VARCHAR(255) COMMENT "Description",
    T01FO4 DATETIME NOT NULL COMMENT "CreatedAt",
    T01F05 DATETIME NOT NULL COMMENT "UpdatedAt"
) COMMENT "Categories"; 

CREATE TABLE BKS01(
	S01F01 INT AUTO_INCREMENT PRIMARY KEY COMMENT "BookId",
    S01F02 VARCHAR(255) NOT NULL COMMENT "Title",
    S01F03 INT NOT NULL COMMENT "AuthorId",
    S01F04 INT NOT NULL COMMENT "CategoryId",
    S01F05 VARCHAR(13) NOT NULL UNIQUE COMMENT "ISBN",
    S01F06 INT NOT NULL COMMENT "AvailableCopies",
    S01F07 DATETIME NOT NULL COMMENT "CreatedAt",
    S01F08 DATETIME NOT NULL COMMENT "UpdatedAt",
    FOREIGN KEY (S01F03) REFERENCES AUH01(H01F01) ON UPDATE CASCADE,
    FOREIGN KEY (S01F04) REFERENCES CAT01(T01F01) ON UPDATE CASCADE
) COMMENT "Books";

CREATE TABLE BRW01(
	W01F01 INT AUTO_INCREMENT PRIMARY KEY COMMENT "RecordId",
    W01F02 INT NOT NULL COMMENT "UserID",
    W01F03 INT NOT NULL COMMENT "BookId",
    W01F04 DATETIME NOT NULL COMMENT "BorrowDate",
    W01F05 DATETIME COMMENT "ReturnDate",
	W01F06 DATETIME NOT NULL COMMENT "CreatedAt",
    W01F07 DATETIME NOT NULL COMMENT "UpdatedAt",
	FOREIGN KEY (W01F02) REFERENCES USR01(R01F01) ON UPDATE CASCADE,
    FOREIGN KEY (W01F03) REFERENCES BKS01(S01F01) ON UPDATE CASCADE
) COMMENT "BorrowRecords";

