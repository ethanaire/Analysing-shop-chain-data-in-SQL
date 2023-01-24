USE magicale;

-- Check entries of all tables
select * from product;
select * from product_stock;
select * from campaign;
select * from member;
select * from membership;
select * from product_discount;

/* Query */
-- Query 1: List the branches (ID) of MA that have in stock	at least 5 bottles of Penfold Grange 2010

select pt.BrandID
from product p, product_stock pt
where p.ProductID = pt.ProductID 
and p.Brand = 'Penfolds Grange 2010'
and pt.StockLevel >= 5;

-- Query 2: Ethan plans to do some last-minute Christmas shopping on 24/12/2021. List details of each beer that	she will be entitled to	get	20%	discount on.

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

-- Query 3: Generate a list	of all email addresses of members whose	card will expire in the	month after	the	coming	month.	
-- Thus, for instance, if the query	is run in November 2021, it	will list the emails of all	members	whose membership will expire in	January 2022
-- The emails should be	ordered	by Branch ID, then	by expiry date, and	then by	the	email address, all in ascending	order. 

select distinct m.eMail
from member m, membership ms
where m.MemberID = ms.MemberID
and ms.MemberExpDate >= '2021-11-01' 
and ms.MemberExpDate <='2021-11-30'
order by ms.BrandID asc, ms.MemberExpDate asc, m.eMail asc;

-- Query 4: Determine how many times Penfold Grange	2010 has gone on sale since	Covid-19 related lockdown started (assume it to	be March 01, 2020).

select p.Brand, count(pd.ProductID) as 'Number of Sales' 
from product p, campaign c, product_discount pd 
where pd.ProductID = p.ProductID 
and pd.CampaignID = c.CampaignID 
and p.Brand = 'Penfolds Grange 2010';



















