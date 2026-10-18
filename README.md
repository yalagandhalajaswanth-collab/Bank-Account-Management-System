# Bank Account Management System 🏦

A relational database project developed for the **Database Management Systems (2501IT05)** Capstone Project Review, Department of Artificial Intelligence and Machine Learning, Aditya University.

---

## 📌 Project Overview

The **Bank Account Management System** is a centralized database designed to handle core banking operations. It replaces scattered records with an organized relational architecture normalized up to **3NF**.

### Key Features
* **Data Integrity:** Primary keys, foreign keys, uniqueness, and check constraints.
* **Normalized Structure:** Reduces data duplication across customers, accounts, branches, employees, transactions, and loans.
* **SQL Implementation:** Complete set of DDL, DML, DQL, Joins, Aggregations, Grouping, Views, and CRUD operations.

---

## 👥 Contributors & Faculty Guide

* **Project Guide:** Dr. P. Kishore Kumar, PhD. (Associate Professor, Dept. of AIML)
* **Institution:** Aditya University, Surampalem
* **Academic Year:** 2026–2027 (Batch 3)

| Team Member | Roll Number | Role |
| :--- | :--- | :--- |
| **Y. Jaswanth Karthikeya** | 25B11AIC83 | Database Architecture & ER Design |
| **A. Prasanna Kumar** | 26B61AI072 / 25B11AI072 | Database & SQL Implementation |
| **K. Prasanna Kumar** | 25B11AI488 | Constraints & Testing |
| **K. Murali Krishna** | 25B11AI518 | System Documentation & Review Presentations |

---

## 🏗 Database Schema & ER Diagram

### Entity-Relationship (ER) Diagram

```text
       +-----------------------+                    +-----------------------+
       |        BRANCH         |                    |       EMPLOYEE        |
       +-----------------------+                    +-----------------------+
       | PK Branch_ID          |<-------+           | PK Employee_ID        |
       |    Branch_Name        |        |           |    Employee_Name      |
       |    IFSC_Code (UNIQUE) |        |           |    Designation        |
       |    Address            |        |           |    Phone              |
       |    City               |        | 1         | FK Branch_ID          |---+
       +-----------------------+        |           +-----------------------+   |
                   | 1                  |                                       |
                   |                    | (manages)                             | (assigned to)
                   |                    |                                       |
                   | (manages)          +---------------------------------------+
                   |
                   | M
       +-----------------------+                    +-----------------------+
       |        ACCOUNT        |                    |       CUSTOMER        |
       +-----------------------+                    +-----------------------+
       | PK Account_Number     |<-------+           | PK Customer_ID        |
       |    Account_Type       |        |           |    Name               |
       |    Balance            |        |           |    Date_of_Birth      |
       |    Opening_Date       |        |           |    Gender             |
       |    Account_Status     |        |           |    Phone              |
       | FK Customer_ID        |---+    |           |    Email (UNIQUE)     |
       | FK Branch_ID          |   |    |           |    Address            |
       +-----------------------+   |    |           |    Customer_Type      |
                   | 1             |    |           +-----------------------+
                   |               |    |                       | 1
                   | (records)     |    | (holds)               |
                   |               |    |                       | (applies for)
                   | M             |    |                       |
       +-----------------------+   |    |                       | M
       |   BANK_TRANSACTION    |   |    |           +-----------------------+
       +-----------------------+   |    |           |         LOAN          |
       | PK Transaction_ID     |   |    |           +-----------------------+
       | FK Account_Number     |   +----+---------->| PK Loan_ID            |
       |    Transaction_Type   |                    |    Loan_Type          |
       |    Amount             |                    |    Loan_Amount        |
       |    Transaction_Date   |                    |    Interest_Rate      |
       |    Status             |                    | FK Customer_ID        |
       +-----------------------+                    +-----------------------+
```

### Table Definitions & Constraints
1. **CUSTOMER**
   * `Customer_ID` (INT, PK)
   * `Name` (VARCHAR(100), NOT NULL)
   * `Date_of_Birth` (DATE, NOT NULL)
   * `Gender` (VARCHAR(10))
   * `Phone` (VARCHAR(15), NOT NULL)
   * `Email` (VARCHAR(100), UNIQUE)
   * `Address` (VARCHAR(200))
   * `Customer_Type` (VARCHAR(20), DEFAULT 'Regular')
2. **BRANCH**
   * `Branch_ID` (INT, PK)
   * `Branch_Name` (VARCHAR(100), NOT NULL)
   * `IFSC_Code` (VARCHAR(20), UNIQUE, NOT NULL)
   * `Address` (VARCHAR(200))
   * `City` (VARCHAR(50), NOT NULL)
