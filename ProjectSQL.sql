create database BusinessManagement
use BusinessManagementSystem

--DROP DATABASE BusinessManagementSystem
CREATE TABLE Category(
Id INT IDENTITY(1,1)  PRIMARY KEY,
Code VARCHAR(50),
Name VARCHAR(50),
)

INSERT INTO Category(Code,Name) VALUES('0001','Mobile')
INSERT INTO Category(Code,Name) VALUES('0002','Car')
SELECT * FROM Category


CREATE TABLE Product
(
Id INT IDENTITY(1,1) PRIMARY KEY,
CategoryId INT REFERENCES Category (Id),
Code VARCHAR(50),
Name VARCHAR(50),
ReorderLevel INT,
[Description] VARCHAR(50),
)


SELECT * FROM Product


--SELECT p.Code, p.Name, c.Name, p.ReorderLevel, p.[Description] FROM Product AS p
--LEFT JOIN Category AS c ON c.Id = p.Id 

CREATE TABLE Customer(
Id INT IDENTITY(1,1)  PRIMARY KEY,
Code VARCHAR(50),
Name VARCHAR(50),
[Address] VARCHAR(50),
Email VARCHAR(50),
Contact VARCHAR(50),
LoyalityPoint INT,
)


--INSERT INTO Customer(Code,Name,Address,Email,Contact,LoyalityPoint) VALUES('0001','Arafat','Mirpur','a@gmail.com')
--INSERT INTO Customer(Code,Name) VALUES('0001','Car')
SELECT * FROM Customer

CREATE TABLE Supplier(
Id INT IDENTITY(1,1)  PRIMARY KEY,
Code VARCHAR(50),
Name VARCHAR(50),
[Address] VARCHAR(50),
Email VARCHAR(50),
Contact VARCHAR(50),
ContactPerson VARCHAR(50),
)
INSERT INTO Supplier(Code,Name,Address,Email,Contact,ContactPerson) VALUES('0001','Arafat','Banani','rr@gmail.com','01676234640','Ananna')
INSERT INTO Supplier(Code,Name,Address,Email,Contact,ContactPerson) VALUES('0002','Srobona','Dhanmondi','gg@gmail.com','01679246358','Arafat')

SELECT * FROM Supplier

CREATE TABLE Purchase(
Id INT IDENTITY(1,1)  PRIMARY KEY,
Code VARCHAR(50),
[Date] VARCHAR(50),
Bill VARCHAR(50),
SupplierId INT REFERENCES Supplier (Id),
)

CREATE TABLE PurchaseItem(
Id INT IDENTITY(1,1)  PRIMARY KEY,
CategoryId INT REFERENCES Category (Id),
ProductId INT REFERENCES Product (Id),
PurchaseId INT REFERENCES Purchase (Id),
AvailableQuantity INT,
ManufacturedDate date,
[ExpireDate] date,
Quantity INT,
UnitPrice Float,
TotalPrice Float,
PreviousUnitPrice Float,
PreviousMRP Float,
MRP Float,
Remarks VARCHAR(50)
)

INSERT INTO Purchase(Date,Bill,SupplierId,CategoryId,ProductId,Code,AvailableQuantity,ManufacturedDate,ExpireDate,Quantity,UnitPrice,TotalPrice,PreviousUnitPrice,PreviousMRP,MRP,Remarks) 
VALUES('2019-10-22','inv-001',1,2,1,'0001',25,'2019-2-15','2019-5-15',50,20.00,1000,19.00,23.75,25,'it is a device')

INSERT INTO Purchase(Date,Bill,SupplierId,CategoryId,ProductId,Code,AvailableQuantity,ManufacturedDate,ExpireDate,Quantity,UnitPrice,TotalPrice,PreviousUnitPrice,PreviousMRP,MRP,Remarks) 
VALUES('2019-10-23','inv-002',2,1,2,'0002',25,'2019-2-15','2019-5-15',50,20.00,1000,19.00,23.75,25,'it is a device')

SELECT * FROM Purchase




CREATE TABLE SalesItem(
Id INT IDENTITY(1,1)  PRIMARY KEY,
CustomerId INT REFERENCES Customer (Id),
CategoryId INT REFERENCES Category (Id),
ProductId INT REFERENCES Product (Id),
SalesId INT REFERENCES Sales (Id),
AvailableQuantity INT,
Quantity INT,
MRP Float,
TotalMRP Float,
)

INSERT INTO SalesProduct(CustomerId,CategoryId,ProductId,AvailableQuantity,Quantity,MRP,TotalMRP) VALUES(1,2,1,75,25,10,250)
INSERT INTO SalesProduct(CustomerId,CategoryId,ProductId,AvailableQuantity,Quantity,MRP,TotalMRP) VALUES(1,1,2,75,20,10,200)
SELECT * FROM SalesProduct

drop table SalesProduct

CREATE TABLE Sales(
Id INT IDENTITY(1,1)  PRIMARY KEY,
Code VARCHAR(50),
CustomerId INT REFERENCES Customer (Id),
[Date] date,
LoyalityPoint INT,
GrandTotal Float,
Discount Float,
DiscountAmount Float,
PayableAmount Float,
)

INSERT INTO Sales(Code,CustomerId,Date,LoyalityPoint,GrandTotal,Discount,DiscountAmount,PayableAmount) VALUES(0001,1,'2019-10-25',5,450,0.5,225,225)

--SELECT * FROM SalesProduct

--drop table Sales

--SELECT * FROM Category
--UPDATE Category SET Code = '0004' , Name = 'fruits' WHERE ID = 4;

--SELECT * FROM Category WHERE Name = 'Mobile'


SELECT p.Code, p.Name, c.Name as Category,p.ReorderLevel, p.Description FROM Product As p
LEFT JOIN Category as c ON c.Id = p.CategoryId

Select AvailableQuantity From SalesProduct

Select AvailableQuantity From Purchase Where CategoryId = 1 and ProductId = 2

SELECT * FROM Product
Update  Product Set  Description = 'This is a toy gun' Where Id = 3 

SELECT pu.Code, pu.ProductId, pu.CategoryId , pr.ReorderLevel , pu.ExpireDate  FROM Purchase As pu
LEFT JOIN Product as pr ON pr.Id = pu.ProductId
LEFT JOIN Category as c ON c.Id = pu.CategoryId


SELECT pr.Code, pr.Name, c.Name , pr.ReorderLevel ,  c.Name as Category,p.ReorderLevel, p.Description FROM Product As pr
LEFT JOIN Category as c ON c.Id = p.CategoryId



