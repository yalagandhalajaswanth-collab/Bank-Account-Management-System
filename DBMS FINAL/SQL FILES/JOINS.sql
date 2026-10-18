USE Bank_Account_Management;

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