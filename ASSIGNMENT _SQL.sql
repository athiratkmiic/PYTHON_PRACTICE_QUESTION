CREATE DATABASE OnlineBookstore;
USE OnlineBookstore;

CREATE TABLE BOOKS(
Book_id INT PRIMARY KEY,
Title VARCHAR (20),
Author_id INT,
Price DECIMAL(10,2),
Publication_Year INT);

CREATE TABLE AUTHORS(
Author_id INT PRIMARY KEY,
Author_Name VARCHAR (20),
Country VARCHAR (20));

CREATE TABLE ORDERS(
Order_id INT PRIMARY KEY,
Book_id INT,
Customer_Name VARCHAR(20),
Oeder_Date Date);

INSERT INTO BOOKS VALUES(101,"GOD OF SMALL THINGS",1,1000.0,1996);
INSERT INTO BOOKS VALUES(102,"MOBY DICK",2,1500.0,1851);
INSERT INTO BOOKS VALUES(103,"ALICE IN WONDERLAND",3,1000.0,1862);

INSERT INTO AUTHORS VALUES(1,'ARUNDHATHI ROY','INDIA');
INSERT INTO AUTHORS VALUES(2,'HERMAN','USA');
INSERT INTO AUTHORS VALUES(3,'LEWIS','UK');

INSERT INTO ORDERS VALUES(101,1,'ASWATHY','2023/10/02');
SELECT CURRENT_DATE();
INSERT INTO ORDERS VALUES(102,2,'DEVAN','2023/11/04');
SELECT CURRENT_DATE();
INSERT INTO ORDERS VALUES(103,3,'NANDA','2023/12/08');
SELECT CURRENT_DATE();


SELECT Title FROM BOOKS

SELECT Author_Name FROM AUTHORS

SELECT Order_id FROM ORDERS

ALTER TABLE BOOKS    
ADD GENRE INT;

ALTER TABLE ORDERS
ADD QUANTITY INT;

SELECT * FROM BOOKS

SELECT * FROM AUTHORS

SELECT * FROM ORDERS

SELECT DISTINCT Title FROM BOOKS 
SELECT DISTINCT Author_Name FROM AUTHORS;

SELECT BOOKS.*, AUTHORS.Author_Name, AUTHORS.Country
FROM BOOKS
JOIN AUTHORS ON BOOKS.Author_id = AUTHORS.Author_id;

SELECT ORDERS.*, BOOKS.Title, BOOKS.Price, BOOKS.genre, AUTHORS.Author_Name
FROM ORDERS
JOIN BOOKS ON ORDERS.Book_id = BOOKS.Book_id
JOIN AUTHORS ON BOOKS.Author_id = AUTHORS.Author_id;


