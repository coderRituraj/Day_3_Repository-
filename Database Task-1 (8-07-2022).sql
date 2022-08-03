use bhavnacorp

/*Creating Products table*/
create table Products(prdt_id int primary key, price int, discount int, prdt_name varchar(30), manufacturer varchar(30))

/*inserting data into Products table*/
insert into Products values(1, 5000, 500, 'Prdt A', 'Manufacturer A')
insert into Products values(2, 5500, 600, 'Prdt B', 'Manufacturer B')
insert into Products values(3, 6000, 700, 'Prdt C', 'Manufacturer C')
insert into Products values(4, 6600, 400, 'Prdt D', 'Manufacturer D')
insert into Products values(5, 7000, 800, 'Prdt E', 'Manufacturer E')
insert into Products values(6, 4500, 540, 'Prdt F', 'Manufacturer F')
insert into Products values(7, 1500, 100, 'Prdt G', 'Manufacturer G')
insert into Products values(8, 7300, 800, 'Prdt H', 'Manufacturer H')
insert into Products values(9, 8700, 900, 'Prdt I', 'Manufacturer I')
insert into Products values(10, 8200, 900, 'Prdt J', 'Manufacturer J')

/*showing items from Products table*/
select * from Products


/*Creating Orders table*/
create table Orders(order_id int primary key, customer_id int, order_date varchar(30))
insert into Orders values(1, 1, '22-7-2022')
insert into Orders values(2, 2, '07-7-2022')
insert into Orders values(3, 3, '2-8-2022')
insert into Orders values(4, 4, '1-8-2022')
insert into Orders values(5, 5, '25-7-2022')
insert into Orders values(6, 6, '28-7-2022')
insert into Orders values(7, 7, '29-7-2022')
insert into Orders values(8, 8, '23-7-2022')
insert into Orders values(9, 9, '22-7-2022')
insert into Orders values(10, 10,'1-7-2022')

/*showing items from Orders table*/
select * from Orders

/*Creating Customer table*/
create table Customer(id int primary key, C_name varchar(30), city varchar(30), pincode int)
/*inserting data into Customer table*/
insert into Customer values(1, 'Arun', 'Delhi', 116008)
insert into Customer values(2, 'Axat', 'Faridabad', 216008)
insert into Customer values(3, 'Aman', 'Noida', 316008)
insert into Customer values(4, 'Ajay', 'Gurugram', 416008)
insert into Customer values(5, 'Ashu', 'Noida', 516008)
insert into Customer values(6, 'Hritik', 'Faridabad', 616008)
insert into Customer values(7, 'Abhishek', 'Delhi', 716008)
insert into Customer values(8, 'Amit', 'Mohali', 816008)
insert into Customer values(9, 'Raj', 'Gurugram', 916008)
insert into Customer values(10, 'Anmol', 'Palwal', 156008)

/*Showing data from Customer table*/
select * from Customer


/*Creating Accounts table*/
create table Accounts(c_id int primary key, order_id int, payment_status varchar(30) )
/*Adding data to Accounts table*/
insert into Accounts values(1,1,'Yes')
insert into Accounts values(2,2,'No')
insert into Accounts values(3,3,'Yes')
insert into Accounts values(4,4,'No')
insert into Accounts values(5,5,'Yes')
insert into Accounts values(6,6,'No')
insert into Accounts values(7,7,'Yes')
insert into Accounts values(8,8,'No')
insert into Accounts values(9,9,'Yes')
insert into Accounts values(10,10,'No')

/*Showing data from Accounts table*/
select * from Accounts

/*creating customer_view*/
create view Customer_View
as
select prdt_id, price, payment_status
from  Products as P
inner join Accounts as A
on P.prdt_id=A.c_id

/*showing data from customer_view*/
select * from Customer_View


/*creating Accounts_view*/
create view Accounts_view
as
select sum(price) as 'Total sales amount' 
from Products as P
inner join Accounts as A
on P.prdt_id=A.c_id and A.payment_status='Yes'

/*showing data from Accounts_view*/
select * from Accounts_view

/*creating order_view*/
create view Order_View
as 
select order_id, order_date, C_name, city
from Orders as O
inner join Customer as C
on O.order_id=C.id

/*showing data from order_view*/
select * from Order_View

/*creating product_view*/
create view Product_view
as 
select prdt_name, manufacturer, payment_status 
from Products as P
inner join Accounts as A
on P.prdt_id=A.c_id and payment_status='Yes'


/*showing data from product_view*/
select * from Product_view

create table Client(id int primary key, C_name varchar(30), city varchar(30), pincode int)
/*inserting data into Customer table*/
insert into Client values(1, 'Vikas', 'Palwal', 116008)
insert into Client values(2, 'Deepanshu', 'Faridabad', 216008)
insert into Client values(3, 'Karan', 'Rohtak', 316008)
insert into Client values(4, 'Jeevesh', 'Punjab', 416008)
insert into Client values(5, 'Anshuman', 'Noida', 516008)
insert into Client values(6, 'Hritik', 'Faridabad', 616008)

/*Showing data from Customer table*/
select * from Client


/*Demonstrating the use of various operators*/
select * from Products where price>4000 and discount>=700

select * from Products where price<5000 and discount<=500

select * from Customer where C_name like 'A%' and city='Delhi'

/*intersection operation*/
select * from Customer
intersect 
select * from Client

/*union operation*/
select * from Client
union 
select * from Customer

/*in operator*/
select * from Customer where C_name in ('Arun','Ashu','Amit','Axat','Sam')

/*!= operator*/
select order_id from Accounts where payment_status != 'yes'

/*between operator*/
select * from Products where discount between 200 and 500

/*like operator*/
select * from Customer where C_name like 'A%[ak]%'

/*is not null operator*/
select order_id, order_date from Orders where order_date is not null

/*is null operator*/
select * from Products where prdt_id is null