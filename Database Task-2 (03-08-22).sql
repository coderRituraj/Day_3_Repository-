CREATE DATABASE e_commerce

use e_commerce
create table Products(P_ID int primary key, P_Name nvarchar(30), Unit int, Price int,P_exp_date nvarchar(10))

insert into Products values(1, 'audi_1', 120, 100,'8 Aug')
insert into Products values(2, 'Audi_2', 22, 1800,'9 Aug')
insert into Products values(3, 'Audi_3', 189, 190,'10 Aug')
insert into Products values(4, 'Audi_4', 33, 1600, '11 Aug')
insert into Products values(5, 'Adui_5', 23, 200, '12 Aug')

select * from Products

create table Customers(C_ID int primary key identity(1,1), C_Name nvarchar(30), city nvarchar(30), P_Code int)

insert into Customers values('rituraj', 'New delhi', 190062)
insert into Customers values('Munnim', 'Delhi', 116099)
insert into Customers values('koshal', 'Patiala', 221602)
insert into Customers values('Raj', 'Mohali', 143008)
insert into Customers values('Hritik', 'Chandigarh', 161002)

select * from Customers



create table Orders(O_Id int primary key identity(1,1), C_ID int, Order_Date nvarchar(30), constraint fk_inv_C_ID foreign key (C_ID) references Customers(C_ID))
insert into Orders values( 1, '21-07-2022')
insert into Orders values( 2, '23-06-2022')
insert into Orders values(3, '25-07-2022')
insert into Orders values(76, '28-07-2022')
insert into Orders values(5, '31-07-2022')
insert into Orders values( 6, '31-07-2022')
insert into Orders values( 3, '31-07-2022')

select * from Orders



select * from Orders

select C_ID, count(C_ID) as 'Frequency of Order' from Orders group by C_ID


select distinct C_Name,P_Code,Order_Date from Customers as C
inner join Orders as O
on C.C_ID=O.C_Id
order by C_Name 

select * from Products 
where Price>200 

select P_Name, sum(Unit) as 'Total Unit of Goods'
from Products 
group by P_Name
having sum(Unit)>15
