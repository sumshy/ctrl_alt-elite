# 📚 Bookstore Database Management System

This project represents a complete design and implementation of a **Bookstore Database System** in MySQL. It efficiently manages the bookstore’s operations, including **inventory tracking**, **customer management**, **order processing**, **address handling**, and **role-based user access**.

---

## 🗂️ Entity-Relationship Overview

The system is modeled using 15 interconnected tables, with **foreign keys**, **lookup tables**, and **enum values** for clean, normalized relational design.

### 📖 Books
- Tracks each book's publication year, language, price, stock level, and publisher.
- Connected to authors via a **many-to-many** relationship using `book_author`.

### ✍️ Authors & 📦 Publishers
- `author`: Stores basic info (first and last names).
- `publisher`: Holds publisher details and is referenced by books.
- `book_author`: A junction table managing the many-to-many relationship between books and authors.

### 👥 Customers
- Captures customer details like name, contact, and registration date.
- Linked to multiple addresses via the `customer_address` table.

### 🏡 Addresses & 🌍 Countries
- `address`: Stores street, city, postal code, and country info.
- `country`: A lookup table of all countries.
- Each address also has a `status_id` (linked to `address_status`) and a **purpose** stored in `customer_address.address_type` using an `ENUM` (e.g., `'current'`, `'old'`).

### 🧾 Orders & Order Lines
- `cust_order`: Stores customer orders with status, shipping method, and timestamp.
- `order_line`: Contains individual books within an order, with quantity and per-item price.

### 🚚 Shipping & 📦 Order Status
- `shipping_method`: Defines available shipping types (e.g., Standard, Express).
- `order_status`: Lookup table for tracking current state (e.g., pending, shipped, delivered).

### 🕓 Order History
- `order_history`: Logs every change in order status over time.

---

## 🔐 Roles & Permissions (MySQL)

This system is designed with **role-based access control**:

| Role          | Privileges                                |
|---------------|--------------------------------------------|
| `admin_role`  | Full access with `GRANT OPTION` on all DBs |
| `developer`   | `SELECT`, `INSERT`, `UPDATE`, `DELETE` on `bookstore_db` only |

### 👤 Users Created
- `David` → `admin_role`
- `Sumaya`, `Grace` → `developer`

---

## ✅ Key Features

- 15 normalized and well-connected tables
- Use of `ENUM` in `customer_address` for simple status tracking
- Referential integrity via foreign key constraints
- Role-based access for safe collaboration
- Smart use of `DEFAULT CURRENT_TIMESTAMP` and `ON DELETE CASCADE` for automation and cleanup

---

## 📁 Tools Used

- **MySQL**: For database schema design and queries
- **Draw.io**: For ERD visualization

---

## 📌 Setup

To use the database:
1. Import the SQL schema into your MySQL server.
2. Run the role and user creation script (with strong passwords).
3. Start testing using your preferred SQL client or workbench.

---

Happy querying! 📊🧠
