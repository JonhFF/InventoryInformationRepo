use InventoryInformation
go

insert into UserInfomation(FirstName, LastName) values('Juan', 'Navarro')
go

insert into Product(ProductName, CreatedBy) values ('charger', 1)
insert into Product(ProductName, CreatedBy) values ('toothbrush', 1)
insert into Product(ProductName, CreatedBy) values ('radio', 1)
insert into Product(ProductName, CreatedBy) values ('pillow', 1)
insert into Product(ProductName, CreatedBy) values ('eraser', 1)
insert into Product(ProductName, CreatedBy) values ('bed', 1)
insert into Product(ProductName, CreatedBy) values ('purse', 1)
insert into Product(ProductName, CreatedBy) values ('soap', 1)
insert into Product(ProductName, CreatedBy) values ('glow stick', 1)
insert into Product(ProductName, CreatedBy) values ('canvas', 1)
insert into Product(ProductName, CreatedBy) values ('balloon', 1)
insert into Product(ProductName, CreatedBy) values ('hair brush', 1)
insert into Product(ProductName, CreatedBy) values ('pen', 1)
insert into Product(ProductName, CreatedBy) values ('watch', 1)
insert into Product(ProductName, CreatedBy) values ('rubber duck', 1)
insert into Product(ProductName, CreatedBy) values ('tooth picks', 1)
insert into Product(ProductName, CreatedBy) values ('face wash', 1)
insert into Product(ProductName, CreatedBy) values ('bottle cap', 1)
insert into Product(ProductName, CreatedBy) values ('floor', 1)
insert into Product(ProductName, CreatedBy) values ('thermostat', 1)

select * from Product

insert into InitProductQuantity(ProductId, InitQuantity, CloseDate, CreatedBy) values(1,6,'2024-03-06',1)
insert into InitProductQuantity(ProductId, InitQuantity, CloseDate, CreatedBy) values(2,9,'2024-03-06',1)
insert into InitProductQuantity(ProductId, InitQuantity, CloseDate, CreatedBy) values(3,10,'2024-03-06',1)
insert into InitProductQuantity(ProductId, InitQuantity, CloseDate, CreatedBy) values(4,2,'2024-03-06',1)
insert into InitProductQuantity(ProductId, InitQuantity, CloseDate, CreatedBy) values(5,14,'2024-03-06',1)


select * from InitProductQuantity