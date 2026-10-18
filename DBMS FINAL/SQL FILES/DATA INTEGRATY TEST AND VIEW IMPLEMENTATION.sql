USE Bank_Account_Management;
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
