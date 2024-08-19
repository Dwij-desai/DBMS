use tprac_4;

CREATE TABLE Client_master (
Client_no VARCHAR(6) NOT NULL PRIMARY KEY CHECK
(Client_no LIKE 'C%'),
Name VARCHAR(15) NOT NULL, City VARCHAR(15),
Pincode NUMERIC(8), State VARCHAR(15), Bal_due NUMERIC(10,2)
);

INSERT INTO Client_master (Client_no, Name, City, Pincode, State, Bal_due)
VALUES
	('C001', 'Ivan', 'Bombay', 400054, 'Maharashtra', 15000),
	('C002', 'Vandana', 'Madras', 780001, 'Tamil Nadu', 0), 
	('C003', 'Pramada', 'Bombay', 400057, 'Maharashtra', 5000),
	('C004', 'Basu', 'Bombay', 400056, 'Maharashtra', 0),
	('C005', 'Ravi', 'Delhi', 100001, 'Gujarat', 2000),
	('C006', 'Rukmani', 'Bombay', 400050, 'Maharashtra', 0);

SELECT * FROM Client_master;

-- 2)	Table Created: Product_master
CREATE TABLE Product_master (
Product_no VARCHAR(6) NOT NULL PRIMARY KEY
CHECK(Product_no LIKE 'P%'), Description VARCHAR(15) NOT NULL, P_percent NUMERIC(4,2) NOT NULL,
U_measure VARCHAR(10) NOT NULL,
Qty_on_hand NUMERIC(8) NOT NULL, Reorder_lvl NUMERIC(8) NOT NULL,
Sell_price NUMERIC(8,2) NOT NULL CHECK (Sell_price != 0), Cost_price NUMERIC(8,2) NOT NULL CHECK (Cost_price != 0)
);


INSERT INTO Product_master (Product_no, Description, P_percent, U_measure, Qty_on_hand, Reorder_lvl, Sell_price, Cost_price) VALUES
('P001', 'Floppies', 5, 'Piece', 100, 20, 525, 500),
('P002', 'Monitor', 6, 'Piece', 10, 3, 12000, 11280),
('P003', 'Mouse', 5, 'Piece', 20, 5, 1050, 1000),
('P004', 'Floppies', 5, 'Piece', 100, 20, 525, 500),
('P005', 'Keyboards', 2, 'Piece', 10, 3, 3150, 3050),
('P006', 'Cd Drive', 2.5, 'Piece', 10, 3, 5250, 5100),
('P007', '1.44 Drive', 4, 'Piece', 10, 3, 8400, 8000);

SELECT * FROM Product_master;

-- Creating the Salesman_master table
CREATE TABLE Salesman_master (
    S_no        VARCHAR(6)   NOT NULL PRIMARY KEY CHECK (S_no LIKE 'S%'),  
    S_name      VARCHAR(15)  NOT NULL,                                      
    City        VARCHAR(10),                                               
    Pincode     NUMERIC(8),                                                
    State       VARCHAR(12),                                               
    Sal_amt     NUMERIC(8,2) NOT NULL CHECK (Sal_amt != 0),                
    Tgt_to_get  NUMERIC(6,2) NOT NULL CHECK (Tgt_to_get != 0),             
    Ytd_sales   NUMERIC(6,2) NOT NULL,                                     
    Remarks     VARCHAR(20)                                                
);


INSERT INTO Salesman_master 
    (S_no, S_name, City, Pincode, State, Sal_amt, Tgt_to_get, Ytd_sales, Remarks) 
VALUES 
    ('S001', 'Kiran',  'Bombay',  400002, 'Maharashtra', 3000, 100, 50, 'Excellent'),
    ('S002', 'Manish', 'Bombay',  400001, 'Maharashtra', 3000, 200, 100, 'Good'),
    ('S003', 'Ravi',   'Bombay',  400032, 'Maharashtra', 3000, 200, 100, 'Average'),
    ('S004', 'Ashish', 'Bombay',  400044, 'Maharashtra', 3500, 200, 150, 'Good');

SELECT * FROM Salesman_master;

-- Creating the Sales_order table
CREATE TABLE Sales_order (
    Order_no     VARCHAR(6)  PRIMARY KEY CHECK (Order_no LIKE 'O%'),
    Order_date   DATE,
    Client_no    VARCHAR(6),
    S_no         VARCHAR(6),
    Dely_type    CHAR(1)    DEFAULT 'F',
    Billed_yn    CHAR(1),
    Dely_date    DATE,
    Order_status VARCHAR(10),
    FOREIGN KEY (Client_no) REFERENCES Client_master(Client_no),
    FOREIGN KEY (S_no) REFERENCES Salesman_master(S_no),
    CHECK (Dely_type IN ('P', 'F')),
    CHECK (Dely_date >= Order_date),
    CHECK (Order_status IN ('inprocess', 'fullfiled', 'backorder', 'cancelled'))
);
INSERT INTO Sales_order 
    (Order_no, Order_date, Client_no, S_no, Dely_type, Billed_yn, Dely_date, Order_status) 
VALUES 
    ('O1901', '2006-01-12', 'C001', 'S001', 'F', 'N', '2006-01-20', 'inprocess'),
    ('O1902', '2006-01-25', 'C002', 'S002', 'P', 'N', '2006-01-27', 'cancelled'),
    ('O4665', '2006-02-18', 'C003', 'S003', 'F', 'Y', '2006-02-20', 'fullfiled'),
    ('O1903', '2006-04-03', 'C001', 'S001', 'F', 'Y', '2006-04-07', 'fullfiled'),
    ('O4666', '2006-05-20', 'C004', 'S002', 'P', 'N', '2006-05-22', 'cancelled'),
    ('O1908', '2006-05-24', 'C005', 'S003', 'F', 'N', '2006-05-26', 'inprocess');
SELECT * FROM Sales_order;

-- Creating the Sales_order_details table
CREATE TABLE Sales_order_details (
    Order_no      VARCHAR(6),
    Product_no    VARCHAR(6),
    Qty_ordered   NUMERIC(8),
    Qty_disp      NUMERIC(8),
    Product_rate  NUMERIC(10,2),
    PRIMARY KEY (Order_no, Product_no),
    FOREIGN KEY (Order_no) REFERENCES Sales_order(Order_no),
    FOREIGN KEY (Product_no) REFERENCES Product_master(Product_no)
);

INSERT INTO Sales_order_details 
    (Order_no, Product_no, Qty_ordered, Qty_disp, Product_rate) 
VALUES
    ('O1901', 'P001', 4, 4, 525),
    ('O1901', 'P002', 2, 1, 8400),
    ('O1901', 'P003', 2, 1, 5250),
    ('O1902', 'P001', 10, 0, 525),
    ('O4665', 'P002', 3, 3, 3150),
    ('O4665', 'P004', 3, 1, 5250),
    ('O4665', 'P005', 10, 10, 525),
    ('O4665', 'P003', 4, 4, 1050),
    ('O1903', 'P006', 2, 2, 1050),
    ('O1903', 'P004', 1, 1, 12000),
    ('O1908', 'P005', 1, 0, 8400),
    ('O1908', 'P007', 10, 0, 1050);
SELECT * FROM Sales_order_details;

