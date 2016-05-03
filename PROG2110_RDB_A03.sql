 -- FILE: PROG2110_RDB_A03.sql 		--
-- PROJECT: PROG2110 A03			--
-- PROGRAMMER: Marcin Czajkowski	--
-- FIRST VERSION: 2015-10-22		--
-- DESCRIPTION: Queries for 		--
-- 				Northwind database	--


-- Question 1 --
SELECT CustomerID, ContactName, Country, City 
FROM customers;

-- Question 2 --
SELECT DISTINCT Country 
FROM customers 
ORDER BY Country;

-- Question 3 --
SELECT CompanyName, City 
FROM customers 
WHERE Country="Germany";

-- Question 4 --
SELECT CustomerID, ContactName 
FROM customers 
WHERE Fax IS NULL;

-- Question 5, assuming ProductID is PK --
SELECT COUNT(ProductID) 
FROM products;

-- Question 6 --
SELECT ProductID,Productname, UnitPrice 
FROM Products;

-- Question 7 --
SELECT Productname, UnitsInStock, UnitPrice 
FROM products 
WHERE UnitPrice > 20 
ORDER BY UnitPrice DESC;

-- Question 8 --
SELECT COUNT(Discontinued) 
FROM products 
WHERE Discontinued='-1';

-- Question 9 relationship is CategoryID --
SELECT categories.CategoryName, products.ProductName 
FROM categories 
INNER JOIN products ON categories.CategoryID = products.CategoryID;

-- Question 10 --
SELECT CONCAT(Title, ' ', FirstName, ' ', LastName) AS Salutations 
FROM employees;

-- Question 11 relationship is RegionID--
SELECT territories.TerritoryDescription, region.RegionDescription 
FROM territories 
INNER JOIN region ON territories.RegionID = region.RegionID;

-- Question 12 --
SELECT orders.OrderID, customers.CustomerID, products.ProductID, `order details`.Quantity 
FROM orders 
INNER JOIN customers ON orders.CustomerID = customers.CustomerID 
INNER JOIN `order details` ON orders.OrderID = `order details`.OrderID 
INNER JOIN products ON `order details`.ProductID = products.ProductID;

-- Question 13 --
SELECT orders.OrderID, customers.CustomerID, products.ProductID, 
(products.UnitPrice * `order details`.Quantity) AS 'Extended Price'
FROM orders 
INNER JOIN customers ON orders.CustomerID = customers.CustomerID 
INNER JOIN `order details` ON orders.OrderID = `order details`.OrderID 
INNER JOIN products ON `order details`.ProductID = products.ProductID;

-- Question 14 --
SELECT OrderID, OrderDate, customers.CompanyName,
CONCAT(employees.LastName,employees.FirstName) AS `Employee Name` FROM orders 
INNER JOIN customers ON(orders.CustomerID=customers.CustomerID)
INNER JOIN employees ON(employees.EmployeeId=orders.EmployeeID);

-- Question 15 --
SELECT customers.CustomerID, customers.ContactName 
FROM orders 
INNER JOIN customers ON orders.CustomerID = customers.CustomerID;

-- Question 16 --
SELECT customers.CustomerID, customers.ContactName
FROM customers
LEFT OUTER JOIN orders ON customers.CustomerID = orders.CustomerID
WHERE orders.CustomerID IS NULL;

-- Question 17 --
INSERT INTO region (RegionID,RegionDescription)
VALUES (5, 'Europe');

-- Question 18 --
DELETE FROM region 
WHERE RegionDescription= 'Europe';

-- Question 19 --
UPDATE customers
SET ContactName = 'Hans Schmidt'
WHERE CompanyName ='Ernst Handel';

-- Question 20 --
UPDATE products SET UnitPrice=UnitPrice+1;

-- Question 21 --
INSERT INTO categories (CategoryID,CategoryName,Description, Picture)
VALUES (9, 'Discontinued', NULL, NULL);

-- Question 22 --
UPDATE products SET CategoryID = 9 
WHERE Discontinued = -1;
