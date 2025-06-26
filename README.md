University Library Management System


This repository contains a comprehensive database system designed and implemented for a University Library Management System. Developed as the final assignment for the Database (MySQL/Oracle/SQL Server) course, this project focuses specifically on Oracle Database to manage core library operations efficiently.

The system aims to provide a robust solution for tracking books, managing member information, and handling all borrowing and return transactions within a university library environment.



Project Overview


The project encompasses the complete lifecycle of database development, from schema design and data population to complex querying, procedural programming (PL/SQL), and fundamental database administration tasks. It demonstrates proficiency in SQL for data manipulation and retrieval, as well as the creation of stored procedures, functions, and triggers for enhanced functionality and automation.

Key Features and Functionalities
This database system supports the following core functionalities:



Comprehensive Data Management:


Books: Stores detailed information about library books, including title, author, publisher, ISBN, category, and availability.

Members: Manages university member details (students, faculty, staff), including contact information and membership types.

Transactions: Records all borrowing and return activities, tracking issue dates, due dates, return dates, fines, and transaction status.



Advanced Querying Capabilities:



Data Retrieval: Efficiently retrieve information on book availability, overdue books, most borrowed items, and member borrowing patterns.

Data Manipulation: Includes functionalities for updating fine amounts, inserting new members, archiving old transactions, and updating book categories dynamically.

Complex Joins: Utilizes INNER JOIN, LEFT JOIN, SELF JOIN, and CROSS JOIN to combine data from multiple tables for comprehensive reporting and analysis (e.g., transaction history with member/book details, books never borrowed, member borrowing trends).

Subqueries: Employs subqueries for advanced data filtering and aggregation, such as identifying highly borrowed books, members with high fine amounts, and the second most active member.

Aggregate & Window Functions: Leverages SUM, COUNT, RANK(), NTILE(), and LAG() to calculate running totals of fines, rank member activity, determine category contributions, and analyze borrowing trends over time.

PL/SQL Automation & Business Logic:

ISSUE_BOOK Stored Procedure: Automates the book issuing process by checking availability, creating transaction records, and updating book copies, with built-in exception handling.

CALCULATE_FINE Function: A reusable function to calculate overdue fines based on the transaction ID and a daily fine rate.

UPDATE_AVAILABLE_COPIES Trigger: An automated trigger that fires upon a book's return, ensuring available_copies are accurately updated in real-time.

Database Administration:

User Management: Sets up distinct user roles (librarian and student_user) with appropriate, restricted privileges to ensure data security and integrity.

Performance Optimization: Implements indexing on frequently queried columns and explores execution plans to identify and suggest strategies for improving database query performance.
Technologies Used


Database System: Oracle Database

Query Language: SQL

Procedural Language: PL/SQL


Repository Structure


The repository is organized into a clear and logical structure to facilitate understanding and execution of the database components:

oracle-library-system-[your-student-id]/
│
├── README.md               // Project documentation (this file)
└── sql/
    ├── setup.sql           // Contains DDL for table creation, constraints, relationships, and sample data insertion.
    ├── queries.sql         // Houses all SQL queries from Parts 2 & 3, with detailed comments.
    ├── plsql.sql           // Includes PL/SQL procedures, functions, and triggers.
    └── admin.sql           // Scripts for user management and performance optimization (indexing).
