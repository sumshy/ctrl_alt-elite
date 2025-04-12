
-- Create and use the Bookstore database 

CREATE DATABASE bookstore_db;
USE bookstore_db;

-- Create Role
CREATE ROLE 'admin_role'
CREATE ROLE 'developer';

-- Grant Permissions to the Role
GRANT ALL PRIVILEGES ON *.* TO 'admin_role' WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstore_db.* TO developer;

-- Users of the Created Database

CREATE USER 'David'@'localhost' IDENTIFIED BY 'D8d4-!789';
CREATE USER 'Sumaya'@'localhost' IDENTIFIED BY '$uM@ya-43';
CREATE USER 'Grace'@'localhost' IDENTIFIED BY 'Gr%-*ce!';

-- Assigning Roles to each User

GRANT admin_role TO 'David'@'localhost';
GRANT developer TO 'Sumaya'@'localhost';
GRANT developer TO 'Grace'@'localhost';


-- Table Creation 

-- 1. Book Table
CREATE TABLE book (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    publication_year YEAR NOT NULL,
    language_id INT,
    publisher_id INT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0,

    FOREIGN KEY (language_id) REFERENCES book_language(language_id)
        ON DELETE CASCADE ON UPDATE CASCADE,

    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);


-- 2. Book Author Table
CREATE TABLE book_author (
    book_id INT,
    author_id INT,

    PRIMARY KEY (book_id, author_id),

    FOREIGN KEY (book_id) REFERENCES book(book_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (author_id) REFERENCES author(author_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
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


-- customer table
CREATE TABLE customer(
    customer_id INT auto_increment primary key,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(100),
    regis_date date
 );
 
  -- country table
 CREATE TABLE country(
    country_id INT auto_increment PRIMARY KEY,
    country_code VARCHAR(10),
    country_name VARCHAR(100)
 );
 
 --  address status table
 CREATE TABLE address_status(
    status_id INT auto_increment PRIMARY KEY,
    status_name VARCHAR(100)
 );
 
--  address table
 CREATE TABLE address(
    address_id INT auto_increment PRIMARY KEY,
    street VARCHAR(100),
    city VARCHAR(100),
    postal_code VARCHAR(100),
    country_id INT,
    FOREIGN KEY(country_id) REFERENCES country(country_id),
    status_id INT,
    FOREIGN KEY(status_id) REFERENCES address_status(status_id)
 );
 
 -- customer_address table
 CREATE TABLE customer_address(
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
    
    address_id INT,
    FOREIGN KEY(address_id) REFERENCES address(address_id)
 );
 