USE BBJewelry
--1

Select MsVendor.VendorID as 'Vendor ID', VendorName, StaffName, COUNT(PurchaseHeader.PurchaseDate) as 'Total Transaction'
From PurchaseHeader JOIN MsStaff ON PurchaseHeader.StaffID = MsStaff.StaffID Join MsVendor ON PurchaseHeader.VendorID = MsVendor.VendorID
Where MONTH(PurchaseHeader.PurchaseDate) = 7 and MsVendor.VendorName Like '% %'
Group by MsVendor.VendorID, VendorName, StaffName
ORDER BY MsVendor.VendorID

--2

SELECT JewelryName as 'Jewelry Type Name', CONCAT(MsJewelry.SalesPrice*MsJewelry.Stock, ' USD') as 'Total Price'
FROM JewelryType JOIN MsJewelry ON JewelryType.JewelryID = MsJewelry.JewelryID
Where (JewelryName LIKE '%Ruby%' or MsJewelry.JewelryName LIKE '%Diamond%' )  and MsJewelry.SalesPrice*MsJewelry.Stock> 40000

--3
SELECT CONVERT(VARCHAR, SalesHeader.SalesDate, 107) AS 'Date', CustomerName, sum(QuantitySold) as 'Total Jewelry'
FROM SalesHeader JOIN SalesDetail ON SalesHeader.SalesID = SalesDetail.SalesID JOIN MsCustomer ON SalesHeader.CustomerID = MsCustomer.CustomerID
WHERE CustomerName LIKE ('%__________%') and MONTH(SalesDate) = 9
GROUP BY CustomerName, SalesDate

--4
SELECT PurchaseHeader.StaffID, StaffName, sum(QuantityPurchased) as 'Total Jewelry', CONCAT(  SUM(QuantityPurchased)*PurchasePrice,' USD') as 'TotalPrice'

FROM MsStaff JOIN PurchaseHeader ON MsStaff.StaffID = PurchaseHeader.StaffID JOIN PurchaseDetail on PurchaseHeader.PurchaseID = PurchaseDetail.PurchaseID
JOIN MsJewelry ON MsJewelry.JewelryID = PurchaseDetail.JewelryID
WHERE MsStaff.StaffGender = 'Male'
GROUP BY PurchaseHeader.StaffID, StaffName, PurchasePrice
HAVING sum(QuantityPurchased) > 1
ORDER BY TotalPrice DESC

--5
SELECT mc.CustomerName, CustomerEmail, CustomerAddress, JewelryName, CONCAT(JewelryWeight, ' gram') AS 'Jewelry Weight'
FROM MsCustomer mc JOIN SalesHeader sh ON mc.CustomerID = sh.CustomerID JOIN SalesDetail sd ON sh.SalesID = sd.SalesID JOIN MsJewelry mj ON sd.JewelryID = mj.JewelryID,
(
SELECT MAX(SalesPrice) 'Ian'
FROM MsCustomer mc JOIN SalesHeader sh ON mc.CustomerID = sh.CustomerID JOIN SalesDetail sd ON sh.SalesID = sd.SalesID JOIN MsJewelry mj ON sd.JewelryID = mj.JewelryID
) Hehe
WHERE CustomerAddress = '%l%' AND SalesPrice = Hehe.Ian


--6
SELECT DISTINCT VendorName, VendorEmail, VendorPhone, JewelryName, [Jewelry Price] = CONCAT(PurchasePrice, ' USD')
FROM MsVendor mv JOIN PurchaseHeader ph ON mv.VendorID = ph.VendorID
JOIN PurchaseDetail pd ON ph.PurchaseID = pd.PurchaseID
JOIN MsJewelry mj ON pd.JewelryID = mj.JewelryID, (
 SELECT [MinimumPrice] = MIN(PurchasePrice)
 FROM MsJewelry
)Minimum
WHERE VendorName LIKE '%n%' AND Minimum.MinimumPrice = PurchasePrice
ORDER BY VendorName DESC


--7
SELECT STUFF(ms.StaffID, 1, 2, 'Staff') AS 'Staff ID', StaffName, JewelryName, CONCAT((PurchasePrice*Stock), ' USD') AS 'Total Price'
FROM MsStaff ms INNER JOIN PurchaseHeader ph ON ms.StaffID = ph.StaffID INNER JOIN PurchaseDetail pd ON ph.PurchaseID = pd.PurchaseID INNER JOIN MsJewelry mj ON pd.JewelryID = mj.JewelryID,
(
SELECT AVG(QuantityPurchased) 'Darren'
FROM PurchaseDetail
) Hehe
WHERE pd.QuantityPurchased > Hehe.Darren AND DAY(ph.PurchaseDate) % 2 = 1
ORDER BY StaffName ASC

--8
SELECT SalesHeader.StaffID, UPPER(StaffName) as 'StaffName', SalesHeader.SalesID, CONCAT(SalesPrice*QuantitySold ,' USD' )'TotalPrice'
FROM SalesHeader JOIN SalesDetail on SalesHeader.SalesID = SalesDetail.SalesID 
JOIN MsStaff ON SalesHeader.StaffID = MsStaff.StaffID
JOIN MsJewelry ON SalesDetail.JewelryID = MsJewelry.JewelryID
WHERE MsStaff.StaffName LIKE '%o%'
GROUP BY SalesHeader.StaffID, StaffName, SalesHeader.SalesID, QuantitySold, SalesPrice
HAVING AVG(SalesPrice*QuantitySold) < SalesPrice*QuantitySold
ORDER BY TotalPrice DESC
--9
GO
CREATE VIEW viewStaffSales
AS
SELECT ms.StaffID, LOWER(StaffName) AS 'StaffName', StaffEmail, QuantitySold AS 'Total Jewelry Sold', Stock AS 'Average Quantity'
FROM MsStaff ms JOIN SalesHeader sh ON ms.StaffID = sh.StaffID JOIN SalesDetail sd ON sh.SalesID = sd.SalesID JOIN MsJewelry mj ON sd.JewelryID = mj.JewelryID
WHERE LEN(StaffName) < 5 AND Stock > (SELECT AVG(Stock) FROM MsJewelry)

--10
Go
Create view ViewVendorPurchase
AS 
Select PurchaseHeader.VendorID, VendorName, VendorEmail, VendorAddress, TotalJewelryPurchased = Count(QuantityPurchased), AVG(QuantityPurchased) 'AverageQuantity'
From MsVendor mv Join PurchaseHeader On mv.VendorID = PurchaseHeader.VendorID join PurchaseDetail On PurchaseDetail.PurchaseID = PurchaseHeader.PurchaseID,
(SELECT TRY_CAST(VendorAddress as INT) AS IntAddress FROM MsVendor
)hahaha

Where hahaha.IntAddress %2 = 0 
Group by PurchaseHeader.VendorID, VendorName, VendorAddress, QuantityPurchased, VendorEmail
HAVING  Count(QuantityPurchased) > 1
