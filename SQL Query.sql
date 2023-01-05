/*Task 4 */
/*Tables creation */
CREATE TABLE `product` (
`ProductID` varchar(50) NOT NULL,
`ProductType` varchar(50) NOT NULL,
`PackageType` varchar(50) NOT NULL,
`YearProduced` int(4) NOT NULL,
`Price` decimal(10,2) NOT NULL,
`Brand` varchar(50) NOT NULL,
PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `product_stock` (
`BrandID` varchar(50) NOT NULL,
`ProductID` varchar(50) NOT NULL,
`StockLevel` int(11) NOT NULL,
PRIMARY KEY (`BrandID`, `ProductID`),
CONSTRAINT `product_stock_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `campaign` (
`CampaignID` varchar(50) NOT NULL,
`CampaignStartDate` DATE NOT NULL,
`CampaignEndDate` DATE NOT NULL,
PRIMARY KEY (`CampaignID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `member` ( 
`MemberID` varchar(60) NOT NULL,
`FirstName` varchar(50) NOT NULL,
`LastName` varchar(50) NOT NULL,
`eMail` varchar(100) NOT NULL,
PRIMARY KEY (`MemberID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `membership` ( 
`BrandID` varchar(50) NOT NULL,
`MemberID` varchar(60) NOT NULL,
`MembershipLevel` varchar(20) NOT NULL,
`MemberExpDate` date NOT NULL,
PRIMARY KEY (`BrandID`,`MemberID`),
CONSTRAINT `membership_ibfk_1` FOREIGN KEY (`MemberID`) REFERENCES `member` (`MemberID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `product_discount` (
`CampaignID` varchar(50) NOT NULL,
`ProductID` varchar(50) NOT NULL,
`MemberID` varchar(20) NOT NULL,
`Discount` decimal(5,2) NOT NULL,
PRIMARY KEY (`ProductID`,`CampaignID`,`MemberID`),
CONSTRAINT `product_discount_ibfk_1` FOREIGN KEY (`CampaignID`) REFERENCES `campaign` (`CampaignID`),
CONSTRAINT `product_discount_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
CONSTRAINT `product_discount_ibfk_3` FOREIGN KEY (`MemberID`) REFERENCES `member` (`MemberID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


/*Data insertion */
insert into `product`(`ProductID`, `ProductType`, `PackageType`, `YearProduced`, `Price`, `Brand`) values 
('1','wine','bottle','2010','899.00','Penfolds Grange 2010'),
('2','wine','bottle','2016','848.99','Penfolds Grange 2016'),
('3','beer','can','2020','4.39','Brick Lane Sidewiner Hazy Pale Low Alc 355mL'),
('4','spirit','bottle','2011','164.99','Corowa Mad Dog Morgan Whisky 500mL'),
('5','beer','bottle','2020','5.09','Crown Lager 375mL');

insert into `product_stock` (`BrandID`,`ProductID`,`StockLevel`) values 
('1','1','100'),
('5','1','55'),
('2','3','200'),
('4','2','15'),
('6','5','255');

insert into `campaign` (`CampaignID`,`CampaignStartDate`,`CampaignEndDate`) values 
('1','2021-12-21','2021-12-27'),
('2','2021-12-20','2021-12-26'),
('3','2021-9-20','2021-9-27'),
('4','2021-4-15','2021-4-19'),
('5','2020-12-28','2021-1-3');

insert into `member` (`MemberID`,`FirstName`,`LastName`,`eMail`) values 
('1','Jonathan','Vuong','jonaking@gmail.com'),
('2','Simone','Singh','ssingh12@gmail.com'),
('3','Banh','Ngoo','ngobakha1st@gmail.com'),
('4','Bruno','Pogba','manuplayer@gmail.com'),
('5','Mixi','Phung','mixi1989@gmail.com');

insert into `membership` (`BrandID`,`MemberID`,`MembershipLevel`,`MemberExpDate`) values 
('5','1','Gold','2021-10-15'),
('1','4','Platinum','2021-7-29'),
('2','2','Platinum','2021-11-22'),
('6','2','Platinum','2021-11-22'),
('4','3','Silver','2021-11-1');

insert into `product_discount` (`CampaignID`,`ProductID`,`MemberID`,`Discount`) values 
('2','1','1','15.00'),
('2','3','2','20.00'),
('2','5','2','20.00'),
('3','1','4','20.00'),
('5','2','3','10.00');

select * from product;
select * from product_stock;
select * from campaign;
select * from member;
select * from membership;
select * from product_discount;

/* Task 5 */
-- Query 1
select pt.BrandID
from product p, product_stock pt
where p.ProductID = pt.ProductID 
and p.Brand = 'Penfolds Grange 2010'
and pt.StockLevel >= 5;

-- Query 2
select * 
from product p1 
where p1.ProductID in  
(select p2.ProductID 
from product p2, member m, membership ms, product_discount pd, campaign c 
where p2.ProductID = pd.ProductID 
and m.MemberID = ms.MemberID
and m.MemberID = pd.MemberID
and c.CampaignID = pd.CampaignID
and m.FirstName = 'Simone'
and m.LastName = 'Singh'
and p2.ProductType = 'beer' 
and pd.Discount = '20.00'
and '2021-12-24' >= c.CampaignStartDate and '2021-12-24' <= c.CampaignEndDate);

-- Query 3
select distinct m.eMail
from member m, membership ms
where m.MemberID = ms.MemberID
and ms.MemberExpDate >= '2021-11-01' 
and ms.MemberExpDate <='2021-11-30'
order by ms.BrandID asc, ms.MemberExpDate asc, m.eMail asc;

-- Query 4
select p.Brand, count(pd.ProductID) as 'Number of Sales' 
from product p, campaign c, product_discount pd 
where pd.ProductID = p.ProductID 
and pd.CampaignID = c.CampaignID 
and p.Brand = 'Penfolds Grange 2010';



















