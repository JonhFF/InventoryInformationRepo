create database InventoryInformation
go

use InventoryInformation
go 

/*Storage user information*/
create table UserInfomation
(
	Id int not null primary key identity(1,1)
	,FirstName varchar(100) not null 
	,LastName varchar(100) not null 
	,IsActive bit default (1)

)
go 

/*Storage product info*/
create table Product 
(
	Id int not null primary key identity(1,1)
	,ProductName varchar(300) not null 
	,IsActive bit default (1)
	,CreatedBy int not null 
	,CreatedOn datetime default getdate()
	,ModifiedBy int
	,ModifiedOn datetime 
)
go

alter table Product add constraint FK_CreatedBy_UserInfo Foreign Key (CreatedBy) references UserInfomation
go

alter table Product add constraint FK_ModifiedBy_UserInfo Foreign Key (ModifiedBy) references UserInfomation
go

/*Storage product purchased info*/
create table ProductPurchased
(
	Id int not null primary key identity(1,1)
	,OrderNumber int not null
	,OrderDate date not null	
	,IsActive bit default (1)
	,CreatedBy int not null 
	,CreatedOn datetime default getdate()
	,ModifiedBy int
	,ModifiedOn datetime 
)
go
alter table ProductPurchased add constraint FK_CreatedBy_ProductPurchased  Foreign Key (CreatedBy) references UserInfomation
go

alter table ProductPurchased add constraint FK_ModifiedBy_ProductPurchased  Foreign Key (ModifiedBy) references UserInfomation
go

create table ProductPurchasedDetail
(
	Id int not null primary key identity(1,1)
	,ProductPurchasedId int
	,ProductId int not null
	,QuantityPurchased int not null
	,UnitPrice decimal(18,2) not null
)
go

alter table ProductPurchasedDetail add constraint FK_ProductId_ProductPurchasedDetail Foreign Key (ProductId) references Product 
go 


/*Storage product sold info*/
create table ProductSold
(
	Id int not null primary key identity(1,1)
	,OrderNumber int not null
	,OrderDate date not null	
	,IsActive bit default (1)
	,CreatedBy int not null 
	,CreatedOn datetime default getdate()
	,ModifiedBy int
	,ModifiedOn datetime 
)
go
alter table ProductSold add constraint FK_CreatedBy_ProductSold Foreign Key (CreatedBy) references UserInfomation
go

alter table ProductSold add constraint FK_ModifiedBy_ProductSold  Foreign Key (ModifiedBy) references UserInfomation
go
create table ProductSoldDetail
(
	Id int not null primary key identity(1,1)
	,ProductSoldId int not null 
	,ProductId int not null
	,QuantitySold int not null
)
alter table ProductSoldDetail add constraint FK_ProductId_ProductSoldDetail Foreign Key (ProductId) references Product 
go 

alter table ProductSoldDetail add constraint FK_ProductSoldId_ProductSoldDetail Foreign Key (ProductSoldId) references ProductSold 
go 

/*
Storage inventory of product by close date 
*/
create table InitProductQuantity
(
	Id int not null primary key identity(1,1)
	,ProductId int not null
	,InitQuantity int not null
	,CloseDate date
	,IsActive bit default (1)
	,CreatedBy int not null 
	,CreatedOn datetime default getdate()
	,ModifiedBy int
	,ModifiedOn datetime 
)

alter table InitProductQuantity add constraint FK_ProductId_InitProductQuantity Foreign Key (ProductId) references Product 
go 