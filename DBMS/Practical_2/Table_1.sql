-- Practical_2

use dwij_bda1027;
create table Salesman_master(S_no varchar(20),S_name varchar(20),City varchar(20),Pin int(20),State varchar(20),Sal_Amt int(20),Tgt_toget int(20),Ytd_Sales int(20),Remarks varchar(20));
insert into Salesman_master values('S001','Kiran','Bombay',400002,'Maharashtar',3000,100,50,'Excellent');
insert into Salesman_master values('S002','Manish','Bombay',400001,'Maharashtar',3000,200,100,'Good');
insert into Salesman_master values('S003','Ravi','Bombay',400032,'Maharashtar',3000,200,100,'Average');
insert into Salesman_master values('S004','Ashish','Bombay',400044,'Maharashtar',3500,200,150,'Good');
select * from Salesman_master;

-- 1. Find out the names of all clients.
select name from client_master;

-- 2. Retrieve the list of names and the cities of all the clients.
select name,City from client_master;

-- 3. List the various products available from the product_master table.
select Description from product_master;

-- 4. List all the clients who are located in Bombay.
select Name from client_master where City = 'Bombay';

-- 5. Find the names of the salesman who have a salary equal to Rs. 3000
select S_name from Salesman_master where Sal_Amt = 3000;

-- 6. List out only unique values for the city of client_master table.
select distinct City from Salesman_master;

-- 7. Display product_master table according to the sell_price of product.
select * from product_master order by sell_price;

-- 8) Display product_master table according to the sell_price and cost_price.
select * from product_master order by sell_price, cost_price;

-- 9) Display product_no, description in descending order of sell_price for product_master table.
select product_no, description from product_master order by sell_price desc;

-- -- B) Updating records in a table.
-- 1) Change the city of client_no’C002’ to ‘Bombay’.




-- truncate Salesman_master;
-- desc client_master;
-- drop table product_master;