-- CREATE DATABASE DATADIGGER;

-- USE DATADIGGER;

-- CREATE TABLE Customers (
--     CustomerID INT PRIMARY KEY AUTO_INCREMENT,
--     Name VARCHAR(100),
--     Email VARCHAR(100),
--     Address VARCHAR(255)
-- );

-- INSERT INTO Customers (Name, Email, Address)
-- VALUES
-- ('Alice', 'alice@gmail.com', 'Rajkot'),
-- ('Rahul', 'rahul@gmail.com', 'Ahmedabad'),
-- ('Priya', 'priya@gmail.com', 'Surat'),
-- ('John', 'john@gmail.com', 'Mumbai'),
-- ('Krish', 'krish@gmail.com', 'Vadodara');

-- SELECT * FROM Customers;

-- UPDATE Customers SET Address = 'Gandhinagar' WHERE CustomerID = 1;

-- DELETE FROM Customers WHERE CustomerID = 5;

-- SELECT * FROM Customers WHERE Name = 'Alice';

-- =============================================================
-- ORDER TABLE 
-- =============================================================

-- Orders table banao (pehle Customers table bana hona chahiye)
-- CREATE TABLE Orders (
--     OrderID     INT PRIMARY KEY AUTO_INCREMENT,
--     CustomerID  INT NOT NULL,
--     OrderDate   DATE NOT NULL,
--     TotalAmount DECIMAL(10,2) NOT NULL,
--     FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
--         ON DELETE CASCADE
-- );	

-- INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
-- (1, '2026-11-02', 1500.00),
-- (1, '2026-10-25', 2500.00),
-- (2, '2026-10-15',  800.00),
-- (3, '2026-09-20', 3200.00),
-- (4, '2026-09-05',  950.00);

-- SELECT * FROM Orders WHERE CustomerID = 1;

-- UPDATE Orders SET TotalAmount = 1800.00 WHERE OrderID = 1;

-- DELETE FROM Orders WHERE OrderID = 5;

-- SELECT * FROM Orders WHERE OrderDate >= '2026-10-05';

-- SELECT MAX(TotalAmount) AS HighestOrder,
--        MIN(TotalAmount) AS LowestOrder,
--        AVG(TotalAmount) AS AverageOrder
-- FROM Orders;


-- ==================================================================
-- PRODUCT TABLE
-- ==================================================================

-- CREATE TABLE Products (
--     ProductID   INT PRIMARY KEY AUTO_INCREMENT,
--     ProductName VARCHAR(100) NOT NULL,
--     Price       DECIMAL(10,2) NOT NULL,
--     Stock       INT NOT NULL DEFAULT 0
-- );

-- INSERT INTO Products (ProductName, Price, Stock) VALUES
-- ('Laptop',        45000.00, 10),
-- ('Mouse',           600.00, 50),
-- ('Keyboard',       1200.00, 30),
-- ('Headphones',     1800.00, 25),
-- ('Old USB Cable',   300.00,  0);

-- SELECT * FROM Products ORDER BY Price DESC;

-- UPDATE Products SET Price = 650.00 WHERE ProductID = 2;

-- DELETE FROM Products WHERE ProductID > 0 AND Stock = 0;
-- 	
-- SELECT * FROM Products WHERE Price BETWEEN 500 AND 2000;

-- SELECT MAX(Price) AS MostExpensive,
--        MIN(Price) AS Cheapest
-- FROM Products;

-- ===========================================================
-- ORDER TABLE
-- ===========================================================

-- CREATE TABLE OrderDetails (
--     OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
--     OrderID       INT NOT NULL,
--     ProductID     INT NOT NULL,
--     Quantity      INT NOT NULL,
--     SubTotal      DECIMAL(10,2) NOT NULL
-- );

-- INSERT INTO OrderDetails (OrderID, ProductID, Quantity, SubTotal) 
-- VALUES
-- (1, 2, 2, 1300.00),
-- (1, 3, 1, 1200.00),
-- (2, 4, 1, 1800.00),
-- (3, 2, 1,  650.00),
-- (4, 3, 2, 2400.00);

-- SELECT * FROM OrderDetails WHERE OrderID = 1;

-- SELECT SUM(SubTotal) AS TotalRevenue FROM OrderDetails;

-- SELECT p.ProductID, p.ProductName, SUM(od.Quantity) AS TotalOrdered
-- FROM OrderDetails od
-- INNER JOIN Products p ON od.ProductID = p.ProductID
-- GROUP BY p.ProductID, p.ProductName
-- ORDER BY TotalOrdered DESC, p.ProductID
-- LIMIT 3;

-- SELECT COUNT(*) AS TimesSold FROM OrderDetails WHERE ProductID = 2;