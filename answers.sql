
-- Create and use the Bookstore database 

CREATE DATABASE bookstore_db;
USE bookstore_db;

-- Create Role

CREATE ROLE developer;

-- Grant Permissions to the Role
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstore_db.* TO developer;

-- Users of the Created Database

CREATE USER 'David'@'%' IDENTIFIED BY 'D8d4-!789';
CREATE USER 'Sumaya'@'%' IDENTIFIED BY '$uM@ya-43';
CREATE USER 'Grace'@'%' IDENTIFIED BY 'Gr%-*ce!'

-- Assigning Roles to each User

GRANT developer TO 'David'@'%';
GRANT developer TO 'Sumaya'@'%';
GRANT developer TO 'Grace'@'%';

-- Table Creation 

-- 1. Book Table
CREATE TABLE book (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    publication_year YEAR NOT NULL,
    language_id INT REFERENCES language(language_id) ON DELETE SET NULL ON UPDATE CASCADE,
    publisher_id INT REFERENCES publisher(publisher_id) ON DELETE SET NULL ON UPDATE CASCADE,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0
);



-- 2. Book Author Table
CREATE TABLE book_author (
    book_id INT REFERENCES book(book_id) ON DELETE CASCADE ON UPDATE CASCADE,
    author_id INT REFERENCES author(author_id) ON DELETE CASCADE ON UPDATE CASCADE,
    
    PRIMARY KEY (book_id, author_id)
);

-- 3. Author Table
CREATE TABLE author (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL
);

-- 4. Book Language Table
CREATE TABLE book_language (
    language_id INT PRIMARY KEY AUTO_INCREMENT,
    language_name VARCHAR(50) NOT NULL UNIQUE
);

-- 5. Publisher Table
CREATE TABLE publisher (
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(150) NOT NULL,
    contact_email VARCHAR(100)
);
