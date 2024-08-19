create database Tprac_4;
use Tprac_4;

-- -- Data Constraints.

-- 1) NOT NULL(column level)
create table customes(id int NOT NULL, name varchar(25));

-- 2) Unique (column level and table level)
-- column level 
create table customes(id int unique, name varchar(25));

-- table level 
create table employee(id int(20), name varchar(25), address varchar(25), aadhaar_no int, unique(id,aadhaar_no));

-- 3) primary key = NOT NULL + UNIQUE
-- create table student(roll_no int(20), name varchar(25), branch varchar(25), primary key(roll_no,branch));
-- 		OR
create table student(roll_no int(20), name varchar(25), branch varchar(25),constraint P_key primary key(roll_no,branch));
alter table student drop constraint P_key; -- if you want to remove the constraint 

-- 4) Foriqn key = to connect two table
create table Dept(did int primary key, name varchar(25));
create table emp(eid int primary key, ename varchar(25),constraint F_key foreign key did references Dept(did));
alter table emp drop constraint F_key; -- if you want to remove the constraint 

-- 5) Check = if i am going to check constraint
create table students(sid int primary key, sname varchar(25), mark int check(mark>35));

-- 6) Default = to give default value when not entered or before entery.
create table student (eid int default 0, name varchar(25));

-- -- Like operation
/* 
	wild character
    1) %
    2) -
*/
-- for question_1
create table costumer(eid varchar(25) primary key, check like eid(%c));