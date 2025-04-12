
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

    FOREIGN KEY (language_id) REFERENCES language(language_id)
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
create table customer(
customer_id int auto_increment primary key,
 first_name varchar(100),
 last_name varchar(100),
 email varchar(100),
 phone varchar(100),
 regis_date date
 );
 
  -- country table
 create table country(
 country_id int auto_increment primary key,
 country_name varchar(100)
 );
 
 --  address status table
 create table address_status(
 address_id int auto_increment primary key,
 status_name varchar(100)
 );
 
--  address table
 create table address(
 address_id int auto_increment primary key,
 street varchar(100),
 city varchar(100),
 postal_code varchar(100),
 country_id int,
 foreign key(country_id) references country(country_id),
 status_id int,
 foreign key(status_id) references address_status(address_id)
 );
 
 -- customer_address table
 create table customer_address(
 customer_id int,
 foreign key(customer_id) references customer(customer_id),
 
 address_id int,
 foreign key(address_id) references address(address_id)
 );
 