use dwij_bda1027;

CREATE TABLE sales_order (Order_no Varchar (6), Order_date Date, Client_no Varchar (6), S_no Varchar (6), Dely_type Char (1), Billed_yn Char (1), Dely_date Date, Order_status Varchar (10));

insert into sales_order values('O1901', '2015-06-12', 'C001', 'S001', 'F', 'N', '2015-06-20', 'InProcess');
insert into sales_order values('O1902', '2015-01-25', 'C002', 'S002', 'P', 'N', '2015-06-27', 'Cancelled');
insert into sales_order values('O4665', '2015-02-18', 'C003', 'S003', 'F', 'Y', '2015-02-20', 'Fullfilled');
insert into sales_order values('O1903', '2015-04-03', 'C001', 'S001', 'F', 'Y', '2015-04-07', 'Fullfilled');
insert into sales_order values('O4666', '2015-05-20', 'C004', 'S002', 'P', 'N', '2015-05-22', 'Cancelled');
insert into sales_order values('O1908', '2015-05-24', 'C005', 'S003', 'F', 'N', '2015-05-26', 'InProcess');

SELECT * FROM sales_order;

-- 1. Find the name of all clients having ‘a ‘ as the second letter in their names
SELECT * FROM client_master where Name Like '_a%';

-- 2. Find out the clients whose name is four character ling and second letter is ‘a‘.
SELECT * FROM client_master where Name Like '_a__';

-- 3. Find out the name of city whose second last character is ‘a’.
SELECT * FROM client_master where City Like '%a_';

-- 4. Print the list of clients whose bal_due is greater than or equal to 10000.
SELECT * FROM client_master where Bal_due >= 1000;

-- 5. Print the information from sales_order table for orders placed in the month of January
select * from sales_order where month(order_date) = 1;

-- 6. Display the order information for client_no ‘C003’ and ‘C001’.
SELECT * FROM sales_order where (Client_no = 'C003' OR Client_no = 'C001');

-- 7. Find products whose selling price is greater than 2000 and less than or equal to 5000.
 SELECT * FROM product_master where (sell_price > 2000 AND sell_price <= 5000);
 
 -- 8. Find products whose selling price is more than 1500. Calculate a new selling price as, original selling price *.
 -- 15. Rename the new column in the above query as new_price.
SELECT Product_no, Description, Sell_price, Sell_price * 0.15 AS new_price, cost_price
FROM product_master where sell_price > 1500;
 
-- 9. List the names, city and state of clients who are not in the state of ‘Maharashtra’.
SELECT * FROM client_master WHERE NOT ( state = 'Maharashtra' );

-- 10. Count the total number of orders.
SELECT COUNT( Order_no ) AS total_orders FROM sales_order;

-- 11. Calculate the average price of all products.
SELECT AVG( sell_price ) As Average_price from product_master;

-- 12. Determine the maximum and minimum product prices. Rename the output as max_price and min_price respectively.
SELECT MAX( sell_price ) As max_price, MIN( sell_price ) As min_price from product_master;

-- 13. Count the number of products having price greater than or equal to 1500.
SELECT COUNT( * ) AS orders_count FROM product_master where sell_price >= 1500;

-- 14. Find all the products whose qty_on_hand is less than reorder level.
SELECT * FROM Product_master WHERE Qty_on_hand < Reorder_lvl;

-- 15. Create table cmaster from client_master table.


-- 16. Insert data in cmaster from client_master where city=’bombay’.
CREATE TABLE cmaster AS SELECT * FROM Client_master WHERE City = 'Bombay';
SELECT * FROM cmaster;

-- 17. Create table sales from sales_order with order_no and client_no columns.


-- 18. Insert data in sales from sales_order table.
CREATE TABLE sales AS SELECT Order_no, Client_no FROM Sales_order;
SELECT * FROM sales;

-- -- Queries on Date manipulation:
-- 1) Display the order number and day on which clients placed their order.
 SELECT Order_no, DAYNAME(Order_date) AS order_day FROM sales_order;
 
-- 2) Display the month (in alphabets) and date when the order must be delivered.
SELECT Order_no, Client_no, DATE_FORMAT(Dely_date, '%d') AS date,
DATE_FORMAT(Dely_date, '%M') AS month, DATE_FORMAT(Dely_date, '%Y') AS year
FROM sales_order;

-- 3) Find the number of days elapsed between delivery date and order date from sales_order table.\
SELECT Order_no, Order_date, Dely_date, DATEDIFF(Dely_date, Order_date) AS Difference FROM sales_order;

-- 4) Find the date, 15 days after today’s date.
SELECT DATE_ADD(CURRENT_DATE(), interval 15 DAY) AS 'Current date + 15 days';

-- 5) Display current date and time.
SELECT CURRENT_DATE() AS 'Current date', CURRENT_TIME() AS 'Current time';

-- 6) Display system time.
SELECT SYSDATE();