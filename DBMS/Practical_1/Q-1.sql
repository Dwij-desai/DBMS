create database Dwij_BDA1027;

use Dwij_BDA1027;
create table client_master(Client_no varchar(20),Name varchar(20),City varchar(20),Pincode int(20),State varchar(20),Bal_due int(20));

create table product_master(Product_No varchar(20),Description varchar(20),P_percent int(20),U_Measure varchar(20),Qty_on_hand int(20),Reorder_lvl int(20),sell_price int(20),Cost_price int(20));

create table Salesman_master(S_no varchar(20),S_name varchar(20),City varchar(20),Pin int(20),State varchar(20),Sal_Amt int(20),Tgt_toget int(20),Ytd_Sales int(20),Remarks varchar(20));

desc Salesman_master;

-- client_master;
insert into client_master values('C001','Ivan','Bombay',400054,'Maharashtra',15000);
insert into client_master values('C002','Vandana','Madras',780001,'Tamil Nadu',0);
insert into client_master values('C003','Pramada','Bombay',400057,'Maharashtra',5000);
insert into client_master values('C004','Basu','Bombay',400056,'Maharashtra',0);
insert into client_master values('C005','Ravi','Delhi',100001,'Gujarat',2000);
insert into client_master values('C006','Rukmani','Bombay',400050,'Maharashtra',0);
select * from client_master;

-- drop table product_master;
insert into product_master values('P001','Floppies',5,'Piece',100,20,525,500);
insert into product_master values('P002','Floppies',6,'Piece',10,3,12000,11280);
insert into product_master values('P003','Floppies',5,'Piece',20,5,1050,1000);
insert into product_master values('P004','Floppies',5,'Piece',100,20,525,500);
insert into product_master values('P005','Floppies',2,'Piece',10,3,3150,3050);
insert into product_master values('P006','Floppies',2.5,'Piece',10,3,5250,5100);
insert into product_master values('P007','Floppies',4,'Piece',10,3,8400,8000);
select * from product_master;


-- Salesman_master;
insert into Salesman_master values('S001','Kiran','Bombay',400002,'Maharashtar',3000,100,50,'Excellent');
insert into Salesman_master values('S002','Manish','Bombay',400001,'Maharashtar',3000,200,100,'Good');
insert into Salesman_master values('S003','Ravi','Bombay',400032,'Maharashtar',3000,200,100,'Average');
insert into Salesman_master values('S004','Ashish','Bombay',400044,'Maharashtar',3500,200,150,'Good');
select * from Salesman_master;


select product_no, sell_price, cost_price from product_master;


select s_no, s_name, remarks, sal_amt from salesman_master;


-- drop table Salesman_master;
-- DROP DATABASE bda1027;






-- Practical_2

-- use BDA1027;
-- create table Salesman_master(S_no varchar(20),S_name varchar(20),City varchar(20),Pin int(20),State varchar(20),Sal_Amt int(20),Tgt_toget int(20),Ytd_Sales int(20),Remarks varchar(20));
-- insert into Salesman_master values('S001','Kiran','Bombay',400002,'Maharashtar',3000,100,50,'Excellent');
-- insert into Salesman_master values('S002','Manish','Bombay',400001,'Maharashtar',3000,200,100,'Good');
-- insert into Salesman_master values('S003','Ravi','Bombay',400032,'Maharashtar',3000,200,100,'Average');
-- insert into Salesman_master values('S004','Ashish','Bombay',400044,'Maharashtar',3500,200,150,'Good');
-- select * from Salesman_master;

-- 1. Find out the names of all clients.
-- select name from client_master;

-- 2. Retrieve the list of names and the cities of all the clients.
-- select name,City from client_master;

-- 3. List the various products available from the product_master table.
-- select Description from product_master;

-- 4. List all the clients who are located in Bombay.
-- select Name from client_master where City = 'Bombay';

-- 5. Find the names of the salesman who have a salary equal to Rs. 3000
-- select S_name from Salesman_master where Sal_Amt = 3000;

-- 6. List out only unique values for the city of client_master table.
-- select distinct City from Salesman_master;

-- 7. Display product_master table according to the sell_price of product.



-- truncate Salesman_master;
-- desc client_master;
-- drop table product_master;