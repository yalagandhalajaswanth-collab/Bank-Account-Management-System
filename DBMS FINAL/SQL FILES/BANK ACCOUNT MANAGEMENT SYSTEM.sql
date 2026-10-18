/* =========================================================
   BANK ACCOUNT MANAGEMENT SYSTEM
   DBMS REVIEW 2 - COMPLETE MYSQL SCRIPT
   ========================================================= */


/* =========================================================
   1. DATABASE CREATION
   ========================================================= */

DROP DATABASE IF EXISTS Bank_Account_Management;

CREATE DATABASE Bank_Account_Management;

SHOW DATABASES;

USE Bank_Account_Management;


/* =========================================================
   2. TABLE CREATION - DDL
   ========================================================= */


/* -------------------------
   2.1 CUSTOMER TABLE
   ------------------------- */

CREATE TABLE Customer
(
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Date_of_Birth DATE NOT NULL,
    Gender VARCHAR(10),
    Phone VARCHAR(15) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Address VARCHAR(200)
);


/* -------------------------
   2.2 BRANCH TABLE
   ------------------------- */

CREATE TABLE Branch
(
    Branch_ID INT PRIMARY KEY,
    Branch_Name VARCHAR(100) NOT NULL,
    IFSC_Code VARCHAR(20) UNIQUE NOT NULL,
    Address VARCHAR(200),
    City VARCHAR(50) NOT NULL
);


/* -------------------------
   2.3 ACCOUNT TABLE
   ------------------------- */

CREATE TABLE Account
(
    Account_Number INT PRIMARY KEY,
    Account_Type VARCHAR(20) NOT NULL,
    Balance DECIMAL(12,2) DEFAULT 0,
    Opening_Date DATE NOT NULL,
    Account_Status VARCHAR(20) DEFAULT 'Active',
    Customer_ID INT,
    Branch_ID INT,

    CONSTRAINT fk_account_customer
        FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID),

    CONSTRAINT fk_account_branch
        FOREIGN KEY (Branch_ID)
        REFERENCES Branch(Branch_ID),

    CONSTRAINT chk_account_balance
        CHECK (Balance >= 0)
);


/* -------------------------
   2.4 EMPLOYEE TABLE
   ------------------------- */

CREATE TABLE Employee
(
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(100) NOT NULL,
    Designation VARCHAR(50),
    Phone VARCHAR(15),
    Branch_ID INT,

    CONSTRAINT fk_employee_branch
        FOREIGN KEY (Branch_ID)
        REFERENCES Branch(Branch_ID)
);


/* -------------------------
   2.5 BANK TRANSACTION TABLE
   ------------------------- */

CREATE TABLE Bank_Transaction
(
    Transaction_ID INT PRIMARY KEY,
    Account_Number INT,
    Transaction_Type VARCHAR(20) NOT NULL,
    Amount DECIMAL(12,2) NOT NULL,
    Transaction_Date DATE NOT NULL,
    Status VARCHAR(20) DEFAULT 'Success',

    CONSTRAINT fk_transaction_account
        FOREIGN KEY (Account_Number)
        REFERENCES Account(Account_Number),

    CONSTRAINT chk_transaction_amount
        CHECK (Amount > 0),

    CONSTRAINT chk_transaction_type
        CHECK (Transaction_Type IN ('Deposit','Withdrawal'))
);


/* -------------------------
   2.6 LOAN TABLE
   ------------------------- */

CREATE TABLE Loan
(
    Loan_ID INT PRIMARY KEY,
    Loan_Type VARCHAR(50) NOT NULL,
    Loan_Amount DECIMAL(12,2) NOT NULL,
    Interest_Rate DECIMAL(5,2) NOT NULL,
    Customer_ID INT,

    CONSTRAINT fk_loan_customer
        FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID),

    CONSTRAINT chk_loan_amount
        CHECK (Loan_Amount > 0),

    CONSTRAINT chk_interest_rate
        CHECK (Interest_Rate > 0)
);


/* -------------------------
   CHECK TABLE STRUCTURE
   ------------------------- */

SHOW TABLES;

DESC Customer;
DESC Branch;
DESC Account;
DESC Employee;
DESC Bank_Transaction;
DESC Loan;


/* =========================================================
   3. INSERT SAMPLE RECORDS - DML
   ========================================================= */


/* -------------------------
   3.1 INSERT BRANCH RECORDS
   ------------------------- */

