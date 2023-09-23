--1

GO
Create DATABASE BBJewelry

GO
Use BBJewelry

GO

-- Jewelry
CREAtE Table MsJewelry(
JewelryID CHAR(5) Primary Key CHECK (JewelryID LIKE 'JW[0-9][0-9][0-9]'),
JewelryName VARCHAR(50) NOT NULL,
JewelryWeight INT NOT NULL,
PurchasePrice INT NOT NULL,
SalesPrice INT NOT NULL,
Stock INT NOT NULL,
CONSTRAINT JewelryWeight_Constraint CHECK (JewelryWeight between 10 and 1000)
)

GO
-- Jewelry Type
CREATE TABLE JewelryType(
JewelryTypeID CHAR(5) PRIMARY KEY CHECK (JewelryTypeID LIKE 'JT[0-9][0-9][0-9]'),
JewelryID CHAR(5) REFERENCES MsJewelry(JewelryID) ON UPDATE CASCADE ON DELETE CASCADE,
JewelryTypeName CHAR(50),
CONSTRAINT JewelryTypeData_Constraint CHECK (JewelryTypeName like 'Gold' or JewelryTypeName like 'Silver' or JewelryTypeName like 'Diamond' or JewelryTypeName like 'Bronze'
or JewelryTypeName like 'Pearl' or JewelryTypeName like 'White Gold' or JewelryTypeName like 'Ruby' or JewelryTypeName like 'Green Ruby' or JewelryTypeName like 'Black Diamond'
or JewelryTypeName like 'Blue Ruby')
)

GO
-- Staff Table
CREATE TABLE MsStaff(
StaffID CHAR(5) Primary Key CHECK (StaffID LIKE 'ST[0-9][0-9][0-9]'),
StaffName VARCHAR(50) NOT NULL ,
StaffGender VARCHAR(50) NOT NULL,
StaffEmail VARCHAR(50) NOT NULL,
StaffAddress VARCHAR(50) NOT NULL,
StaffPhone VARCHAR(13) NOT NULL,

Constraint StaffName_Constraint CHECK (StaffName LIKE '___%'),
Constraint StaffGender_Constraint CHECK (StaffGender Like 'Male' or StaffGender Like 'Female'),
Constraint StaffEmail_Constraint CHECK (StaffEmail Like '%st.com'),
Constraint StaffPhone_Constraint CHECK (StaffPhone LIKE '08%')
)
GO
-- Customer Table

Create table MsCustomer(
CustomerID CHAR(5) Primary Key CHECK (CustomerID LIKE 'CU[0-9][0-9][0-9]'),
CustomerName VARCHAR(50) NOT NULL,
CustomerGender VARCHAR(50) NOT NULL,
CustomerEmail VARCHAR(50) NOT NULL,
CustomerPhone VARCHAR(50) NOT NULL,
CustomerAddress VARCHAR(50) NOT NULL,

Constraint CSName_Constraint CHECK (CustomerName Like '___%'),
Constraint CSGender_Constraint Check (CustomerGender Like 'Male' Or CustomerGender Like 'Female'),
Constraint CSPhone_Constraint CHECK (CustomerPhone LIKE '08%')
)
GO
-- Vendor Table
Create Table MsVendor(
VendorID CHAR(5) Primary Key CHECK (VendorID LIKE 'VE[0-9][0-9][0-9]'),
VendorName  VARCHAR(50) NOT NULL,
VendorEmail  VARCHAR(50) NOT NULL,
VendorAddress  VARCHAR(50) NOT NULL,
VendorPhone  Char(13) NOT NULL,

CONSTRAINT VendorName_Constraint CHECK (VendorName Like '___%'),
CONSTRAINT VendorEmail_Contraint CHECK (VendorEmail LIKE '%ve.com'),
CONSTRAINT VendorAddress_csontraint CHECK (VendorAddress LIKE '% [0-9] street'),
CONSTRAINT VendorPhone_Constraint CHECK (VendorPhone LIKE '08%')
)

GO
--Purchase Transaction
CREATE TABLE PurchaseHeader(
PurchaseID CHAR(5) Primary Key CHECK (PurchaseID LIKE 'PU[0-9][0-9][0-9]'),
StaffID CHAR(5) Foreign KEY(StaffID) References MsStaff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE,
VendorID CHAR(5) Foreign Key(VendorID) References MsVendor(VendorID) ON UPDATE CASCADE ON DELETE CASCADE,
PurchaseDate Date)

GO
CREATE TABLE PurchaseDetail(
PurchaseID CHAR(5) Foreign KEY REFERENCES PurchaseHeader(PurchaseID) ON UPDATE CASCADE ON DELETE CASCADE,
JewelryID Char(5) Foreign KEY References MsJewelry(JewelryID) ON UPDATE CASCADE ON DELETE CASCADE,
QuantityPurchased INT CHECK (QuantityPurchased > 0),
Primary Key(PurchaseID, JewelryID)
)


-- Sales Transaction
GO
CREATE TABLE SalesHeader(
SalesID CHAR(5) Primary Key CHECK (SalesID LIKE 'SL[0-9][0-9][0-9]'),
StaffID CHAR(5) Foreign KEY(StaffID) References MsStaff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE,
CustomerID CHAR(5) Foreign Key(CustomerID) References MsCustomer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE,
SalesDate Date)

GO
CREATE TABLE SalesDetail(
SalesID CHAR(5) Foreign KEY REFERENCES SalesHeader(SalesID) ON UPDATE CASCADE ON DELETE CASCADE,
JewelryID Char(5) Foreign KEY References MsJewelry(JewelryID) ON UPDATE CASCADE ON DELETE CASCADE,
QuantitySold INT CHECK (QuantitySold > 0),
Primary Key(SalesID, JewelryID)
)