3. **ACCOUNT**
   * `Account_Number` (INT, PK)
   * `Account_Type` (VARCHAR(20), NOT NULL)
   * `Balance` (DECIMAL(12,2), DEFAULT 0, CHECK >= 0)
   * `Opening_Date` (DATE, NOT NULL)
   * `Account_Status` (VARCHAR(20), DEFAULT 'Active')
   * `Customer_ID` (INT, FK -> Customer)
   * `Branch_ID` (INT, FK -> Branch)
4. **EMPLOYEE**
   * `Employee_ID` (INT, PK)
   * `Employee_Name` (VARCHAR(100), NOT NULL)
   * `Designation` (VARCHAR(50))
   * `Phone` (VARCHAR(15))
   * `Branch_ID` (INT, FK -> Branch)
5. **BANK_TRANSACTION**
   * `Transaction_ID` (INT, PK)
   * `Account_Number` (INT, FK -> Account)
   * `Transaction_Type` (VARCHAR(20), CHECK IN ('Deposit', 'Withdrawal'))
   * `Amount` (DECIMAL(12,2), NOT NULL, CHECK > 0)
   * `Transaction_Date` (DATE, NOT NULL)
   * `Status` (VARCHAR(20), DEFAULT 'Success')
6. **LOAN**
   * `Loan_ID` (INT, PK)
   * `Loan_Type` (VARCHAR(50), NOT NULL)
   * `Loan_Amount` (DECIMAL(12,2), NOT NULL, CHECK > 0)
   * `Interest_Rate` (DECIMAL(5,2), NOT NULL, CHECK > 0)
   * `Customer_ID` (INT, FK -> Customer)

---

## 📂 File Directory

```text
├── BANK ACCOUNT MANAGEMENT SYSTEM.sql   # Master script (Database, Tables, Data, Queries, Views)
├── DDL_COMMANDS.sql                     # Schema definitions and ALTER/TRUNCATE examples
├── DML_COMMANDS.sql                     # INSERT, UPDATE, and DELETE operations
├── DQL_COMMANDS.sql                     # Data queries (WHERE, ORDER BY, DISTINCT, LIKE, BETWEEN)
├── JOINS.sql                            # Inner, Equi, Left, and Multi-table joins
├── AGGREGATE_FUNCTIONS.sql              # COUNT, SUM, AVG, MIN, MAX queries
├── GROUP_BY&HAVING.sql                  # Grouping and aggregate filtering
├── PPT-REVIEW_1.pptx                    # Project Review 1 Presentation
├── PPT-REVIEW_2.pptx                    # Project Review 2 Presentation
├── FINAL-DOCUMENT.docx                  # Full Capstone Project Documentation
└── README.md                            # Project Readme
```

---

## 🚀 Execution & Setup

### Prerequisites
* MySQL Server 8.0+
* MySQL Workbench or MySQL Command-Line Client

### Running the Project

#### MySQL Workbench
1. Launch MySQL Workbench and open a connection.
2. Go to **File > Open SQL Script...** and select `BANK ACCOUNT MANAGEMENT SYSTEM.sql`.
3. Click the **Execute** button (lightning bolt).
4. The database `Bank_Account_Management` will be created and populated.

#### MySQL CLI
```bash
mysql -u root -p < "BANK ACCOUNT MANAGEMENT SYSTEM.sql"
```

---

## 🔍 SQL Highlights

### Database View
Combines customer, account, and branch records into a single virtual table:
```sql
CREATE VIEW Customer_Account_View AS
SELECT
    Customer.Name,
    Account.Account_Number,
    Account.Account_Type,
    Account.Balance,
    Branch.Branch_Name,
    Branch.City
FROM Customer
INNER JOIN Account ON Customer.Customer_ID = Account.Customer_ID
INNER JOIN Branch  ON Account.Branch_ID   = Branch.Branch_ID;
```

### Grouping with Having
Finds account types with total balance greater than 50,000:
```sql
SELECT Account_Type, SUM(Balance) AS Total_Balance
FROM Account
GROUP BY Account_Type
HAVING SUM(Balance) > 50000;
```

### Subquery
Finds accounts exceeding the system-wide average balance:
```sql
SELECT Account_Number, Account_Type, Balance
FROM Account
WHERE Balance > (SELECT AVG(Balance) FROM Account);
```

---

## 🔮 Future Enhancements

* Web and mobile banking frontend integration.
* Stored procedures for automated fund transfers using ACID transactions.
* Role-based access control (RBAC) for customers, tellers, and managers.
* Automated audit triggers to track account balance changes.
