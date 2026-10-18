USE Bank_Account_Management;
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
