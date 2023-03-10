/*
*********************************************************************
Name: MySQL Magic Ale Database
*********************************************************************
*/
/*

CREATE SCHEMA if not exists magicale;

USE magicale;
*/
DROP TABLE IF EXISTS DiscountDetails,Branch,Product,Campaign,Membership;

create table Product (
	ProductID int not null,
	ProductType varchar (20) not null,
	PackageType varchar(20) not null, 
    YearProduced int not null,
    Price float not null,
    Brand varchar(255) not null,
	PRIMARY KEY (ProductID)
) engine InnoDB default charset=latin1;

create table Campaign (
	CampaignID int not null,
	CampaignStartDate date not null,
    CampaignEndDate date,
	PRIMARY KEY (CampaignID)
) engine InnoDB default charset=latin1;

create table Membership (
	MembershipID int not null,
	FirstName varchar(20) not null,
    LastName varchar(20) not null,
    eMail varchar(255),
    MembershipLevel varchar(20) not null,
    MemberExpDate date,
	PRIMARY KEY (MembershipID)
) engine InnoDB default charset=latin1;

create table DiscountDetails (
	ProductID int not null,
	CampaignID int not null,
	MembershipLevel varchar(20) not null, 
	Discount int not null,
	primary key (ProductID, CampaignID, MembershipLevel),
	foreign key (ProductID) references Product (ProductID),
	foreign key (CampaignID) references Campaign (CampaignID)
) engine InnoDB default charset=latin1;

create table Branch (
	BranchID varchar(45) not null,
	ProductID int not null,
	StockLevel int not null,
	primary key (BranchID, ProductID),
	foreign key (ProductID) references Product (ProductID)
) engine InnoDB default charset=latin1;