INSERT INTO Branch
VALUES
(1, 'Main Branch', 'BANK0001', 'MG Road', 'Hyderabad'),
(2, 'City Branch', 'BANK0002', 'Ameerpet', 'Hyderabad'),
(3, 'Central Branch', 'BANK0003', 'Banjara Hills', 'Hyderabad'),
(4, 'North Branch', 'BANK0004', 'Secunderabad', 'Hyderabad'),
(5, 'South Branch', 'BANK0005', 'Mehdipatnam', 'Hyderabad');


/* -------------------------
   3.2 INSERT CUSTOMER RECORDS
   ------------------------- */

INSERT INTO Customer
VALUES
(101, 'Rahul Sharma', '2003-05-15', 'Male',
 '9876543210', 'rahul@gmail.com', 'Hyderabad'),

(102, 'Priya Reddy', '2004-08-20', 'Female',
 '9876543211', 'priya@gmail.com', 'Hyderabad'),

(103, 'Arjun Kumar', '2002-11-10', 'Male',
 '9876543212', 'arjun@gmail.com', 'Secunderabad'),

(104, 'Sneha Rao', '2003-03-25', 'Female',
 '9876543213', 'sneha@gmail.com', 'Warangal'),

(105, 'Kiran Patel', '2001-12-05', 'Male',
 '9876543214', 'kiran@gmail.com', 'Vijayawada');


/* -------------------------
   3.3 INSERT ACCOUNT RECORDS
   ------------------------- */

INSERT INTO Account
VALUES
(100001, 'Savings', 25000, '2026-01-10', 'Active', 101, 1),

(100002, 'Current', 50000, '2026-01-15', 'Active', 102, 2),

(100003, 'Savings', 15000, '2026-02-05', 'Active', 103, 1),

(100004, 'Savings', 35000, '2026-02-20', 'Active', 104, 3),

(100005, 'Current', 75000, '2026-03-01', 'Active', 105, 4);


/* -------------------------
   3.4 INSERT EMPLOYEE RECORDS
   ------------------------- */

INSERT INTO Employee
VALUES
(201, 'Ravi Kumar', 'Branch Manager', '9000000001', 1),

(202, 'Anjali Sharma', 'Cashier', '9000000002', 1),

(203, 'Vikram Reddy', 'Accountant', '9000000003', 2),

(204, 'Neha Rao', 'Clerk', '9000000004', 3),

(205, 'Suresh Patel', 'Cashier', '9000000005', 4);


/* -------------------------
   3.5 INSERT TRANSACTION RECORDS
   ------------------------- */

INSERT INTO Bank_Transaction
VALUES
(301, 100001, 'Deposit', 5000, '2026-03-10', 'Success'),

(302, 100001, 'Withdrawal', 2000, '2026-03-12', 'Success'),

(303, 100002, 'Deposit', 10000, '2026-03-15', 'Success'),

(304, 100003, 'Withdrawal', 3000, '2026-03-18', 'Success'),

(305, 100004, 'Deposit', 7000, '2026-03-20', 'Success');


/* -------------------------
   3.6 INSERT LOAN RECORDS
   ------------------------- */

INSERT INTO Loan
VALUES
(401, 'Home Loan', 500000, 8.50, 101),

(402, 'Personal Loan', 100000, 10.50, 102),

(403, 'Education Loan', 200000, 7.50, 103),

(404, 'Vehicle Loan', 300000, 9.00, 104),

(405, 'Personal Loan', 150000, 11.00, 105);


/* -------------------------
   CHECK INSERTED DATA
   ------------------------- */

SELECT * FROM Customer;

SELECT * FROM Branch;

SELECT * FROM Account;

SELECT * FROM Employee;

SELECT * FROM Bank_Transaction;

SELECT * FROM Loan;


/* =========================================================
   4. DDL IMPLEMENTATION
   =========================================================

   DDL commands:
   CREATE
   ALTER
   TRUNCATE
   DROP

   CREATE was already used above for tables.
   ========================================================= */


/* -------------------------
   ALTER TABLE
   Add a new column
   ------------------------- */

ALTER TABLE Customer
ADD COLUMN Customer_Type VARCHAR(20) DEFAULT 'Regular';


/* -------------------------
   CHECK ALTER
   ------------------------- */

DESC Customer;


