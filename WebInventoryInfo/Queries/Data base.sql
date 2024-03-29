USE [master]
GO
/****** Object:  Database [InventoryInformation]    Script Date: 3/7/2024 10:31:12 AM ******/
CREATE DATABASE [InventoryInformation]
go

USE [InventoryInformation]
GO


create function [dbo].[ufnGetUserId]()
returns int 
Begin
	declare @Id int 
	select top 1 
	@Id = Id 
	from UserInfomation

	return @Id
End

 

GO
/****** Object:  Table [dbo].[InitProductQuantity]    Script Date: 3/7/2024 10:31:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InitProductQuantity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[InitQuantity] [int] NOT NULL,
	[CloseDate] [date] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/7/2024 10:31:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](300) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPurchased]    Script Date: 3/7/2024 10:31:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPurchased](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPurchasedDetail]    Script Date: 3/7/2024 10:31:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPurchasedDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductPurchasedId] [int] NULL,
	[ProductId] [int] NOT NULL,
	[QuantityPurchased] [int] NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSold]    Script Date: 3/7/2024 10:31:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSold](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSoldDetail]    Script Date: 3/7/2024 10:31:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSoldDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductSoldId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[QuantitySold] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfomation]    Script Date: 3/7/2024 10:31:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfomation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InitProductQuantity] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[InitProductQuantity] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[ProductPurchased] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ProductPurchased] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[ProductSold] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ProductSold] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[UserInfomation] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[InitProductQuantity]  WITH CHECK ADD  CONSTRAINT [FK_ProductId_InitProductQuantity] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[InitProductQuantity] CHECK CONSTRAINT [FK_ProductId_InitProductQuantity]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_CreatedBy_UserInfo] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[UserInfomation] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_CreatedBy_UserInfo]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_ModifiedBy_UserInfo] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[UserInfomation] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_ModifiedBy_UserInfo]
GO
ALTER TABLE [dbo].[ProductPurchased]  WITH CHECK ADD  CONSTRAINT [FK_CreatedBy_ProductPurchased] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[UserInfomation] ([Id])
GO
ALTER TABLE [dbo].[ProductPurchased] CHECK CONSTRAINT [FK_CreatedBy_ProductPurchased]
GO
ALTER TABLE [dbo].[ProductPurchased]  WITH CHECK ADD  CONSTRAINT [FK_ModifiedBy_ProductPurchased] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[UserInfomation] ([Id])
GO
ALTER TABLE [dbo].[ProductPurchased] CHECK CONSTRAINT [FK_ModifiedBy_ProductPurchased]
GO
ALTER TABLE [dbo].[ProductPurchasedDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProductId_ProductPurchasedDetail] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductPurchasedDetail] CHECK CONSTRAINT [FK_ProductId_ProductPurchasedDetail]
GO
ALTER TABLE [dbo].[ProductSold]  WITH CHECK ADD  CONSTRAINT [FK_CreatedBy_ProductSold] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[UserInfomation] ([Id])
GO
ALTER TABLE [dbo].[ProductSold] CHECK CONSTRAINT [FK_CreatedBy_ProductSold]
GO
ALTER TABLE [dbo].[ProductSold]  WITH CHECK ADD  CONSTRAINT [FK_ModifiedBy_ProductSold] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[UserInfomation] ([Id])
GO
ALTER TABLE [dbo].[ProductSold] CHECK CONSTRAINT [FK_ModifiedBy_ProductSold]
GO
ALTER TABLE [dbo].[ProductSoldDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProductId_ProductSoldDetail] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductSoldDetail] CHECK CONSTRAINT [FK_ProductId_ProductSoldDetail]
GO
ALTER TABLE [dbo].[ProductSoldDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProductSoldId_ProductSoldDetail] FOREIGN KEY([ProductSoldId])
REFERENCES [dbo].[ProductSold] ([Id])
GO
ALTER TABLE [dbo].[ProductSoldDetail] CHECK CONSTRAINT [FK_ProductSoldId_ProductSoldDetail]
GO
/****** Object:  StoredProcedure [dbo].[uspGetProductAvailableQuanitity]    Script Date: 3/7/2024 10:31:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[uspGetProductAvailableQuanitity]
as 

	declare @CloseDate date = null
			,@From date 
			,@To date = getdate()

	/*get last close date available */
	select top 1
	@CloseDate = CloseDate
	from InitProductQuantity
	order by CloseDate desc	
	
	/* If there is not exist data in Init product quantity 
	   Look for the first product purchased date
	*/
	if @CloseDate is null 
	Begin
	 select top 1
	  @CloseDate = OrderDate
	 from ProductPurchased
	 order by id asc 
	End 

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
		on prodPurDet.ProductPurchasedId = prodPur.Id

		where CAST(prodPur.OrderDate AS DATE) between @From and @To
	
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

GO
/****** Object:  StoredProcedure [dbo].[uspGetProductTransactionHistory]    Script Date: 3/7/2024 10:31:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[uspGetProductTransactionHistory]
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
GO
/****** Object:  StoredProcedure [dbo].[uspSaveProductPurchasedDetail]    Script Date: 3/7/2024 10:31:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[uspSaveProductPurchasedDetail]
(
	@ProductPurchasedId int
	,@ProductId int
	,@QuantityPurchased	int 
	,@UnitPrice decimal(18,2)
)
AS

--insertering product purchased detail register
insert into ProductPurchasedDetail(ProductPurchasedId, ProductId, QuantityPurchased, UnitPrice)
values(@ProductPurchasedId, @ProductId, @QuantityPurchased, @UnitPrice)

select SCOPE_IDENTITY() Id
GO
/****** Object:  StoredProcedure [dbo].[uspSaveProductPurchasedMaster]    Script Date: 3/7/2024 10:31:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[uspSaveProductPurchasedMaster] 
(
	@OrderNumber int
	,@OrderDate date
)
AS

--Get userId available 
declare @userId int = dbo.ufnGetUserId()

--insertering product purchased master register
insert into ProductPurchased(OrderDate, OrderNumber, CreatedBy)
values(@OrderDate, @OrderNumber, @userId)

select SCOPE_IDENTITY() Id

GO
/****** Object:  StoredProcedure [dbo].[uspSaveProductSolddDetail]    Script Date: 3/7/2024 10:31:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspSaveProductSolddDetail]
(
	@ProductSolddId int
	,@ProductId int
	,@QuantitySold	int 
)
AS

--insertering product sold detail register
insert into ProductSoldDetail(ProductSoldId, ProductId, QuantitySold)
values(@ProductSolddId, @ProductId, @QuantitySold)

select SCOPE_IDENTITY() Id
GO
/****** Object:  StoredProcedure [dbo].[uspSaveProductSoldMaster]    Script Date: 3/7/2024 10:31:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[uspSaveProductSoldMaster] 
(
	@OrderNumber int
	,@OrderDate date
)
AS

--Get userId available 
declare @userId int = dbo.ufnGetUserId()

--insertering product sold master register
insert into ProductSold(OrderDate, OrderNumber, CreatedBy)
values(@OrderDate, @OrderNumber, @userId)

select SCOPE_IDENTITY() Id

GO
USE [master]
GO
ALTER DATABASE [InventoryInformation] SET  READ_WRITE 
GO
