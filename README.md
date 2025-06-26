*   University Library Management System
This repository contains a comprehensive database system designed and implemented for a University Library Management System.


Developed as the final assignment for the Database Management Systems (DBMS) course, this project focuses specifically on Oracle Database to manage core library operations efficiently and securely.


   Project Objectives

 
The system aims to provide a robust, scalable, and secure solution for:

Tracking library books

Managing member information

Handling book borrowing and return transactions



   *Project Overview


The project covers the entire lifecycle of database development, including:

Schema design & normalization

Data population with realistic test entries

Advanced querying techniques

Procedural programming using PL/SQL

Core database administration tasks



   * It demonstrates proficiency in:



SQL (DML, DDL, DCL, TCL)

Joins & subqueries

PL/SQL (procedures, functions, triggers)

Indexing & performance tuning



   * Key Features & Functionalities



  *Comprehensive Data Management
Books

Stores details: title, author, publisher, ISBN, category, available_copies

Members

Handles all user types: students, faculty, staff

Includes contact info, membership type

Transactions

Tracks borrow/return operations

Manages issue date, return date, due date, fines, and status




   *Advanced Querying Capabilities
Data Retrieval


Book availability, overdue items, most borrowed books

Data Manipulation

Update fines, insert new members, archive old data

Joins Used

INNER JOIN, LEFT JOIN, SELF JOIN, CROSS JOIN for reporting

Subqueries

Find most active members, high-fine users, least borrowed books

Aggregates & Windows

Use of SUM, COUNT, RANK(), NTILE(), LAG() for trends & stats


   * PL/SQL Automation & Business Logic
ISSUE_BOOK Procedure


Checks book availability

Inserts transaction record

Decreases available copies

Includes error handling

CALCULATE_FINE Function

Takes transaction ID

Returns fine amount based on delay and daily rate

UPDATE_AVAILABLE_COPIES Trigger

Fires on return

Automatically updates available_copies in the books table



   * Database Administration
User Management


   Roles: librarian, student_user

   Privilege control for secure access

   Performance Optimization

   Indexing high-frequency columns

   Analyzing execution plans

   Query tuning suggestions

* Technologies Used

Component	Technology
Database	Oracle Database
Query Language	SQL
Procedural Language	SQL



* Repository Structure

oracle-library-system-[your-student-id]/
│
├── README.md               → Project documentation
└── sql/
    ├── setup.sql           → DDL: Table creation, constraints, sample data
    ├── queries.sql         → All queries (Part 2 & 3) with comments
    ├── plsql.sql           → PL/SQL procedures, functions, triggers
    └── admin.sql           → User management & indexing scripts
