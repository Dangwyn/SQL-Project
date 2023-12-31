-- Purchase Transaction
USE BBJewelry
INSERT INTO PurchaseHeader VALUES 
('PU001','ST001','VE001','2021-06-10'),
('PU002','ST001','VE003','2021-07-11'),
('PU003', 'ST002', 'VE002', '2021-07-15'),
('PU004', 'ST001', 'VE001', '2021-07-17' ),
('PU005','ST001','VE003','2021-07-17'),
('PU006', 'ST003', 'VE002', '2021-07-21' ),
('PU007','ST002','VE001','2021-08-26'),
('PU008','ST002','VE002','2021-08-31'),
('PU009','ST003','VE003','2021-09-09'),
('PU010','ST001','VE001', '2021-09-13')


Insert INTO PurchaseDetail Values 
('PU001', 'JW001', '1'),
('PU001', 'JW002', '1'),
('PU002', 'JW001', '1'),
('PU002', 'JW003', '2'),
('PU003', 'JW001', '1'),
('PU004', 'JW004', '1'),
('PU005', 'JW001','1'),
('PU005', 'JW004', '1'),
('PU006', 'JW001','1'),
('PU007','JW005','1'),
('PU007','JW006','2'),
('PU007','JW002','3'),
('PU008','JW007','2'),
('PU008','JW009','5'),
('PU009', 'JW010','2'),
('PU010','JW011','1')

Insert INTO SalesHeader VAlues
('SL001','ST001','CU001','2021-06-14'),
('SL002','ST001','CU002','2021-06-14'),
('SL003','ST001','CU003','2021-06-14'),
('SL004','ST002','CU004','2021-06-19'),
('SL005','ST003','CU003','2021-07-21'),
('SL006','ST002','CU001','2021-07-24'),
('SL007','ST003','CU002','2021-08-01'),
('SL008','ST002','CU004','2021-08-10'),
('SL009', 'ST001', 'CU001', '2021-09-09')

INSERT INTO SalesDetail Values
('SL001','JW001','1'),
('SL001','JW003','2'),
('SL001','JW011','1'),
('SL002','JW005','1'),
('SL003','JW009','2'),
('SL004','JW010','1'),
('SL005','JW002','1'),
('SL005','JW007','3'),
('SL006','JW006','1'),
('SL007','JW004','2'),
('SL008','JW008','1'),
('SL009','JW002','1'),
('SL009','JW012','2')