/* -------------------------
   UPDATE THE NEW COLUMN
   ------------------------- */

UPDATE Customer
SET Customer_Type = 'Regular';


/* -------------------------
   TRUNCATE EXAMPLE
   -------------------------

   DO NOT RUN THIS ON IMPORTANT TABLES
   because it removes all records.

   Example:

   CREATE TABLE Temp_Table
   (
       ID INT
   );

   INSERT INTO Temp_Table VALUES (1);

   SELECT * FROM Temp_Table;

   TRUNCATE TABLE Temp_Table;

   SELECT * FROM Temp_Table;

   DROP TABLE Temp_Table;
*/


/* =========================================================
   5. DML IMPLEMENTATION
   =========================================================

   DML commands:
   INSERT
   UPDATE
   DELETE
   ========================================================= */


/* -------------------------
   INSERT
   ------------------------- */

INSERT INTO Customer
VALUES
(106, 'Test Customer', '2004-01-01', 'Male',
 '9999999999', 'test@gmail.com',
 'Hyderabad', 'Regular');


/* -------------------------
   CHECK INSERT
   ------------------------- */

SELECT * FROM Customer
WHERE Customer_ID = 106;


/* -------------------------
   UPDATE
   ------------------------- */

UPDATE Customer
SET Phone = '8888888888'
WHERE Customer_ID = 106;


/* -------------------------
   CHECK UPDATE
   ------------------------- */

SELECT * FROM Customer
WHERE Customer_ID = 106;


/* -------------------------
   DELETE
   ------------------------- */

DELETE FROM Customer
WHERE Customer_ID = 106;


/* -------------------------
   CHECK DELETE
   ------------------------- */

SELECT * FROM Customer
WHERE Customer_ID = 106;


/* =========================================================
   6. DQL IMPLEMENTATION
   =========================================================

   DQL mainly uses SELECT.
   ========================================================= */


/* -------------------------
   SELECT ALL RECORDS
   ------------------------- */

SELECT * FROM Customer;


/* -------------------------
   SELECT SPECIFIC COLUMNS
   ------------------------- */

SELECT
    Customer_ID,
    Name,
    Email
FROM Customer;


/* -------------------------
   WHERE
   Find customers from Hyderabad
   ------------------------- */

SELECT *
FROM Customer
WHERE Address = 'Hyderabad';


/* -------------------------
   WHERE + CONDITION
   ------------------------- */

SELECT *
FROM Account
WHERE Balance > 30000;


/* -------------------------
   ORDER BY
   Sort accounts by balance
   ------------------------- */

SELECT *
FROM Account
ORDER BY Balance DESC;


/* -------------------------
   DISTINCT
   Display different account types
   ------------------------- */

SELECT DISTINCT Account_Type
FROM Account;


/* -------------------------
   LIKE
   Find names starting with R
   ------------------------- */

SELECT *
FROM Customer
WHERE Name LIKE 'R%';


/* -------------------------
   BETWEEN
   Find accounts with balance
   between 20000 and 60000
   ------------------------- */

SELECT *
FROM Account
WHERE Balance BETWEEN 20000 AND 60000;


/* =========================================================
   7. JOINS
   ========================================================= */


/* -------------------------
   INNER JOIN
   Customer + Account
   ------------------------- */

SELECT
    Customer.Name,
    Account.Account_Number,
    Account.Account_Type,
    Account.Balance
FROM Customer
INNER JOIN Account
ON Customer.Customer_ID = Account.Customer_ID;


/* -------------------------
   INNER JOIN
   Account + Branch
   ------------------------- */

SELECT
    Account.Account_Number,
    Account.Account_Type,
    Account.Balance,
    Branch.Branch_Name,
    Branch.City
FROM Account
INNER JOIN Branch
ON Account.Branch_ID = Branch.Branch_ID;


/* -------------------------
   THREE TABLE JOIN
   Customer + Account + Branch
   ------------------------- */

SELECT
    Customer.Name,
    Account.Account_Number,
    Account.Account_Type,
    Account.Balance,
    Branch.Branch_Name
FROM Customer
INNER JOIN Account
ON Customer.Customer_ID = Account.Customer_ID
INNER JOIN Branch
ON Account.Branch_ID = Branch.Branch_ID;


/* -------------------------
   CUSTOMER + LOAN
   ------------------------- */

SELECT
    Customer.Name,
    Loan.Loan_Type,
    Loan.Loan_Amount,
    Loan.Interest_Rate
