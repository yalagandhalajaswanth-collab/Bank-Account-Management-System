USE Bank_Account_Management;
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

