USE Bank_Account_Management;

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
