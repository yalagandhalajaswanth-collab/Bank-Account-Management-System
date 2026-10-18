USE Bank_Account_Management;

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