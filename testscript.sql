USE magicale;
/* Part(a) - Required Testing on the Sample data */

-- Upgrade all current memberships which are not Platinum level
UPDATE membership SET MembershipLevel = 'Platinum' WHERE MembershipID = 1;
UPDATE membership SET MembershipLevel = 'Gold' WHERE MembershipID = 2;
UPDATE membership SET MembershipLevel = 'Platinum' WHERE MembershipID = 4;
UPDATE membership SET MembershipLevel = 'Gold' WHERE MembershipID = 5;

-- Investigate new data of membership table after upgrading MembershipLevel
SELECT * FROM Membership;

/* Part (b) - More extensive testing for Task 2 and Task 3 */
-- Trigger testing
-- Insert new data on Membership table
INSERT INTO `Membership`(`MembershipID`,`FirstName`,`LastName`, `eMail`, `MembershipLevel`, `MemberExpDate`) VALUES 
(6, 'Mixi', 'Phung', 'dochet1989@gmail.com','Platinum', '2021-10-31'),
(7, 'Peter', 'Pan', 'ppnet@gmail.com','Silver', '2021-10-1'),
(8, 'Sarah', 'Hoag', 'hoagsa@gmail.com','Gold', '2021-2-7'),
(9, 'Peter', 'Parker', 'parkerpe@gmail.com','Silver', '2021-12-24'),
(10, 'Robert', 'Downey', 'rdj1st@gmail.com','Gold', '2021-4-26');

-- Investigate new data of Membership table
SELECT * FROM Membership;

-- Upgrade membership levels of all new memberships 
UPDATE membership SET MembershipLevel = 'Gold' WHERE MembershipID = 6;
UPDATE membership SET MembershipLevel = 'Gold' WHERE MembershipID = 7;
UPDATE membership SET MembershipLevel = 'Platinum' WHERE MembershipID = 8;
UPDATE membership SET MembershipLevel = 'Gold' WHERE MembershipID = 9;
UPDATE membership SET MembershipLevel = 'Platinum' WHERE MembershipID = 10;

-- Investigate new data of membership table after upgrading MembershipLevel
SELECT * FROM Membership;

-- Stored procedure testing
-- Insert new data on Product table 
INSERT INTO `Product`(`ProductID`,`ProductType`,`PackageType`,`YearProduced`,`Price`, `Brand`) VALUES 
(6,'Wine', 'Bottle', 2017, 950, 'Penfold'),
(7,'Wine','Bottle', 2018, 135, 'Penfold'),
(8,'Wine','Bottle', 2019, 200, 'Penfold'),
(9,'Wine','Bottle', 2020, 125, 'Penfold'),
(10,'Wine','Bottle', 2017, 50, 'Penfold');

-- Investigate new data of Product table
SELECT * FROM Product;

-- Call the procedure to create new campaign with 'Penfold' brand
CALL BrandNameCampaign('Penfold'); 

-- Check the data of the new campaign 
SELECT * FROM Campaign;

-- It appears that the new campaign has a CampaignID value of 6 so we check which products are selected for this campaign
SELECT * FROM Discountdetails WHERE CampaignID = '6'; 

-- Verify by finding the top five expensive products
SELECT ProductID FROM Product WHERE Brand = 'Penfold' ORDER BY Price DESC LIMIT 5;

