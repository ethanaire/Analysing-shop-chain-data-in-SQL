USE magicale;
select * from Product;
select * from Campaign;
select * from Membership;
select * from DiscountDetails;
select * from Branch;

-- Task 1:
DELIMITER // 
DROP TRIGGER IF EXISTS CHECK_MEMBERSHIP_UPDATE //
CREATE TRIGGER CHECK_MEMBERSHIP_UPDATE 
BEFORE UPDATE ON Membership FOR EACH ROW 
BEGIN 
     -- Declare the expiry date variable
     DECLARE expDate date;
     -- Declare the error message 
     DECLARE errorMessage varchar(255);
     SET errorMessage = CONCAT('MEMBERSHIP HAS EXPIRED OR YOUR LEVEL IS PLATINUM');
     
     IF OLD.MemberExpDate > curdate() THEN 
	 -- Check all membership upgrade conditions
	   CASE 
            WHEN OLD.MembershipLevel = 'Silver' THEN
				SET NEW.MembershipLevel = 'Gold';
            WHEN OLD.MembershipLevel = 'Gold' THEN
                SET NEW.MembershipLevel = 'Platinum';
		    WHEN OLD.MembershipLevel = 'Platinum' THEN
                SET NEW.MembershipLevel = 'Platinum';
	   END CASE;    
     ELSE   
       SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = errorMessage;
     END IF;
     
END //
DELIMITER ;

-- Task 2:
DELIMITER //
DROP PROCEDURE IF EXISTS BrandNameCampaign //
CREATE PROCEDURE BrandNameCampaign(IN brandName VARCHAR(30))
BEGIN 
   DECLARE product_ID INT;
   DECLARE campID INT;
   DECLARE campStartDate DATE;
   DECLARE campEndDate DATE;
   DECLARE exit_loop INT DEFAULT false;
   
   -- Declare cursor to retrieve top 5 products by price 
   DECLARE camp_cursor CURSOR FOR
   SELECT ProductID FROM product WHERE Brand = brandName ORDER BY Price DESC LIMIT 5;
       
   -- Declare error handler for loop exit
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_loop = true;
   
   -- Create new campaign and set start date and end date 
   SELECT distinct COUNT(*)+1 INTO campID FROM campaign;
   SET campStartDate = DATE_ADD(CURDATE(),INTERVAL 2 WEEK);
   SET campEndDate = DATE_ADD(campStartDate,INTERVAL 4 WEEK);
   
   -- Insert new campaign's details into table Campaign
   INSERT INTO campaign VALUES(campID, campStartDate, campEndDate);
   
   OPEN camp_cursor;
       -- Start looping 
       cursor_loop:loop
	   -- Fetch product ID from the cursor
	   FETCH camp_cursor INTO product_ID;
	   IF exit_loop THEN  
		 LEAVE cursor_loop; 
	   END IF;
       
	   -- Insert discount details based on membership and product
	   INSERT INTO discountdetails VALUES (product_ID, campID, 'SILVEL', 10);
       INSERT INTO discountdetails VALUES (product_ID, campID, 'GOLD', 20);
       INSERT INTO discountdetails VALUES (product_ID, campID, 'PLATINUM', 30);
           
       END LOOP cursor_loop;
       SELECT 'New campaign successfully created' AS 'Output';
   CLOSE camp_cursor;
END //
DELIMITER ;

 