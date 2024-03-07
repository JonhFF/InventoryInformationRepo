use InventoryInformation
go 

create proc uspGetProductTransactionHistory
as

	select 
	prodPur.OrderDate
	,prod.ProductName
	,SUM(prodPurDet.QuantityPurchased) ProductPurchased
	,0 ProductSold

	from ProductPurchased prodPur

	inner join ProductPurchasedDetail prodPurDet
	on prodPurDet.ProductPurchasedId = prodPur.Id

	inner join Product prod
	on prod.Id = prodPurDet.ProductId

	group by prodPur.OrderDate
	,prod.ProductName

	union all 

	select 
	prodSold.OrderDate
	,prod.ProductName
	,0 ProductPurchased
	,SUM(prodSoldDet.QuantitySold) ProductSold

	from ProductSold prodSold

	inner join ProductSoldDetail prodSoldDet
	on prodSoldDet.ProductSoldId = prodSold.Id

	inner join Product prod
	on prod.Id = prodSoldDet.ProductId

	group by prodSold.OrderDate
	,prod.ProductName