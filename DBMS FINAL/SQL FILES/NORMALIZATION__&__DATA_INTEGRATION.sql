USE Bank_Account_Management;
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

