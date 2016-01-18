/*
Script: A sample db for a Book Store.
Script no: 2/3
Description: This T-SQL code CREATEs STORE PROCEDUREs.
Author: Niclas Hjulström
Date: 2016-01-18
*/
use BookStore
go

CREATE PROCEDURE sp_insert_product_to_order @orderno int
AS
BEGIN
	WITH cte_rn_10 AS ( SELECT ABS(CHECKSUM(NewId())) % 10 + 1 as rn)	-- generate random number with 10
	,cte_rn_100 AS ( SELECT ABS(CHECKSUM(NewId())) % 100 + 1 as rn) -- generate random number with 100
	INSERT INTO orderdetail
	SELECT 
		@orderno as orderheader_id, 
		p.productid as product_id, 
		p.price as unitprice, 
		(SELECT rn FROM cte_rn_100) AS quantity -- random quantity
	FROM Product p
	WHERE 
		p.productid = (SELECT rn FROM cte_rn_10 WHERE rn NOT IN (SELECT product_id FROM orderdetail od WHERE od.orderheader_id = @orderno) )	-- random unique product for that order

END