FROM Customer
INNER JOIN Loan
ON Customer.Customer_ID = Loan.Customer_ID;


/* -------------------------
   ACCOUNT + TRANSACTION
   ------------------------- */

SELECT
    Account.Account_Number,
    Account.Account_Type,
    Bank_Transaction.Transaction_Type,
    Bank_Transaction.Amount,
    Bank_Transaction.Transaction_Date
FROM Account
INNER JOIN Bank_Transaction
ON Account.Account_Number =
   Bank_Transaction.Account_Number;


/* =========================================================
   8. AGGREGATE FUNCTIONS
   =========================================================

   COUNT
   SUM
   AVG
   MAX
   MIN
   ========================================================= */


/* -------------------------
   COUNT
   Total number of customers
   ------------------------- */

SELECT COUNT(*) AS Total_Customers
FROM Customer;


/* -------------------------
   COUNT
   Total number of accounts
   ------------------------- */

SELECT COUNT(*) AS Total_Accounts
FROM Account;


/* -------------------------
   SUM
   Total bank balance
   ------------------------- */

SELECT SUM(Balance) AS Total_Balance
FROM Account;


/* -------------------------
   AVG
   Average account balance
   ------------------------- */

SELECT AVG(Balance) AS Average_Balance
FROM Account;


/* -------------------------
   MAX
   Highest account balance
   ------------------------- */

SELECT MAX(Balance) AS Highest_Balance
FROM Account;


/* -------------------------
   MIN
   Lowest account balance
   ------------------------- */

SELECT MIN(Balance) AS Lowest_Balance
FROM Account;


/* -------------------------
   SUM
   Total loan amount
   ------------------------- */

SELECT SUM(Loan_Amount) AS Total_Loan_Amount
FROM Loan;


/* -------------------------
   AVG
   Average loan amount
   ------------------------- */

SELECT AVG(Loan_Amount) AS Average_Loan_Amount
FROM Loan;


/* =========================================================
   9. GROUP BY AND HAVING
   =========================================================

   GROUP BY groups records with
   similar values.

   HAVING filters grouped results.
   ========================================================= */


/* -------------------------
   GROUP BY - ACCOUNT TYPE
   Count accounts for each
   account type
   ------------------------- */

SELECT
    Account_Type,
    COUNT(*) AS Total_Accounts
FROM Account
GROUP BY Account_Type;


/* -------------------------
   GROUP BY + SUM
   Find total balance for
   each account type
   ------------------------- */

SELECT
    Account_Type,
    SUM(Balance) AS Total_Balance
FROM Account
GROUP BY Account_Type;


/* -------------------------
   GROUP BY + HAVING
   Display account types
   whose total balance is
   greater than 50000
   ------------------------- */

SELECT
    Account_Type,
    SUM(Balance) AS Total_Balance
FROM Account
GROUP BY Account_Type
HAVING SUM(Balance) > 50000;


/* -------------------------
   GROUP BY BRANCH
   Count accounts in each branch
   ------------------------- */

SELECT
    Branch_ID,
    COUNT(*) AS Total_Accounts
FROM Account
GROUP BY Branch_ID;


/* =========================================================
   10. NORMALIZATION
   =========================================================

   The database is designed using normalization
   to reduce data redundancy and improve consistency.

   1NF:
   - Each column contains atomic values.
   - No repeating groups.

   2NF:
   - The tables are in 1NF.
   - Non-key attributes depend on the complete primary key.

   3NF:
   - The tables are in 2NF.
   - Non-key attributes do not depend on other
     non-key attributes.

   Example:
   Customer information is stored in Customer.
   Account information is stored in Account.
   Branch information is stored in Branch.
   This avoids unnecessary repetition.
   ========================================================= */


/* =========================================================
   11. DATA INTEGRITY
   =========================================================

   The database uses different constraints
   to maintain accurate and valid data.

   PRIMARY KEY
   FOREIGN KEY
   NOT NULL
   UNIQUE
   DEFAULT
   CHECK
   ========================================================= */


/* -------------------------
   PRIMARY KEY
   -------------------------

   Customer_ID
   Account_Number
   Branch_ID
   Employee_ID
   Transaction_ID
   Loan_ID
*/


