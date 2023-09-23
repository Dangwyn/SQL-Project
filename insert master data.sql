	--MASTER DATA
USE BBJewelry

-- Insert Value Staff
INSERT INTO MsStaff VALUES
('ST001', 'Liliane Gina', 'Female', 'Lilianegina@st.com', 'Callistus 5 Street', '08822299789'),
('ST002', 'Elijah James', 'Male', 'Elijahjames01@st.com', 'Oliver 3 Street', '084568893210'),
('ST003', 'Lucas Benjamin', 'Male', 'Benjaminlucas@st.com', 'Emery 6 Street', '0871655789320')

-- Insert Value Vendor
INSERT INTO MsVendor Values
('VE001', 'Florence Clementine', 'Florence_clm@ve.com', 'St. Peters 8 Street', '08822347910'),
('VE002', 'Georgina Alice', 'Georgina123@ve.com', 'Mary 9 Street', '0881223345718'),
('VE003', 'Laurene Christy', 'LChristy@ve.com', 'Salma 7 Street', '0821347899112')
-- Insert Value Customer
Insert Into MsCustomer Values
('CU001','Veselin Fedelm','Female','veseline@gmail.com','08723314523','Anggrek 8 street'),
('CU002','Veles Samar','Male','samar@gmail.com','08731024675','Tulip 1 street'),
('CU003','Amir Divna','Male','amir@gmail.com','089356619263','Anggrek 4 street'),
('CU004','Mary Hugh','Female','mary@gmail.com','089325711883','Lavender 9 street')

Insert Into MsJewelry Values
-- Insert Jewelry
('JW001','Gold Bracelets','18','600','800','5'),
('JW002','Ruby Necklace','10','1000','1500','2'),
('JW003','Gold Ear Rings','10','200','300','4'),
('JW004','Diamond Watch','15','4000','6400','2'),
('JW005', 'Diamond Ring' , '20', '8000', '10000', '10'),
('JW006', 'Black Diamond Ring' , '15', '10000', '15000', '10'),
('JW007', 'Silver Necklace' , '10', '200', '300', '7'),
('JW008', 'Bronze Bangles' , '20', '8000', '10000', '10'),
('JW009','White Gold Necklace','20','2000','4000','8'),
('JW010','Green Ruby Ring','13','2300','3700','5'),
('JW011','Blue Ruby Ring','15','2500','4000','3'),
('JW012','Pearl Necklace','10','3000','6000','9')

INSERT INTO JewelryType Values
('JT001','JW001','Gold'),
('JT002','JW002','Ruby'),
('JT003','JW003','Gold'),
('JT004','JW004','Diamond'),
('JT005' ,'JW005', 'Diamond'),
('JT006','JW006','Black Diamond'),
('JT007','JW007','Silver'),
('JT008','JW008','Bronze'),
('JT009','JW009','White Gold'),
('JT010','JW010','Green Ruby'),
('JT011', 'JW011','Blue Ruby'),
('JT012','JW012','Pearl')

