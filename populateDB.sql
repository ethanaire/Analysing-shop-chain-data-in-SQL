/*
*********************************************************************
Name: MySQL Magic Ale Database
*********************************************************************
*/

insert  into `Product`(`ProductID`,`ProductType`,`PackageType`,`YearProduced`,`Price`, `Brand`) values 
(1,'Wine', 'Bottle', '1990', 1000, 'Penfold'),
(2,'Wine','Bottle', 2000, 400, 'Penfold'),
(3,'Wine','Bottle', 2010, 200, 'Penfold'),
(4,'Wine','Bottle', 2020, 50, 'Penfold'),
(5,'Beer','Can', 2020, 10, 'Blonde');
insert  into `Campaign`(`CampaignID`,`CampaignStartDate`,`CampaignEndDate`) values 
(1,'2021-01-02', '2021-01-30'),
(2,'2021-02-02', '2021-02-28'),
(3,'2021-03-02', '2021-03-30'),
(4,'2021-08-02', '2021-08-30'),
(5,'2021-09-02', '2021-09-30');
insert  into `Membership`(`MembershipID`,`FirstName`,`LastName`, `eMail`, `MembershipLevel`, `MemberExpDate`) values 
(1, 'John', 'Smith', 'johnsimth@gmail.com','Gold', '2021-12-31'),
(2, 'Peter', 'Cole', 'petercole@gmail.com','Silver', '2021-10-15'),
(3, 'Sarah', 'Goodman', 'sgoodman@gmail.com','Platinum', '2021-10-31'),
(4, 'Christ', 'Gordon', 'cgordon@gmail.com','Gold', '2021-11-28'),
(5, 'Emma', 'Spring', 'espringh@gmail.com','Silver', '2021-12-31');
insert  into `DiscountDetails`(`ProductID`,`CampaignID`,`MembershipLevel`, `Discount`) values 
(1, 1, 'Gold', 21),
(1, 1, 'Platinum', 32),
(2, 1, 'Gold', 13),
(2, 2, 'Silver', 50),
(3, 3, 'Platinum', 5);
insert  into `Branch`(`BranchID`,`ProductID`,`StockLevel`) values 
('MA', 1, 1000),
('AB', 2, 10000),
('CD', 3, 10000),
('EF', 5, 100000),
('HH', 4, 20000);

select * from DiscountDetails;
select * from Membership;