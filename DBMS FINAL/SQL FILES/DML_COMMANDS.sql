USE Bank_Account_Management;
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