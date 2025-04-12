
Bookstore Database:
This project represents the design and structure of a Bookstore Management Database System, built to handle various operations such as book inventory, customer management, order processing, shipping, and address tracking.

 Entity-Relationship Diagram (ERD):
The ERD showcases how different entities in the bookstore interact with one another. Key components include:

Books: Stores information about book titles, language, price, stock, and associated publishers and authors.

Authors & Publishers: Connected through a junction table (book_author) to handle many-to-many relationships between books and authors.

Customers: Stores customer details and is linked to multiple addresses through customer_address.

Orders: Each customer can place orders, consisting of one or more books (order_line). Orders are tied to shipping methods and order statuses.

Shipping & Order Status: Tracks how orders are delivered and their current processing state.

Addresses: Each customer can have multiple addresses, with details about their status and location (linked to countries).

Order History: Logs the progression of orders over time.

 Roles & Permissions:
This project is designed for collaborative development, where MySQL roles can be created and assigned to multiple collaborators. Roles restrict access based on the required actions such as read, write, or update.