/*
Script: A sample db for a Book Store.
Script no: 1/3
Description: This T-SQL code CREATEs TABLES, CONSTRAINTS and INDEX.
Author: Niclas Hjulström
Date: 2016-01-18
*/

use BookStore
go

create table BSLogin (
bsloginid	int				not null	identity(1,1),
username	nvarchar(100)	not null,
passwd		nvarchar(100)	not null,

constraint pk_bslogin_bsloginid	primary key	(bsloginid)
)

go

create table BSUser (
bsuserid		int				not null	identity(1,1),
name			nvarchar(100)	not null,
bslogin_id		int				not null,
constraint	pk_bsuser_bsuserid	primary key	(bsuserid),
constraint fk_bsuser_bslogin_id_bslogin_bsloginid	foreign key	(bslogin_id)	references	BSLogin	(bsloginid)
)

go

create table Customer (
customerid	int				not null identity(1,1),
firstname	nvarchar(100)	not null,
lastname	nvarchar(100)	not null,
bslogin_id	int				not null,

constraint pk_Customer_id primary key(customerid),
constraint fk_customer_bslogin_id_bslogin_bsloginid	foreign key	(bslogin_id)	references	BSLogin	(bsloginid)
)

go

create table ProductCategory (
productcategoryid	int				not null	identity(1,1),
name				nvarchar(100)	not null,
constraint	pk_productcategory_productcategoryid	primary	key	(productcategoryid)
)

go

create table Product (
productid				int				not null	identity(1,1),
name					nvarchar(100)	not null,
productcategory_id		int				not null,
price					decimal(10,2)	not null,
productdesc				nvarchar(max)	not null,
constraint	pk_product_productid	primary key	(productid),
constraint	fk_product_productcategory_id_productcategory_productscategory_id	foreign key	(productcategory_id)	references	productcategory	(productcategoryid)

)

go

create table orderheader (
orderheaderid			int			not null	identity(1,1),
customer_id				int			not null,
orderdate				datetime	not null,
constraint	pk_orderheader_orderheaderid	primary key	(orderheaderid),
constraint	fk_orderheader_customer_id_customer_customerid	foreign key	(customer_id)	references	Customer	(customerid)

)

go

create table orderdetail (
orderdetailid		int				not null	identity(1,1),
orderheader_id		int				not null,
product_id			int				not null,
quantity			int				not null,
unitprice			decimal(10,2)	not null,
constraint	pk_orderdetail_orderdetailid	primary key	(orderdetailid),
constraint	fk_orderdetail_orderheader_id_orderheader_orderheaderid		foreign key	(orderheader_id)	references	Orderheader	(orderheaderid),
constraint	fk_orderdetail_product_id_product_productid					foreign key	(product_id)		references	Product		(productid),

)

go

create unique index idx_unq_bslogin_username	on	BSLogin		(username)
create unique index idx_unq_bsuser_bslogin_id	on	BSUser		(bslogin_id)
create unique index	idx_unq_customer_bslogin_id	on	Customer	(bslogin_id)
