
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
    regis_date DATE DEFAULT CURRENT_DATE
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
 CREATE TABLE customer_address (
    customer_id INT,
    address_id INT,
    address_type ENUM('current', 'old') NOT NULL,

    PRIMARY KEY (customer_id, address_id),

    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
        ON DELETE CASCADE ON UPDATE CASCADE,

    FOREIGN KEY (address_id) REFERENCES address(address_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

 
 -- cust_order table
 CREATE TABLE cust_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status_id INT,
    shipping_method_id INT,
    total_amount DECIMAL(10, 2),

    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
        ON DELETE CASCADE ON UPDATE CASCADE,

    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
        ON DELETE SET NULL ON UPDATE CASCADE,

    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id)
        ON DELETE SET NULL ON UPDATE CASCADE
);

-- order_line Table
CREATE TABLE order_line (
    order_id INT,
    book_id INT,
    quantity INT NOT NULL,
    price_each DECIMAL(10, 2) NOT NULL,

    PRIMARY KEY (order_id, book_id),

    FOREIGN KEY (order_id) REFERENCES cust_order(order_id)
        ON DELETE CASCADE ON UPDATE CASCADE,

    FOREIGN KEY (book_id) REFERENCES book(book_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- shipping_method table
CREATE TABLE shipping_method (
    shipping_method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

-- order_history table
CREATE TABLE order_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    status_id INT,
    changed_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    note TEXT,

    FOREIGN KEY (order_id) REFERENCES cust_order(order_id)
        ON DELETE CASCADE ON UPDATE CASCADE,

    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
        ON DELETE SET NULL ON UPDATE CASCADE
);

 -- order_ststus table
CREATE TABLE order_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL UNIQUE
);
