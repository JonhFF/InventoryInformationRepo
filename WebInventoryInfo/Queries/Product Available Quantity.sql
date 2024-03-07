use InventoryInformation
go

create procedure uspGetProductAvailableQuanitity
as 

	declare @CloseDate date
			,@From date 
			,@To date = getdate()

	/*get last close date available */
	select top 1
	@CloseDate = CloseDate
	from InitProductQuantity
	order by CloseDate desc	

	/*Add one day to @from param for getting quanties products 
	  after close inventory
	 */
	set @From = DATEADD(day, 1, @CloseDate)

	select
	prod.Id
	,prod.ProductName
	,SUM(prodDispon.Quantity) Quantity
	from (
		/*Get products available from the last close*/
		select 
		initProduct.ProductId
		,initProduct.InitQuantity Quantity

		from InitProductQuantity initProduct
		where CloseDate = @CloseDate

		union all 

		/*Add products purchased to the disponibility*/
		select 
		prodPurDet.ProductId
		,SUM(prodPurDet.QuantityPurchased) Quantity
		from ProductPurchased prodPur

		inner join ProductPurchasedDetail prodPurDet
		on prodPurDet.ProductPurchasedId = prodPurDet.Id

		where prodPur.OrderDate between @From and @To
	
		group by prodPurDet.ProductId

		union all 

		/*Subtract sold products from the disponibility*/
		select 
		prodSoldDet.ProductId
		,-SUM(prodSoldDet.QuantitySold) Quantity
		from ProductSold prodSold

		inner join ProductSoldDetail prodSoldDet
		on prodSoldDet.ProductSoldId = prodSold.Id

		where prodSold.OrderDate between @From and @To
		group by prodSoldDet.ProductId
	) as prodDispon

	inner join Product prod
	on prod.Id = prodDispon.ProductId

	group by 	prod.Id
	,prod.ProductName

