
--SELECT Code,Name,Name as Category,ReorderLevel,ExpiredDate,OpeningBalance,In ,Out,ClosingBalance FROM Purchase


----CREATE VIEW [Stock]
----AS
----SELECT pu.Code,pr.Name,c.Name as Category,pr.ReorderLevel,pui.ExpireDate,pui.AvailableQuantity as Opening_Balance,pui.Quantity as inn,si.Quantity as Out,si.AvailableQuantity as Closing_Balance From PurchaseItems as pui
----LEFT JOIN Purchase as pu ON pu.Id = pui.PurchaseId 
----LEFT JOIN Product as pr ON pr.Id = pui.ProductId
----LEFT JOIN Category as c ON c.Id = pui.CategoryId
----LEFT JOIN SalesItem as si ON si.AvailableQuantity = pui.AvailableQuantity


----SELECT * FROM Stock WHERE Name = 'RM 2' OR Category = 'Mobile' or Date = '2017-06-22' or Date = '2017-06-22' or Date BETWEEN '2017-06-22' AND '2019-06-22'

----SELECT Code,Name,Category,ReorderLevel,ExpireDate,Opening_Balance,inn,Out,Closing_Balance FROM Stock;
----SELECT SUM(inn) as inn,SUM(Out) as out FROM Stock;

--CREATE VIEW [InOut]
--AS
--SELECT SUM(inn) as newinn,SUM(Out) as newout FROM Stock


--SELECT Code,Name,Category,ReorderLevel,ExpireDate,Opening_Balance,newinn,newout,Closing_Balance FROM Stock,InOut 

--CREATE VIEW [OB]
--AS
--SELECT pui.AvailableQuantity AS AQ From PurchaseItems as pui
--LEFT JOIN Purchase as pu ON pu.Id = pui.PurchaseId 

--SELECT * FROM Stock WHERE Name = 'RM 2' or Category = 'Mobile' 
--SELECT s.Code,s.Name,s.Category,s.ReorderLevel,s.ExpireDate,s.Opening_Balance,i.newinn,i.newout,s.Closing_Balance FROM Stock as s,InOut as i,Purchase as pu WHERE pu.Date BETWEEN '2017-06-22' AND '2019-06-22' or Name = 'RM 2' or Category = 'Mobile' 
----DROP VIEW Stock;
--SELECT s.Code,s.Name,s.Category,s.ReorderLevel,s.ExpireDate,s.Opening_Balance,i.newinn,i.newout,s.Closing_Balance FROM Stock as s,InOut as i 
--SELECT s.Code,s.Name,s.Category,s.ReorderLevel,s.ExpireDate,s.Opening_Balance,i.newinn,i.newout,s.Closing_Balance FROM Stock as s,InOut as i,Purchase as pu WHERE pu.Date BETWEEN '2017-06-22' AND '2019-06-22' or Name = 'RM 2' or Category = 'Mobile' 


----CREATE VIEW [ProductDisplay] AS
----SELECT p.Code, p.Name, c.Name as Category,p.ReorderLevel, p.Description FROM Product As p LEFT JOIN Category as c ON c.Id = p.CategoryId
----SELECT * FROM ProductDisplay
----SELECT * FROM ProductDisplay WHERE Code = '0001' OR Name = 'RM 2'
----SELECT * FROM Product WHERE Code like '" + search + "%' OR Name like '" + search + "%'




--SELECT pui.AvailableQuantity as Opening From PurchaseItems as pui
--LEFT JOIN Purchase as pu ON pu.Id = pui.PurchaseId 


--CREATE VIEW [OpeningBalance] AS
--SELECT AvailableQuantity as OpeningBalance
--FROM PurchaseItems
--WHERE Price > (SELECT AVG(Price) FROM Products);


--CREATE VIEW [SoldQty]
--AS
--SELECT SUM(SQ) FROM Sale

--CREATE VIEW [SoldQty]
--AS
--SELECT SUM(Sale.SaleQ) as SoldQty FROM Sale

--CREATE VIEW [Sale]
--AS
--SELECT s.Code ,pr.Name,c.Name as Category,si.Quantity as SaleQ,pui.UnitPrice as CP, si.MRP as Sales_Price, (pui.UnitPrice-si.MRP) as Profit From SalesItem as si
--LEFT JOIN Sales as s ON s.Id = si.SalesId
--LEFT JOIN Product as pr ON pr.Id = si.ProductId
--LEFT JOIN Category as c ON c.Id = si.CategoryId
--LEFT JOIN PurchaseItems as pui ON  pui.AvailableQuantity = si.AvailableQuantity


--DROP VIEW Sale;
--DROP VIEW SoldQty

--SELECT sa.Code ,sa.Name,sa.Category,SQ.SoldQty,sa.CP, sa.Sales_Price, sa.Profit FROM Sale as sa,SoldQty as SQ,Sales as s WHERE s.Date BETWEEN '2017-06-22' AND '2019-06-22'

--CREATE VIEW [Purchases]
--AS
--SELECT pu.Code ,pr.Name,c.Name as Category,pui.AvailableQuantity,pui.UnitPrice as CP, pui.MRP, (pui.UnitPrice-pui.MRP) as Profit From PurchaseItems as pui
--LEFT JOIN Purchase as pu ON pu.Id = pui.PurchaseId 
--LEFT JOIN Product as pr ON pr.Id = pui.ProductId
--LEFT JOIN Category as c ON c.Id = pui.CategoryId
--LEFT JOIN SalesItem as si ON si.AvailableQuantity = pui.AvailableQuantity

SELECT * FROM Purchases,Purchase as pu WHERE pu.Date BETWEEN '2017-06-22' AND '2019-06-22'