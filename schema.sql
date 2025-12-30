create database sales_analysis_db;

create table sales(
sale_id int primary key,
sale_date date,
product_name varchar(50),
category varchar(50),
region varchar(50),
sale_amount int );

Insert into sales
values
(1,'2024-01-02','Laptop','Electronics','North',60000),
(2,'2024-01-05','Laptop','Electronics','South',58000),
(3,'2024-01-07','Laptop','Electronics','East',62000),
(4,'2024-01-10','Laptop','Electronics','West',55000),
(5,'2024-01-15','Laptop','Electronics','North',65000),
(6,'2024-01-20','Laptop','Electronics','South',63000),
(7,'2024-01-25','Laptop','Electronics','East',59000),
(8,'2024-01-03','Mobile','Electronics','North',30000),
(9,'2024-01-06','Mobile','Electronics','South',32000),
(10,'2024-01-09','Mobile','Electronics','East',31000),
(11,'2024-01-12','Mobile','Electronics','West',28000),
(12,'2024-01-18','Mobile','Electronics','North',35000),
(13,'2024-01-22','Mobile','Electronics','South',33000),
(14,'2024-01-28','Mobile','Electronics','East',29000),
(15,'2024-01-04','Tablet','Electronics','North',25000),
(16,'2024-01-08','Tablet','Electronics','South',27000),
(17,'2024-01-14','Tablet','Electronics','East',23000),
(18,'2024-01-19','Tablet','Electronics','West',28000),
(19,'2024-01-26','Tablet','Electronics','North',26000),
(20,'2024-01-05','Headphones','Accessories','North',5000),
(21,'2024-01-09','Headphones','Accessories','South',4500),
(22,'2024-01-13','Headphones','Accessories','East',5500),
(23,'2024-01-18','Headphones','Accessories','West',4800),
(24,'2024-01-24','Headphones','Accessories','North',6000),
(25,'2024-01-06','Charger','Accessories','North',2000),
(26,'2024-01-11','Charger','Accessories','South',1800),
(27,'2024-01-17','Charger','Accessories','East',2200),
(28,'2024-01-23','Charger','Accessories','West',2500
);
