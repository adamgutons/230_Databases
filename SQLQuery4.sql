/* 
These are notes and excercises from 230 DB Class 2/6/18
@ Adam Gutonski

-- Control/Shift/R - To refresh Local Cache - click in query window
-- F5 - Execute

setup...

SELECT column list
FROM table;

Best Practices

1. Start each new clause on a new line
2. Break long clauses into multiple lines
3. Capitalize first letter of keyword
4. End statement with ;
5. Use comments at beginning or end, use for complex code, make sure not to clutter (readibility), don't add to every line




SELECT * 
FROM InvoiceLineItems; -- SELECT * FROM Table;

SELECT * 
FROM Terms;

SELECT *
FROM InvoiceLineItems;



SELECT VendorContactLName, VendorContactFName
FROM Vendors
ORDER BY VendorContactLName, VendorContactFName;



SELECT InvoiceNumber AS Number, InvoiceTotal AS Total, (PaymentTotal + CreditTotal) AS Credits, (InvoiceTotal - (PaymentTotal + CreditTotal)) AS Balance
FROM Invoices;

-- Arithmetic Expression
SELECT [Amount Plus 100] = InvoiceLineItemAmount + 100  
FROM InvoiceLineItems;

-- Arithmetic Expression
SELECT [InvoiceTotal] + [CreditTotal] AS [BAL]
FROM Invoices;

-- String expression
SELECT [TermsDescription] + ' - Means the number of days we have until payment is required'
AS [Number of days]
FROM Terms; 

-- Another String 
SELECT 'The Invoice Number is ' + InvoiceNumber + '.' AS [Invoice Numbers]  
FROM Invoices; 

SELECT InvoiceID, PaymentTotal FROM Invoices;

-- Function, using SUM() function to add all of these column values from the table
SELECT SUM(PaymentTotal) AS Pays  
FROM Invoices;

 --find the average of the payment totals via AVG() method
SELECT AVG(PaymentTotal) AS [Average Payment Amount] 
FROM Invoices;


-- Left Function, this function gives characters from the string up to the position defined in the expression, in this case '3'
SELECT VendorContactFName,
	LEFT(VendorContactFName, 3) AS [Initial]
FROM Vendors

-- substring, the first int defines the starting position of the string, the second int defines length of the string to be returned
SELECT VendorContactFName,
	SUBSTRING(VendorContactFName, 1, 3) AS [Initial]
FROM Vendors;

-- more clauses...TESTing begins... Order of Clauses...

SELECT
FROM 
WHERE -- defining what records to return
ORDER BY


-- top 5, selects the first 5 entries in the table
SELECT TOP 5 InvoiceID, 
	InvoiceNumber, 
	InvoiceDate, 
	InvoiceTotal 
FROM Invoices;

-- using ORDER BY to define order of results, DESC for listing the hightest amnts, ASC for lowest
SELECT TOP 5 InvoiceID, 
	InvoiceNumber, 
	InvoiceDate, 
	InvoiceTotal 
FROM Invoices
ORDER BY InvoiceTotal DESC;


-- Sort 2 columns
SELECT VendorContactLName, VendorContactFName
FROM Vendors
ORDER BY VendorContactLName, VendorContactFName;

-- WHERE CLAUSE - to filter results, condition set in the where clause
SELECT VendorName, VendorState, VendorPhone
FROM Vendors
WHERE VendorState = 'DC';

SELECT VendorName, VendorState, VendorPhone
FROM Vendors
WHERE VendorState <> 'DC';  -- using the '<>' operator is same as using 'NOT'



-- IN phrase
SELECT VendorState
FROM Vendors
WHERE VendorState IN('CA', 'NV');

-- Like keyword (string pattern)
SELECT VendorState
FROM Vendors
WHERE VendorState LIKE 'C%'; -- LIKE keyword allows us to search by first letter 'C', the wildcard '%' keeps unspecificed what comes after 'C'

-- LIKE keyword w/ 2 wild cards
SELECT AccountNo, AccountDescription
FROM GLAccounts
WHERE AccountDescription LIKE '%Tax%'; -- will search for the word 'tax' and ignore any string characters that come before or after the word 'tax'


-- compound condition, can only have one WHERE clause, followed by AND/OR
SELECT InvoiceDate, InvoiceTotal
FROM Invoices
WHERE InvoiceTotal > 500
AND InvoiceDate > '01/01/2012';  -- only returning records w/ an invoice total greater than $500.00 and on all dates later than Jan 1 2012

SELECT InvoiceDate, InvoiceTotal
FROM Invoices
WHERE InvoiceTotal > 500
OR InvoiceDate > '01/01/2012';  -- will return all records w/ invoice greater than $500.00 OR any record w/ a date later than Jan 1 2012
*/

-- Question 1
-- What vendors are in California in cities beginning with the letter 'S'?
SELECT VendorName, VendorCity, VendorState
FROM Vendors
WHERE VendorCity LIKE 'S%' AND VendorState IN('CA');

-- Question 2
-- What are the invoice line item description for invoice line item amounts over $400.00?
SELECT InvoiceLineItemDescription, InvoiceLineItemAmount
FROM InvoiceLineItems
WHERE InvoiceLineItemAmount > 400;

-- Question 3
-- Display the invoice number, payment total, and invoice date for all records after 12-25-2011.  Order by hights payment totals.
SELECT InvoiceNumber, PaymentTotal, InvoiceDate 
FROM Invoices
WHERE InvoiceDate > '12/25/2011'
ORDER BY PaymentTotal DESC;

-- Question 4
-- Find the average payment total for all invoice records, and display records as "Average Payment".
SELECT AVG(PaymentTotal) AS [Average Payment]
FROM Invoices;

-- Question 5
-- Display the amount due from the invoice total for all invoice records.  Name this column "Bal Due".
SELECT (InvoiceTotal - PaymentTotal) AS [Bal Due]
FROM Invoices
ORDER BY [Bal Due] DESC;



-- Question 1 ANSWER
SELECT * 
FROM ContactUpdates
WHERE FirstName LIKE 'A%';

-- Question 2 ANSWER
SELECT * 
FROM InvoiceLineItems
WHERE AccountNo < 500;


-- Question 3 ANSWER 95.00
SELECT MAX(InvoiceLineItemAmount) 
FROM InvoiceLineItems
WHERE InvoiceLineItemAmount < 100;


-- Question 4 ANSWER
SELECT SUM(InvoiceID) 
FROM InvoiceLineItems	
WHERE InvoiceLineItemDescription = 'Freight';


-- Question 5 ANSWER
SELECT (MIN(InvoiceLineItemAmount) + 100) 
FROM InvoiceLineItems
WHERE InvoiceLIneItemDescription = 'Freight';

