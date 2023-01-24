# Project description

## Overview:  

All sql files are produced to create tables based on a suitable schema and then generate basic data analysis SQL codes. Moreover, some scenarios are set up to reflect the usage of stored procedures that can be recognised in real-life practice.

## Tasks: 

**basicQuery:**

*Q1.* List the branches (ID) of MA that have in stock at least 5 bottles of Penfold Grange 2010.

*Q2.* Simone Singh plans to do some last-minute Christmas shopping on 24/12/2021. List details of each beer that she will be entitled to get 20% discount on.

*Q3.* Generate a list of all email addresses of members whose card will expire in the month after the coming month. Thus, for instance, if the query is run in November
2121, it will list the emails of all members whose membership will expire in January 2122. The emails should be ordered by Branch ID, then by expiry date, and then by
the email address, all in ascending order.

*Q4.* Determine how many times Penfold Grange 2010 has gone on sale since Covid-19 related lockdown started (assume it to be March 01, 2020).

**advancedQuery:**

*Q1.* 

The membership records in the Membership table can be updated using an UPDATE statement. Such a statement can update any non-PK column value including the membership levels, but the Magic Ale has certain rules about membership level upgrades:
- Only those members with a non-expired membership can receive an upgrade.
- Only the SILVER members can be upgraded to the GOLD level.
- Only the GOLD members can be upgraded to the PLATINUM level.
- There is no further upgrade for the PLATINUM members.

a BEFORE UPDATE trigger called CHECK_MEMBERSHIP_UPDATE is created to fire when a record is attempted to be updated in the Membership table. The trigger has to check the conditions above to make sure that they are satisfied by the update request. If the above conditions are satisfied, then the UPDATE statement is allowed to proceed. Otherwise, a meaningful message needs to be displayed to the user. 

*Q2.* 

In this task, you will write a procedure called BrandNameCampaign which takes a brand name as input and creates a new campaign with the top 5 most expensive products with that
brand name. The campaign will have a 4 week duration and will start after exactly two weeks of its creation. For the campaign, the SILVER level members will receive a 10% discount, the GOLD level members 20% and the PLATINUM level members 30%. If there are five or fewer products with that brand name, all those products will be included in the campaign. 

 