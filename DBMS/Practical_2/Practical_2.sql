create database temp_BDA1027;

use temp_bda1027;

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
INSERT INTO Product_master VALUES ("P001", "Floppies",5,"Piece",100,20,525,500);
INSERT INTO Product_master VALUES ("P002", "Monitor",6,"Piece",10,3,12000,11280);
INSERT INTO Product_master VALUES ("P003", "Mouse",5,"Piece",20,5,1050,1000);
INSERT INTO Product_master VALUES ("P004", "Floppies",5,"Piece",100,20,525,500);
INSERT INTO Product_master VALUES ("P005", "Keyboard",2,"Piece",10,3,3150,3050);
INSERT INTO Product_master VALUES ("P006", "Cd Drive",2.5,"Piece",10,3,5250,5100);
INSERT INTO Product_master VALUES ("P007", "1.44 Drive",4,"Piece",10,3,8400,8000);
select * from product_master;


-- Salesman_master;
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
select product_no, description, sell_price from product_master order by sell_price desc;

SET SQL_SAFE_UPDATES = 0;
-- -- B) Updating records in a table.
-- 1) Change the city of client_no’C002’ to ‘Bombay’.
update client_master set city = 'Bombay' where client_no = 'C002';
select * from client_master;

-- 2) Change the bal_due of client_no’C001’ to Rs.1000
update client_master set Bal_due = 1000 where client_no = 'C001';
select * from client_master;

-- 3) Change the cost price of Floppies to Rs. 950.00
update Product_master set Cost_price = 950 where Description = 'Floppies';
select * from Product_master;

-- 4) Change the city of the salesman to Mumbai.
update Salesman_master set City='Mumbai';
select * from Salesman_master;

-- -- C) Deleting records in a table:
-- 1) Delete all salesman from the salesmane_master whose salaries are equal to Rs. 3500.
delete from Salesman_master where sal_amt = 3500;
select * from Salesman_master;

-- 2) Delete all products from product_master where the quantity on hand is equal to 100.
delete from Product_master where Qty_on_hand = 100;
select * from Product_master;


-- 3) Delete from client_master where the column state holds the value ‘Tamil Nadu’
delete from client_master where State = 'Tamil Nadu';
select * from client_master;

-- -- E) Altering the table structure:
-- 1) Add a column called ‘telephone’ of datatype ‘number’ and size=10 to the client_master table.
alter table client_master add column telephone numeric(10);
select * from client_master;

-- 2) Change the size of sell_price column in product_master to 10,2.
alter table product_master modify column sell_price decimal(10,2);
select * from product_master;

-- 3) Rename column telephone to new name as contact for client_master table.
alter table client_master modify column telephone numeric(10);
select * from client_master;

-- 4) Delete column contact from client_master table.
alter table client_master drop Pincode;
select * from client_master;

-- -- F) Deleting the table structure along with data:
-- Create table employee with 4 columns and 5 rows.
-- 1) Destroy the table employee along with its data.
CREATE TABLE employees (eid INT ,ename VARCHAR(50),Eaadhar_no decimal(65),department VARCHAR(50));
INSERT INTO employees VALUES (1, 'Dwij', '123456789012', 'CSE');
INSERT INTO employees VALUES (2, 'Ender', '234567890123', 'BDA');
INSERT INTO employees VALUES (3, 'Harry', '345678901234', 'CS');
INSERT INTO employees VALUES (4, 'Potter', '456789012345', 'CBA');
INSERT INTO employees VALUES (5, 'Steve', '567890123456', 'CS');

SELECT * FROM employees;
drop table employees;

-- -- G) Renaming the table:
-- 1) Change the name of the salesman_master table to sman_mast.
rename table salesman_master to sman_mast;
SELECT * FROM sman_mast;