/* -------------------------
   FOREIGN KEY
   -------------------------

   Account.Customer_ID
   Account.Branch_ID
   Employee.Branch_ID
   Bank_Transaction.Account_Number
   Loan.Customer_ID
*/


/* -------------------------
   UNIQUE
   -------------------------

   Customer.Email
   Branch.IFSC_Code
*/


/* -------------------------
   NOT NULL
   -------------------------

   Important fields cannot
   contain NULL values.
*/


/* -------------------------
   DEFAULT
   -------------------------

   Account_Status = Active
   Balance = 0
   Transaction Status = Success
   Customer_Type = Regular
*/


/* -------------------------
   CHECK
   -------------------------

   Balance >= 0
   Amount > 0
   Loan_Amount > 0
   Interest_Rate > 0
   Transaction_Type = Deposit/Withdrawal
*/


/* -------------------------
   VIEW CONSTRAINT INFORMATION
   ------------------------- */

SELECT
    TABLE_NAME,
    CONSTRAINT_NAME,
    CONSTRAINT_TYPE
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = 'Bank_Account_Management';


/* =========================================================
   12. DATA INTEGRITY TESTS
   =========================================================

   The following tests are examples.

   They are commented to prevent errors
   in the main working database.

   Remove the comments one at a time if
   you want to demonstrate constraint errors.
   ========================================================= */


/* -------------------------
   TEST PRIMARY KEY
   -------------------------

INSERT INTO Customer
VALUES
(101, 'Duplicate Customer', '2000-01-01',
 'Male', '9000000000',
 'duplicate@gmail.com',
 'Hyderabad', 'Regular');
*/


/* -------------------------
   TEST UNIQUE
   -------------------------

INSERT INTO Customer
VALUES
(107, 'Unique Test', '2000-01-01',
 'Male', '9111111111',
 'rahul@gmail.com',
 'Hyderabad', 'Regular');
*/


/* -------------------------
   TEST CHECK CONSTRAINT
   -------------------------

INSERT INTO Account
VALUES
(100006, 'Savings', -5000,
 '2026-04-01', 'Active', 101, 1);
*/


/* -------------------------
   TEST FOREIGN KEY
   -------------------------

INSERT INTO Account
VALUES
(100007, 'Savings', 10000,
 '2026-04-01', 'Active', 999, 1);
*/


/* =========================================================
   13. VIEW IMPLEMENTATION
   =========================================================

   A VIEW is a virtual table based on
   the result of an SQL query.
   ========================================================= */


/* -------------------------
   CREATE VIEW
   Customer + Account + Branch
   ------------------------- */

CREATE VIEW Customer_Account_View AS
SELECT
    Customer.Name,
    Account.Account_Number,
    Account.Account_Type,
    Account.Balance,
    Branch.Branch_Name,
    Branch.City
FROM Customer
INNER JOIN Account
ON Customer.Customer_ID = Account.Customer_ID
INNER JOIN Branch
ON Account.Branch_ID = Branch.Branch_ID;


/* -------------------------
   DISPLAY VIEW
   ------------------------- */

SELECT *
FROM Customer_Account_View;


/* -------------------------
   DISPLAY SELECTED COLUMNS
   FROM VIEW
   ------------------------- */

SELECT
    Name,
    Account_Number,
    Balance
FROM Customer_Account_View
WHERE Balance > 30000;


/* =========================================================
   14. FINAL DATABASE VERIFICATION
   ========================================================= */


/* -------------------------
   DISPLAY ALL TABLES
   ------------------------- */

SHOW TABLES;


/* -------------------------
   FINAL CUSTOMER DATA
   ------------------------- */

SELECT * FROM Customer;


/* -------------------------
   FINAL BRANCH DATA
   ------------------------- */

SELECT * FROM Branch;


/* -------------------------
   FINAL ACCOUNT DATA
   ------------------------- */

SELECT * FROM Account;


/* -------------------------
   FINAL EMPLOYEE DATA
   ------------------------- */

SELECT * FROM Employee;


/* -------------------------
   FINAL TRANSACTION DATA
   ------------------------- */

SELECT * FROM Bank_Transaction;


/* -------------------------
   FINAL LOAN DATA
   ------------------------- */

SELECT * FROM Loan;


/* -------------------------
   FINAL VIEW
   ------------------------- */

SELECT * FROM Customer_Account_View;


/* =========================================================
   END OF BANK ACCOUNT MANAGEMENT SYSTEM
   ========================================================= */