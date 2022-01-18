
1. Open cmd and type path =cd C:\Program Files\PostgreSQL\14\bin

2. psql --port=5433 --host=localhost --dbname=northwind --username=postgres
 
3. Enter Password
\l to view database list
\c databaseName  connect to database
\dn to view list of schemas
\dt schema name.*



SELECT * FROM customers;  

SELECT <column name> FROM <tablename>; 
SELECT categoryname,description FROM categories; 


SELECT DISTINCT<column name> FROM <tablename>; // AVOID doublicate values 
SELECT DISTINCT region FROM suppliers;


Both distinct & count
SELECT COUNT(DISTINCT <column name>) FROM <tablename>;
SELECT COUNT(DISTINCT productid) FROM order_details; 


SELECT COUNT <column name> FROM <tablename>; COUNT THE ROWS
SELECT COUNT(*) FROM orders; 


calculation
SELECT <column name >,<column1> + <column2> FROM <tablename>;
SELECT orderid,unitprice * quantity FROM order_details; 

Where   FIND TEXT
SELECT <column name> FROM <tablename> where <column name>='value';
SELECT companyname FROM suppliers WHERE city='Berlin'; 
SELECT companyname,contactname FROM customers WHERE country='Mexico';  	find same text 

WHERE FIND NUMBER
SELECT COUNT(*) FROM orders WHERE employeeid=3; 
SELECT COUNT(*) FROM orders WHERE freight>=250 ;

where date
SELECT COUNT(*) FROM orders WHERE shippeddate<'1997-07-05' ;



WHERE AND
SELECT <column name> FROM <tablename> WHERE condition1 AND condition2;
SELECT DISTINCT(customerid) FROM orders WHERE shipcountry='Brazil'AND shipvia=2;


WHERE OR
SELECT <column name> FROM <tablename> WHERE condition1 OR condition2;
SELECT COUNT(*) FROM suppliers WHERE country='Germany'OR country='Spain';
SELECT COUNT(*) FROM orders WHERE shipcountry='USA'OR shipcountry='Brazil'  OR shipcountry='Argentina';



WHERE NOT
SELECT <column name> FROM <tablename> WHERE NOT condition1 ;
SELECT COUNT(*) FROM customers WHERE NOT country='France' ;



WHERE AND NOT OR COMBINE
SELECT <column name> FROM <tablename> where (<condition1> AND <condition1>) OR <condition1>;
SELECT COUNT(*) FROM orders WHERE  shippeddate>'1997-05-01'AND(shipcountry='Canada' OR shipcountry='Spain');


where BETWEEN
where coluname BETWEEN 50 AND 100;
SELECT COUNT(*) FROM order_details WHERE  unitprice BETWEEN 10 and 20 ;
SELECT COUNT(*) FROM orders WHERE  shippeddate BETWEEN '1996-06-01' AND '1996-09-30' ;


IN
WHERE <coloname>IN(list)
SELECT COUNT(*) FROM suppliers WHERE  country IN ('Germany','France','Spain','Italy') ;

SCHEMA
SELECT * FROM <schemaName>.<tableName>;
SELECT * FROM purchasing.vendor;

ORDER BY
SELECT <COLNAME> FROM <TABLENAME> ORDER BY <COL1>,<COL2> ASC|DESC;
SELECT DISTINCT country FROM suppliers ORDER BY country ASC;
SELECT DISTINCT country,city FROM suppliers ORDER BY country ASC,city DESC;
SELECT DISTINCT productname,unitprice FROM products ORDER BY unitprice DESC,productname ASC;


MIN & MAX
SELECT MIN<column name> FROM <tablename> WHERE <condition>; 
SELECT MIN(orderdate)   FROM orders      where shipcountry='Italy';
SELECT MAX(shippeddate - orderdate) FROM orders WHERE shipcountry='France';

AVG AND SUM
SELECT AVG<column name> FROM <tablename> WHERE <condition>;
SELECT AVG(quantity)FROM order_details WHERE productid=35;


LIKE TO MATCH %a/a% _a%
SELECT <column name> FROM <tablename> WHERE <column> LIKE <PATTERN> %a/a%;
SELECT companyname FROM suppliers WHERE companyname LIKE '_or%'; 

RENAMER col
SELECT <col 1> AS alias_name FROM <tableName>
SELECT unitprice*unitsinstock AS TotalInventory FROM products ORDER BY TotalInventory DESC;

LIMIT
SELECT <column name> FROM <tablename>LIMIT number; 
SELECT productid,unitprice*quantity AS TotalCost FROM order_details ORDER BY TotalCost DESC LIMIT 3;

NULL
SELECT <column name> FROM <tablename> WHERE column IS NULL/IS NOT NULL;
SELECT COUNT(*)
FROM suppliers WHERE region IS NOT NULL;


                                                              JOIN
                                                           INNER JOIN
	 SELECT <column name> FROM table1   INNER JOIN table2 ON table1.colName=table2.colName;

	 SELECT companyname,orderdate,shipcountry
 	 FROM orders JOIN customers ON customers.customerid=orders.customerid;

	SELECT firstname,lastname,orderdate
	FROM employees JOIN orders ON employees.employeeid=orders.employeeid;	

							 multi INNER JOIN
	SELECT <column name> FROM table1   INNER JOIN table2 ON table1.colName=table2.colName
					   INNER JOIN table3 ON table3.colName=table1.colName;

	SELECT companyname,unitprice,orderdate,quantity
							FROM orders 
								JOIN order_details ON order_details.orderid=orders.orderid
								JOIN customers ON orders.customerid=customers.customerid;
	SELECT companyname,productname,orderdate,order_details.unitprice,quantity,categoryname
					FROM orders 
							JOIN order_details ON order_details.orderid=orders.orderid
							JOIN customers ON orders.customerid=customers.customerid
							JOIN products ON products.productid=order_details.productid
							JOIN categories ON products.categoryid=categories.categoryid
								 WHERE categoryname='Seafood' AND 
	 							 order_details.unitprice*quantity >=500;

									
									LEFT JOIN
		 SELECT <column name> FROM table1   LEFT JOIN table2 ON table1.colName=table2.colName;

			SELECT companyname,orderid
						FROM customers 
							LEFT JOIN orders ON orders.customerid=customers.customerid;
		SELECT productname,orderid
					FROM products 
						     LEFT JOIN order_details ON order_details.productid=products.productid
							WHERE orderid IS NULL;

				
								RIGHT JOINS 
						 (pull all record from right table/2nd table)
			SELECT <column name> FROM table1   RIGHT JOIN table2 ON table1.colName=table2.colName;

						SELECT companyname,orderid
								FROM orders 
									RIGHT JOIN customers ON orders.customerid=orders.customerid;

			SELECT companyname,customercustomerdemo.customerid
							FROM customercustomerdemo  
										RIGHT JOIN customers ON customers.customerid=customercustomerdemo.customerid;


									FULL JOIN
					SELECT <column name> FROM table1   FULL JOIN table2 ON table1.colName=table2.colName;

					SELECT companyname,orderid FROM customers FULL JOIN orders ON customers.customerid=orders.customerid;
					SELECT productname,categoryname FROM products FULL JOIN categories ON categories.categoryid=products.categoryid;

							
									SELF JOIN
				select colName FROM table AS T1 JOIN table AS t2 USING T1.col=t2=col WHERE condition

SELECT c1.companyname AS CustomerName1,c2.companyname AS CustomerName2,c1.city FROM customers AS c1 JOIN customers AS c2 ON c1.city = c2.city WHERE c1.customerid <> c2.customerid
 							ORDER BY c1.city;
SELECT s1.companyname AS supplierName1,s2.companyname AS supplierName2,s1.city
FROM suppliers AS s1
JOIN suppliers AS s2 ON s1.country = s2.country
WHERE s1.supplierid <> s2.supplierid
ORDER BY s1.country;


											JOIN
								SELECT * FROM TABLE1 JOIN TABLE2 USING (common col);
						SELECT *FROM orders JOIN order_details USING (orderid)
								    JOIN products USING (productid);
					
											NATURAL JOIN
									FROM table1 NATURAL 
									JOIN table2

									SELECT * FROM orders NATURAL JOIN order_details;
									SELECT * FROM customers  NATURAL JOIN orders
												 NATURAL JOIN order_details;
SELECT productname ,SUM(order_details.unitprice*quantity)
FROM products
JOIN order_details ON products.productid=order_details.productid
JOIN orders ON orders.orderid=order_details.orderid
WHERE orderdate BETWEEN '1997-01-01'AND '1997-12-31'
GROUP BY productname
ORDER BY SUM(order_details.unitprice*quantity) DESC



HAVING

SELECT colName FROM table WHERE conditione GROUP BY colName HAVING condition ORDER BY colName

SELECT productname ,SUM(order_details.unitprice*quantity) AS amountBought
FROM products
JOIN order_details USING (productid)
GROUP BY productname
HAVING SUM(order_details.unitprice*quantity)<2000
ORDER BY amountBought ASC;


SELECT companyname ,SUM(order_details.unitprice*quantity) AS amountBought
FROM customers
NATURAL JOIN orders
NATURAL JOIN order_details
GROUP BY companyname
HAVING SUM(order_details.unitprice*quantity)>5000
ORDER BY amountBought DESC;



GROUP BY GROUP SETS

SELECT categoryname,productname,SUM(od.unitprice*quantity)
FROM categories
NATURAL JOIN products
NATURAL JOIN order_details AS od
GROUP BY GROUPING SETS ((categoryname),(categoryname,productname))
ORDER BY categoryname,productname;


SELECT c.companyname AS buyer,s.companyname AS supplier,SUM(od.unitprice*quantity)
FROM customers AS c
NATURAL JOIN orders
NATURAL JOIN order_details AS od
JOIN products USING (productid)
JOIN suppliers AS s USING (supplierid)
GROUP BY GROUPING SETS ((buyer),(buyer,supplier))
ORDER BY buyer,supplier;

SELECT companyname,categoryname,SUM(od.unitprice*quantity)
FROM customers AS c
NATURAL JOIN orders
NATURAL JOIN order_details AS od
JOIN products USING (productid)
JOIN categories AS s USING (categoryid)
GROUP BY GROUPING SETS ((companyname),(companyname,categoryname))
ORDER BY companyname,categoryname NULLS FIRST;



ROLL UP 

SELECT c.companyname,categoryname,productname,SUM(od.unitprice*quantity)
FROM customers AS c 
NATURAL JOIN orders
NATURAL JOIN order_details AS od
JOIN products USING (productid)
JOIN categories USING (categoryid)
GROUP BY ROLLUP (companyname,categoryname,productname)

SELECT c.companyname,categoryname,productname,SUM(od.unitprice*quantity)
FROM customers AS c 
NATURAL JOIN orders
NATURAL JOIN order_details AS od
JOIN products USING (productid)
JOIN categories USING (categoryid)
GROUP BY ROLLUP (companyname,categoryname,productname)
ORDER BY  companyname,categoryname,productname


SELECT s.companyname AS supplier,c.companyname AS buyer,productname,SUM(od.unitprice*quantity)
FROM suppliers AS s 
JOIN products USING (supplierid)
JOIN order_details AS od USING (productid)
JOIN orders USING (orderid)
JOIN customers AS c USING (customerid)
GROUP BY ROLLUP (supplier,buyer,productname)
ORDER BY supplier,buyer,productname


CUBE (a,b,c) (a,b) (a,c) (a)

SELECT s.companyname AS supplier, c.companyname AS buyer,productname, SUM(od.unitprice*quantity)
FROM suppliers AS s
JOIN products USING (supplierid)
JOIN order_details AS od USING (productid)
JOIN orders USING (orderid)
JOIN customers AS c USING (customerid)
GROUP BY CUBE(supplier, buyer, productname)
order by supplier NULLS FIRST, buyer NULLS FIRST, productname NULLS FIRST

SELECT c.companyname,categoryname,productname,SUM(od.unitprice*quantity)
FROM customers AS c
NATURAL JOIN orders
NATURAL JOIN order_details AS od
JOIN products USING (productid)
JOIN categories  USING (categoryid)
GROUP BY CUBE (companyname, categoryname, productname);

SELECT s.companyname AS supplier, c.companyname AS buyer,productname, SUM(od.unitprice*quantity)
FROM suppliers AS s
JOIN products USING (supplierid)
JOIN order_details AS od USING (productid)
JOIN orders USING (orderid)
JOIN customers AS c USING (customerid)
GROUP BY CUBE(supplier, buyer, productname);




                                        UNION  no copy record 

      SELECT colname FROM tableName     UNION     SELECT colname FROM tableName
      SELECT companyname FROM customers UNION     SELECT companyname FROM suppliers
      SELECT country     FROM customers UNION     SELECT country     FROM suppliers ORDER BY country DESC



					UNION ALL  copy record
      SELECT colname FROM tableName     UNION ALL    SELECT colname FROM tableName
      SELECT city    FROM customers     UNION ALL    SELECT city    FROM suppliers
      SELECT country FROM customers     UNION ALL    SELECT country FROM suppliers ORDER BY country DESC

                                  
                                   SUBQUERIES INTERSECT
            
            SELECT colname FROM tableName      INTERSECT     SELECT colname FROM tableName
	    SELECT country FROM customers      INTERSECT     SELECT country FROM suppliers


					INTERSECT ALL    

     SELECT colname FROM tableName      INTERSECT ALL     SELECT colname FROM tableName
     SELECT country FROM customers      INTERSECT ALL     SELECT country FROM suppliers
SELECT COUNT(*) FROM
     (SELECT country FROM customers     INTERSECT ALL     SELECT country FROM suppliers)as together 


						EXCEPT
              
              SELECT colname FROM tableName     EXCEPT   SELECT colname FROM tableName
	      SELECT country FROM customers     EXCEPT   SELECT country     FROM suppliers

				                EXCEPT ALL
              
              SELECT colname FROM tableName     EXCEPT ALL SELECT colname FROM tableName
	      SELECT country FROM customers     EXCEPT ALL SELECT country FROM suppliers
SELECT COUNT(*) FROM
             (SELECT country FROM customers     EXCEPT ALL SELECT country FROM suppliers)as together
SELECT COUNT(*) FROM
             (SELECT city    FROM customers     EXCEPT ALL SELECT city FROM suppliers)as together





					          EXISTS

	   SELECT colName FROM table WHERE        EXISTS    (SELECT colName FROM tableName WHERE condition)

           SELECT companyname FROM customers WHERE EXISTS (SELECT customerid FROM orders
			                                  WHERE orders.customerid=customers.customerid AND
			                                  orderdate BETWEEN '1997-04-01'AND '1997-04-30')
	   
	  SELECT productname FROM products WHERE NOT EXISTS (SELECT productid FROM order_details
							  JOIN orders ON orders.orderid=order_details.orderid
				 			  WHERE order_details.productid=products.productid AND
			 				  orderdate BETWEEN '1997-04-01'AND '1997-04-30')

	SELECT companyname FROM suppliers WHERE  EXISTS (SELECT productid FROM products
				          WHERE  products.supplierid=suppliers.supplierid AND
			                         unitprice>200)

	SELECT companyname FROM suppliers WHERE NOT EXISTS (SELECT products.productid FROM products
			       JOIN order_details ON order_details.productid=products.productid
				JOIN orders ON orders.orderid=order_details.orderid 
			                   WHERE  products.supplierid=suppliers.supplierid AND
			                   orderdate BETWEEN '1996-12-01' AND '1996-12-31')




							 ANY
		
	SELECT colName FROM tableName WHERE col operator ANY  (SELECT colName FROM tablName WHERE condition)

SELECT companyname FROM customers WHERE customerid =ANY (SELECT customerid FROM orders
			                           JOIN order_details ON order_details.orderid=orders.orderid
				                   WHERE quantity>50)

SELECT companyname FROM suppliers WHERE supplierid = ANY (SELECT products.supplierid FROM order_details
			                             JOIN products ON products.productid=order_details.productid
				                     WHERE quantity=1)


   							
							  ALL
								
	SELECT colName FROM tableName WHERE col operator  ALL   (SELECT colName FROM tablName WHERE condition)

	SELECT DISTINCT productname FROM products
					JOIN order_details ON products.productid=order_details.productid
					WHERE order_details.unitprice*quantity> ALL
			  		 (SELECT AVG(order_details.unitprice*quantity)FROM order_details
					GROUP BY productid);

SELECT DISTINCT companyname FROM customers JOIN orders ON orders.customerid=customers.customerid
                                           JOIN order_details ON orders.orderid=order_details.orderid
                                           WHERE order_details.unitprice*quantity> ALL
			                  (SELECT AVG(order_details.unitprice*quantity)FROM order_details
				          JOIN orders ON orders.orderid=order_details.orderid
				          GROUP BY orders.customerid);


							IN
                
                SELECT colName FROM table WHERE colName IN (SELECT statement)
           SELECT  companyname FROM  suppliers WHERE city IN (SELECT city FROM customeers)


							INSERT
                         
                  INSERT INTO tableName (col1,col2,col3) VALUES(value1,value2,value3)

INSERT INTO orders (orderid,customerid,employeeid,orderdate,requireddate,shipvia,freight,shipname,shipaddress,shipcity,shippostalcode,shipcountry)
            VALUES(11078,'VINET',4,'2017-09-16','2017-09-30',3,42.5,'Vins et alcools Chevalier','59 rue de l''Abbaye','Reims','51100','France' )

INSERT INTO order_details (orderid,productid,unitprice,quantity,discount)
		    VALUES(11078,11,14,20,0);



						UPDATE

			UPDATE tableName SET col1,col2,col3  WHERE condition;
	
			UPDATE orders SET requireddate='2017-09-20',freight=50 WHERE orderid=11078;
              
                      UPDATE order_details SET quantity=40,discount=.05 WHERE orderid=11078 AND productid=11;



						DELETE
                                   DELETE tableName WHERE condition

                     DELETE FROM order_details WHERE orderid=11078 AND productid=11;
		     DELETE FROM orders        WHERE orderid=11078;


						SELECT INTO
		SELECT col1,col2  INTO    new_table              FROM   old_table   WHERE condtion
		SELECT *          INTO    suppliers_northamerica FROM   suppliers   WHERE country IN ('USA','Canada')
		SELECT *          INTO    order_1997             FROM   orders      WHERE orderdate BETWEEN '1997-01-01' AND '1997-12-31'


						
						INSERT INTO SELECT

INSERT INTO suppliers_northamerica SELECT * FROM suppliers WHERE country IN ('Brazil','Argentina')
INSERT INTO order_1997  SELECT * FROM orders WHERE orderdate BETWEEN '1996-12-01' AND '1996-12-31'


                                                 INSERT RETURNING
INSERT INTO table      (col1,col2..)    VALUES     (value1,value2)   RETURNING id

INSERT INTO employees (firstname,lastname,title,employeeid,reportsto)        VALUES     ('BOB','Smith','Mr Big',50,2) RETURNING employeeid
INSERT INTO orders (customerid,employeeid,requireddate,shippeddate,orderid)  VALUES  ('VINET',5,'1996-08-01','1996-08-10',500) RETURNING employeeid,orderid


							UPDATE RETURNING
UPDATE products SET unitprice = unitprice*1.2 WHERE productid=1  RETURNING productid,unitprice AS newPrice
UPDATE order_details SET quantity = quantity*2 WHERE orderid=10248  RETURNING quantity AS newquantity


							DELETE RETURNING
					DELETE FROM employees WHERE employeeid=50 RETURNING *
		                        DELETE FROM orders WHERE orderid=500 RETURNING *


								INDEXES/UNIQUE
						
				CREATE INDEX indexName ON tableName (col1...);   CREATE UNIQUE INDEX indexName ON tableName (col1...);
     
						CREATE UNIQUE INDEX idx_employees_employeeid ON employees(employeeid);
						
						CREATE INDEX idx_orders_customerid_orderid ON orders(customerid,orderid)

								DROP INDEX

							DROP INDEX indexName
						 DROP INDEX idx_employees_employeeid;



								KILL RUNAWAY
					SELECT * FROM pg_stat_activity WHERE STATE ='active';
					SELECT pg_cancel_backend(PID);
					SELECT pg_terminate_backend(PID);

EXPLAIN 
DROP TABLE IF EXISTS performance_test;
CREATE TABLE performance_test(
id serial,location text
);


INSERT INTO performance_test (location) SELECT md5(random()::text) FROM generate_series(1,10000000)
EXPLAIN SELECT COUNT(*) FROM performance_test;
EXPLAIN SELECT * FROM performance_test WHERE id=2000000;
CREATE INDEX idx_performance_test_id ON performance_test (id);



ANALYZE 
DROP TABLE IF EXISTS performance_test;
CREATE TABLE performance_test(
id serial,location text
);


INSERT INTO performance_test (location) SELECT md5(random()::text) FROM generate_series(1,10000000)

EXPLAIN ANALYZE SELECT COUNT(*) FROM performance_test;
EXPLAIN ANALYZE SELECT * FROM performance_test WHERE id=2000000;

ANALYZE performance_test;


QUERY PLAN COST calculated

Number of relation pages * seq_page_cost
+
Number of rows* cpu_tuple_cost + Number of rows *cpu_operator_cost

SET max_parallel_workers_per_gather=0;
EXPLAIN SELECT * FROM performance_test WHERE location like 'ab%'
select pg_relation_size('performance_test'),pg_size_pretty(pg_relation_size('performance_test'))

select relpages from pg_class where relname='performance_test'
select relpages,pg_relation_size('performance_test')/8192 from pg_class where relname='performance_test'
SHOW seq_page_cost;

Total Predicted I/O Costs

SELECT relpages* current setting('seq_page_cost')::integer A

FROM pg_class

WHERE relname='performance_test'
select relpages*current_setting('seq_page_cost')::numeric from pg_class where relname='performance_test'



CPU Costs Depends On Rows Processed

How To Find Rows In Table:

SELECT reltuples

FROM pg_class

WHERE relname='performance_test';




 		CREATING ANOTHER COLULMN
ALTER TABLE
ALTER TABLE performance_test ADD COLUMN name text;
UPDATE performance_test SET name = md5(location);

ALTER TABLE performance_test ADD COLUMN name text;
UPDATE performance_test SET name=md5(location);

EXPLAIN ANALYZE SELECT * FROM performance_test WHERE location like 'df%' AND name LIKE 'cf%'

CREATE INDEX idx_prformance_test_location_name ON performance_test (location,name) 



Functions Prevent Index Usage

EXPLAIN select *

from production.product WHERE name LIKE 'Flat%':

Versus

EXPLAIN select *

from production.product

WHERE UPPER(NAME) LIKE UPPER('Flat %'):



                 INDEX TYPE
 CREATE INDEX name ON USING type_index(field)


1.CREATE EXTENSION pg_trgm;


			CREATE TABLE
CREATE TABLE tableName(col1 datatype,..)NUMERIC,VARCHAR,serial,date,timestamp,time,


CREATE TABLE subcribers(
firstname varchar(200),
lastname varchar(200),
email varchar(250),
signupdate timestamp,
frequency integer,
iscustomer boolean	
)



CREATE TABLE returns(
	returnid serial,
	customerid char(5),
	datereturn timestamp,
	productid int,
	quantity smallint,
	orderid integer
)	




						ALTER TABLE
RENAME COL NAME
ALTER TABLE table_name RENAME OLD_colName TO NEW_colName;
ALTER TABLE subcribers RENAME firstname   TO first_Name;

RENAME TABLE
ALTER TABLE OLD_TableName TO NEW_TableName 
ALTER TABLE public.subcribers RENAME TO Email_subcribers;

ADD COLUMN 
ALTER TABLE table_name ADD COLUMN  colName datatype;
ALTER TABLE public.email_subcribers ADD COLUMN last_visit_date timestamp;

DELETE COLUMN
ALTER TABLE table_name DROP COLUMN colName;
ALTER TABLE public.email_subcribers DROP COLUMN last_visit_date;

CHANGE DATA TYPE
ALTER TABLE table_Name ALTER COLUMN col_Name SET DATA TYPE datatype
ALTER TABLE public.email_subcribers ALTER COLUMN email SET DATA TYPE varchar(255);


Types Of Constraints

  NAME                                                                                    SYSTAX                                                                      
NOT NULL     :Field must have a value                                :  CREATE TABLE  table_name colName datatype NOT NULL; ALTER TABLE table_name ALTER colName SET NOT NULL;                    CREATE TABLE practices( practiceid integer NOT NULL);   ALTER TABLE products ALTER unitprice SET NOT NULL;  

UNIQUE       :Value must not already be in table                     : CREATE TABLE  table_name colName datatype UNIQUE   ;   ALTER TABLE tableName ADD CONSTRAINT CONSTRAINTName  UNIQUE (colName)          ALTER TABLE region ADD CONSTRAINT regiondescription_region UNIQUE (regiondescription);

PRIMARY KEY  :Must have value and be unique, used to identify record : CREATE TABLE  table_name colName datatype PRIMARY KET; ALTER TABLE table_name ADD PRIMARY KEY (colName);  ALTER TABLE table_name DROP CONSTRAINT COL_pkey;  

FOREIGN KEY :All values must exist in another table                  : CREATE TABLE table_name (colName datatype,... FOREIGN KEY (colName)REFERENCES tabl2(colName));                                                                CREATE TABLE practices(practiceid integer PRIMARY KEY,practicefield  varchar(50) NOT NULL,employeeid integer NOT NULL,FOREIGN KEY (employeeid) REFERENCES employees (employeeid));        ALTER TABLE table_name ADD CONSTRAINT constraingt_Name FOREIGN KEY (col) REFERENCES  table2 (col);           ALTER TABLE table_name DROP CONSTRAINT constraingt_Name;

CHECK       :Checks that all values meet condition                   :CREATE TABLE table_Name (colName datatype... CONSTRAINT NAME CHECK (condition),...,CONSTRAINT NAME CHECK (condition))     cost integer CONSTRAINT practice_cost CHECK (cost >=0 AND cost <= 1000),  ALTER TABLE ADD CONSTRAINT conName Checks (conition)  ALTER TABLE DROP CONSTRAINT conName;

DEFAULT     :If no value provided, value is set to the default       :CREATE TABLE table_name (colName Datatype DEFAULT value/function...)   ALTER TABLE tableName ALTER COLUMN colName SET DEFAULT value;    ALTER TABLE tableName ALTER COLUMN colName DROP DEFAULT ;







CREATE SeQuence
CREATE SEQUENCE IF NOT EXISTS name
SELECT nextval('sequenceName');
SELECT currval('sequenceName');
SELECT lastval()

// set value but next value will increment 
SELECT setval('test_sequence',14) 
SELECT nextval('test_sequence')

// set value and next value will be what you set 
SELECT setval('test_sequence'.25,false)
 SELECT nextval('test_sequence')


Control The Spacing Of Values

CREATE SEQUENCE IF NOT EXISTS test_sequence2 INCREMENT 5



Full Control

CREATE SEQUENCE IF NOT EXISTS test sequence_3

INCREMENT 50

MINVALUE 350

MAXVALUE 5000

START WITH 550


Attaching Sequence To A Field

CREATE SEQUENCE name OWNED BY table_name.column_name



SELECT MAX(employeeid) FROM employees

CREATE SEQUENCE IF NOT EXISTS employees_employeeid_seq START WITH 10 OWNED BY employees.employeeid

1.SELECT MAX(employeeid) From employees


2.CREATE SEQUENCE IF NOT EXISTS employees_employeeid_seq 
  START WITH 10 OWNED BY employees.employeeid

3. ALTER TABLE employees ALTER COLUMN employeeid SET DEFAULT nextval ('employees_employeeid_seq')

4. INSERT INTO employees (lastname,firstname,title,reportsto) VALUES ('smith','BOB','Assistant',2)

5. ALTER TABLE employees

6.SELECT * FROM employees


Use RETURNING syntax on insert statement

INSERT INTO users (name,age) VALUES ('Liszt, 101 RETURNING id

INSERT INTO employees (lastname,firstname,title,reportsto) VALUES ('smith','BOB','Assistant',2)RETURNING employeeid;


         ALTER SEQUENCE
ALTER SEQUENCE name RESTART WITH start    ALTER SEQUENCE employees_employeeid_seq RESTART with 1000

ALTER SEQUENCE name RENAME TO new_name    ALTER SEQUENCE public.test_sequence RENAME TO test_sequence_1



            DROP SEQUENCE
  DROP SEQUENCE name      DROP SEQUENCE public.test_sequence_1


SERIAL 
CREATE TABLE tableName(colName DataType SERIAL,..)



             			VIEWS

CREATE VIEW view_name AS SELECT statement

CREATE VIEW customer_order_details AS
SELECT companyname, Orders.customerid, employeeid, requireddate, shippeddate, shipvia, freight, shipname, shipcity, shipregion, shippostalcode, shipcountry,
order_details. *
FROM customers
JOIN orders ON customers.customerid=orders.customerid
JOIN order_details ON orders.orderid=order_details.orderid

SELECT * FROM customer_order_details WHERE customerid='TOMSP'



CREATE VIEW supplier_order_details AS
SELECT companyname, suppliers.supplierid, Products.productid, productname,
Order_details.unitprice, quantity, discount, orders.*
FROM suppliers
JOIN products ON suppliers.supplierid=products.supplierid
JOIN order_details ON order_details.productid=products.productid
JOIN orders ON order_details.orderid=orders.orderid;

SELECT *  FROM supplier_order_details WHERE supplierid=5;



					REPLACE VIEWS

CREATE OR REPLACE VIEW viewName AS SELECT query

RENAME VIEW
ALTER VIEW old_name RENAME new_Name   
ALTER VIEW public.customer_order_details RENAME TO customer_order_detailed


										






									CREATEING UPDATE VIEW
CREATE VIEW north_america_customers AS
SELECT *
FROM customers
WHERE country in ('USA','Canada','Mexico');

INSERT INTO north_america_customers
(customerid,companyname,contactname,contacttitle,address,city,region,postalcode,country,phone,fax)
VALUES ('CFDCM','Catfish Dot Com','Will Bunker','President','Old Country Road','Lake Village','AR','71653','USA','555-555-5555',null);

UPDATE north_america_customers SET fax='555-333-4141' WHERE customerid='CFDCM';

DELETE FROM north_america_customers WHERE customerid='CFDCM';




CREATE VIEW protein_products AS
SELECT * FROM products
WHERE categoryid in (4,6,8);

INSERT INTO protein_products
(productid,productname,supplierid,categoryid,discontinued)
VALUES (78,'Kobe Beef',12,8,0);

UPDATE protein_products SET unitprice=55 WHERE productid=78;

DELETE FROM protein_products WHERE productid=78;



                                                        CHECK OPTION

INSERT INTO north_america_customers
(customerid,companyname,contactname,contacttitle,address,city,region,postalcode,country,phone,fax)
VALUES ('CFDCM','Catfish Dot Com','Will Bunker','President','Old Country Road','Lake Village','AR','71653','Germany','555-555-5555',null);

SELECT FROM north_america_customers
WHERE customerid=’CFDCM’;

CREATE OR REPLACE VIEW north_america_customers  AS
SELECT *
FROM customers
WHERE country in ('USA','Canada','Mexico')
WITH LOCAL CHECK OPTION;

INSERT INTO north_america_customers
(customerid,companyname,contactname,contacttitle,address,city,region,postalcode,country,phone,fax)
VALUES ('CFDCM','Catfish Dot Com','Will Bunker','President','Old Country Road','Lake Village','AR','71653','Germany','555-555-5555',null);

CREATE OR REPLACE VIEW protein_products AS
SELECT * FROM products
WHERE categoryid in (4,6,8)
WITH LOCAL CHECK OPTION;

INSERT INTO protein_products
(productid,productname,supplierid,categoryid,discontinued)
VALUES (78,'Tasty Tea',12,1,0);



											DELETE VIEW

DROP VIEW viewName; DROP VIEW IF EXISTS viewName


											CASE WHEN

SELECT COMPANYNAME,COUNTRY ,
CASE WHEN country IN('Austria', 'Germany', 'Poland') THEN 'Europe'
     WHEN country IN('Mexico', 'USA', 'Canada') THEN 'North America'
     WHEN country IN ('Brazil', 'Venezuala', 'Argentina') THEN 'South America'
   ELSE 'unknown'
   END AS continent
FROM CUSTOMERS;


SELECT PRODUCTNAME,unitprice, CASE WHEN unitprice<10 THEN 'INEXPENCIVE'
			WHEN unitprice >=10 AND unitprice<=50 THEN 'MID-RANGE'
			WHEN unitprice >50 THEN 'PRIMIUM'
			END AS QULITY
FROM PRODUCTS;


SELECT companyname,
               CASE city WHEN 'New Orleans' THEN 'Big Easy'
                         WHEN 'Paris' THEN 'City of Light'
		  ELSE city
		  END
		  FROM suppliers



SELECT orderid, customerid,
CASE date_part('year', orderdate
           	WHEN 1996 THEN 'year1'
		WHEN 1997 THEN 'year2'
		WHEN 1998 THEN 'year3'
ELSE unknown'
END
FROM orders


COALESCE FUNCTION

SELECT customerid, COALESCE (shipregion,'N/A' )
FROM ORDERS

SELECT companyname, COALESCE
 (homepage,'Call to find' )
FROM suppliers

										NULLIf
SELECT companyname ,phone,COALESCE (NULLIF(homepage,''),'Need to call') From suppliers
SELECT companyname ,COALESCE (NULLIF(fax,''),phone)AS confirmation  From customers

					

									DATE TIME TImESTAMP

SHOW DATESTYLE
SET DATESTYLE='ISO,DMY'

SELECT LOCALTIME AT TIME ZONE 'UTC-5:30';
SELECT LOCALTIME;


CREATE TABLE test_time
( startdate DATE,
 startstamp TIMESTAMP,
 starttime TIME)

insert into test_time(startdate,startstamp,starttime)
values (current_date,current_timestamp,current_time);
select *from test_time


						TIME ZONE LIST


SELECT * FROM pg_timezone_names;

SELECT * FROM  pg_timezone_abbrevs;

ALTER TABLE test_time
ADD COLUMN endstamp TIMESTAMP WITH TIME ZONE;

ALTER TABLE test_time
ADD COLUMN endtime TIME WITH TIME ZONE;


INSERT INTO test_time
(endstamp,endtime)
VALUES ('01/20/2018 10:30:00 US/Pacific', '10:30:00+5');
INSERT INTO test_time (endstamp,endtime)
VALUES ('06/20/2018 10:30:00 US/Pacific', '10:30:00+5');

//Notice the difference in offset due to daylight savings time
SELECT * FROM test_time;


SHOW TIME ZONE;
//notice the offset of time
SELECT * FROM test_time;

SET TIME ZONE 'US/Pacific'

//notice offset changed
SELECT * FROM test_time;
					

						INTERNAL DATA TYPE

ALTER TABLE test_time
ADD COLUMN span interval;

DELETE  FROM test_time;

--Postgres Format
INSERT INTO test_time (span)
VALUES ('5 DECADES 3 YEARS, 6 MONTHS 3 DAYS');
INSERT INTO test_time (span)
VALUES ('5 DECADES 3 YEARS, 6 MONTHS 3 DAYS ago');

SELECT * FROM test_time;

--SQL Standard
INSERT INTO test_time (span)
VALUES ('4 32:12:10');

INSERT INTO test_time (span)
VALUES ('1-2');


--ISO 8061 Format
INSERT INTO test_time (span)
VALUES (‘P5Y3MT7H3M’)

INSERT INTO test_time (span)
VALUES ('P25-2-30T17:33:10');

SHOW intervalstyle;
SELECT * FROM test_time;

SET intervalstyle='postgres_verbose';
SELECT * FROM test_time;

SET intervalstyle='sql_standard';
SELECT * FROM test_time;

SET intervalstyle='iso_8601';
SELECT * FROM test_time;

SET intervalstyle='postgres';


					DATE ARTHAMETIC
SELECT DATE '2018-09-28' + INTERVAL '5 days 1 hour';

SELECT TIME '5:30:10' + INTERVAL '70 minutes 80 seconds';

SELECT TIMESTAMP '1917-06-20 12:30:10.222' +
  INTERVAL '30 years 6 months 7 days 3 hours 17 minutes 3 seconds';

SELECT INTERVAL '5 hours 30 minutes 2 seconds' +
      INTERVAL '5 days 3 hours 13 minutes';

SELECT DATE '2017-04-05' +  INTEGER '7';

-- subtracting intervals from date,time, timestamp
SELECT DATE '2018-10-20' - INTERVAL '2 months 5 days';

SELECT TIME '23:39:17' - INTERVAL '12 hours 7 minutes 3 seconds'

SELECT TIMESTAMP '2016-12-30' - INTERVAL '27 years 3 months 17 days 3 hours 37 minutes';

-- subtracting integer from date
SELECT DATE '2016-12-30' - INTEGER '300';

--subtracting 2 dates
SELECT DATE '2016-12-30' - DATE '2009-04-7';

-- subtracting 2 times and 2 timestamps
SELECT TIME '17:54:01' - TIME '03:23:45';

SELECT TIMESTAMP '2001-02-15 12:00:00' - TIMESTAMP '1655-08-30 21:33:05';

--Multiply and divide intervals
SELECT 5 * INTERVAL '7 hours 5 minutes';

SELECT INTERVAL '30 days 20 minutes' / 2;

SELECT age(TIMESTAMP '2025-10-03', TIMESTAMP '1999-10-03');
SELECT age (TIMESTAMP '1969-04-20');






				PULLING OUT DATEs AND TIME

SELECT EXTRACT(YEAR FROM age(birthdate)),firstname, lastname
FROM employees;

SELECT date_part('day', shippeddate)
FROM orders;

SELECT EXTRACT(DECADE FROM age(birthdate)),firstname, lastname
FROM employees;

SELECT date_part('DECADE',age(birthdate)),firstname, lastname
FROM employees;



					CONVERTING DATA TYPE 

SELECT hiredate::TIMESTAMP
FROM employees;

SELECT CAST(hiredate AS TIMESTAMP)
FROM employees;

SELECT (ceil(unitprice*quantity))::TEXT || ' dollars spent'
FROM order_details;

SELECT CAST('2015-10-03' AS DATE),  375::TEXT;


						BASIC WINDOWS

SELECT companyname, orderid, amount , average_order FROM
( SELECT companyname, orderid, amount ,AVG(amount) OVER (PARTITION BY companyname) AS average_order
FROM
(SELECT companyname,orders.orderid,SUM(unitprice*quantity) AS amount
FROM customers
JOIN orders ON orders.customerid=customers.customerid
JOIN order_details ON orders.orderid=order_details.orderid
GROUP BY companyname,orders.orderid) as order_amounts) as order_averages
WHERE amount > 5 * average_order
ORDER BY companyname



SELECT categoryname,productname,unitprice,
AVG(unitprice) OVER (PARTITION BY categoryname)
FROM products
JOIN categories ON categories.categoryid=products.categoryid

SELECT productname,quantity,
AVG(quantity) OVER (PARTITION BY order_details.productid)
FROM products
JOIN order_details on order_details.productid = products.productid
WHERE productname='Alice Mutton'

SELECT productname,orderid,quantity,
AVG(quantity) OVER (PARTITION BY order_details.productid) AS average
FROM products
JOIN order_details on products.productid=order_details.productid


					USING WINDOW FUNCTION WITH SUBQUERIES

SELECT companyname, orderid, amount , average_order FROM
( SELECT companyname, orderid, amount ,AVG(amount) OVER (PARTITION BY companyname) AS average_order
FROM
(SELECT companyname,orders.orderid,SUM(unitprice*quantity) AS amount
FROM customers
JOIN orders ON orders.customerid=customers.customerid
JOIN order_details ON orders.orderid=order_details.orderid
GROUP BY companyname,orders.orderid) as order_amounts) as order_averages
WHERE amount > 5 * average_order
ORDER BY companyname

SELECT companyname,month,year,total_orders,average_monthly
FROM (
SELECT companyname,total_orders,month,year,
AVG(total_orders) OVER (PARTITION BY companyname) as average_monthly
FROM (
SELECT companyname,SUM(quantity) as total_orders,date_part('month',orderdate) as month,date_part('year',orderdate) as year
FROM order_details
JOIN products ON order_details.productid = products.productid
JOIN suppliers ON suppliers.supplierid=products.supplierid
JOIN orders ON orders.orderid=order_details.orderid
GROUP BY companyname,month,year)  as order_by_month) as average_monthly
WHERE total_orders > 3 * average_monthly





					USING RANK() TO FIND FIRST N RECOREDS IN JOIN

SELECT * FROM
(SELECT orders.orderid, productid, unitprice, quantity,
 	rank() OVER (PARTITION BY order_details.orderid ORDER BY (quantity*unitprice) DESC) AS rank_amount
FROM orders
NATURAL JOIN order_details) as ranked
WHERE rank_amount <=2;

SELECT companyname,productname,unitprice FROM
(SELECT companyname,productname,unitprice,
rank() OVER (PARTITION BY products.supplierid ORDER BY unitprice ASC) AS price_rank
FROM suppliers
NATURAL JOIN products) as ranked_products
WHERE price_rank <=3;


					COMPOSITE TYPE

CREATE TYPE address AS (
	street_address 	varchar(50),
	street_address2 varchar(50),
	city			varchar(50),
	state_region	varchar(50),
	country			varchar(50),
	postalcode		varchar(15)
);

CREATE TABLE friends (
	first_name varchar(100),
	last_name varchar(100),
	address	address
);

DROP TYPE address CASCADE;
DROP TABLE friends;


CREATE TYPE address AS (
	street_address 	varchar(50),
	street_address2 varchar(50),
	city			varchar(50),
	state_region	varchar(50),
	country			varchar(50),
	postalcode		varchar(15)
);

CREATE TYPE full_name AS (
	first_name varchar(50),
	middle_name varchar(50),
	last_name varchar(50)
);

CREATE TABLE friends (
	name full_name,
	address	address
);

DROP TYPE address CASCADE;
DROP TYPE full_name CASCADE;
DROP TABLE friends;



					USING COMPOSITE TYPE

CREATE TYPE address AS (
	street_address 	varchar(50),
	street_address2 varchar(50),
	city			varchar(50),
	state_region	varchar(50),
	country			varchar(50),
	postalcode		varchar(15)
);

CREATE TYPE full_name AS (
	first_name varchar(50),
	middle_name varchar(50),
	last_name varchar(50)
);

CREATE TYPE dates_to_remember AS (
  birthdate date,
  age       integer,
  anniversary date
);

CREATE TABLE friends (
	name full_name,
	address	address,
  specialdates dates_to_remember
);

INSERT INTO friends (name, address, specialdates)
VALUES (ROW('Boyd','M','Gregory'),ROW('7777','','Boise','Idaho','USA','99999'),ROW('1969-02-01',49,'2001-07-15'));

SELECT * FROM friends;
SELECT name FROM friends;

SELECT (address).city,(specialdates).birthdate
FROM friends;

SELECT name FROM friends
WHERE (name).first_name = 'Boyd';

SELECT (address).state_region,(name).middle_name,(specialdates).age FROM friends
WHERE (name).last_name = 'Gregory';


							
	
							DECLARING ARRAY

DROP TABLE IF EXISTS friends;


CREATE TABLE friends (
    name full_name,
    address address,
    specialdates dates_to_remember,
    children varchar(50) ARRAY
);

DROP TABLE IF EXISTS salary_employees;

CREATE TABlE salary_employees (
    name text,
    pay_by_quarter integer[4],
	schedule text[][]
)


							INPUTING ARRAY Values

INSERT INTO friends (name, address, specialdates, children)
VALUES (ROW('Boyd','M','Gregory'),
		ROW('7777','','Boise','Idaho','USA','99999'),
		ROW('1969-02-01',49,'2001-07-15'),
	   '{"Austin","Ana Grace"}');

 INSERT INTO friends (name, address, specialdates, children)
 VALUES (ROW('Scott','X','Levy'),
 		ROW('357 Page Road','','Austin','TX','USA','88888'),
 		ROW('1972-03-01',46,'2002-01-30'),
 		   ARRAY['Ben','Jill']);

INSERT INTO salary_employees (name,pay_by_quarter,schedule)
VALUES ('Bill',
		 		'{20000, 20000, 20000, 20000}',
				'{{"meeting", "training"},{"lunch", "sales call"}}')

INSERT INTO salary_employees (name,pay_by_quarter,schedule)
VALUES ('Bill',
		 ARRAY[20000, 20000, 20000, 20000],
		 ARRAY[['meeting', 'training'],['lunch', 'sales call']])



								Accessing Arrays


SELECT children[2]
FROM friends;

SELECT pay_by_quarter[2:3]
FROM salary_employees;

SELECT array_dims(schedule)
FROM salary_employees;

SELECT array_length(schedule,1),array_length(schedule,2)
FROM salary_employees;



							Modifying Array

UPDATE friends
SET children=ARRAY['Maddie','Timmy','Cheryl']
WHERE (name).first_name = 'Boyd';

SELECT children
FROM friends
WHERE (name).first_name = 'Boyd'
LIMIT 1;

UPDATE friends
SET children[2]='Ricky'
WHERE (name).first_name = 'Boyd';

SELECT children
FROM friends
WHERE (name).first_name = 'Boyd'
LIMIT 1;

UPDATE friends
SET children[2:3]=ARRAY['Suzy','Billy']
WHERE (name).first_name = 'Boyd';

SELECT children
FROM friends
WHERE (name).first_name = 'Boyd'
LIMIT 1;

UPDATE salary_employees
SET pay_by_quarter=ARRAY[22000,25000,27000,22000]
WHERE name='Bill';

SELECT pay_by_quarter
FROM salary_employees
WHERE name='Bill';

UPDATE salary_employees
SET pay_by_quarter[4]=26000
WHERE name='Bill';

SELECT pay_by_quarter
FROM salary_employees
WHERE name='Bill';

UPDATE salary_employees
SET pay_by_quarter[2:3]=ARRAY[24000,25000]
WHERE name='Bill';

SELECT pay_by_quarter
FROM salary_employees
WHERE name='Bill';



					Searching Array

SELECT *
FROM friends
WHERE children[0] = 'Billy' OR children[1] = 'Billy'
OR children[2]='Billy' OR children[3]='Billy';

SELECT *
FROM friends
WHERE 'Austin' = ANY (children)

SELECT *
FROM salary_employees
WHERE 'sales call' = ANY (schedule);



					Array Operators


-- equal
SELECT ARRAY[1, 2, 3, 4] = ARRAY[1, 2, 3, 4];

-- not equal, the elements are not in same order
SELECT ARRAY[1, 2, 4, 3] = ARRAY[1, 2, 3, 4];

-- true
SELECT ARRAY[1, 2, 4, 3] > ARRAY[1, 2, 3, 4];

-- false
SELECT ARRAY[1, 2, 3, 4] > ARRAY[1, 2, 3, 4];

-- false 3 smaller than 4, doesn't look at 5 greater than 4
SELECT ARRAY[1, 2, 3, 5] > ARRAY[1, 2, 4, 4];

-- true
SELECT ARRAY[1, 2, 3, 5] @> ARRAY[2, 5];

-- false
SELECT ARRAY[1, 2, 3, 5] @> ARRAY[2, 5, 7];

-- true
SELECT ARRAY[1, 2] <@ ARRAY[2, 5, 7, 1];

-- true
SELECT ARRAY[1, 2, 13, 17] && ARRAY[2, 5, 7, 1];

--false
SELECT ARRAY[ 13, 17] && ARRAY[2, 5, 7, 1];

SELECT *
FROM friends
WHERE children && ARRAY['Billy'::varchar(50)];

SELECT *
FROM salary_employees
WHERE schedule && ARRAY['sales call'];



					Creating Json

CREATE TABLE books (
	id serial,
	bookinfo jsonb
)

INSERT INTO books (bookinfo)
VALUES
('{"title": "Introduction To Data Mining",
  "author": ["Pang-ning Tan", "Michael Steinbach", "Vipin Kumar"],
  "publisher":"Addison Wesley", "date": 2006}'),
('{"title": "Deep Learning with Python", "author": "Francois Chollet", "publisher":"Manning", "date": 2018}'),
('{"title": "Neural Networks - A Visual Intro for Beginners", "author": "Michael Taylor", "publisher":"self", "date": 2017}'),
('{"title": "Big Data In Practice", "author": "Bernard Marr", "publisher":"Wiley", "date": 2016}');


 SELECT bookinfo->'author' FROM books;

 INSERT INTO books (bookinfo) VALUES
 ('{"title": "Artificial Intelligence With Uncertainty");


 SELECT bookinfo->'title' FROM books;


						Creating Json From Tables


SELECT jsonb_build_object(
	'id', air.id,
	'ident', air.ident,
	'name', air.name,
	'latitude_deg', air.latitude_deg,
	'elevation_ft', air.elevation_ft,
	'continent', air.continent,
	'iso_country', air.iso_country,
	'iso_region', air.iso_region,
	'airport_home_link', air.home_link,
	'airport_wikipedia_link', air.wikipedia_link,
	'municipality', air.municipality,
	'scheduled_service', air.scheduled_service,
	'gps_code', air.gps_code,
	'iata_code', air.iata_code,
	'airport_local_code', air.local_code
)
FROM airports AS air;

SELECT jsonb_build_object(
	'id', air.id,
	'ident', air.ident,
	'name', air.name,
	'latitude_deg', air.latitude_deg,
	'elevation_ft', air.elevation_ft,
	'continent', air.continent,
	'iso_country', air.iso_country,
	'iso_region', air.iso_region,
	'airport_home_link', air.home_link,
	'airport_wikipedia_link', air.wikipedia_link,
	'municipality', air.municipality,
	'scheduled_service', air.scheduled_service,
	'gps_code', air.gps_code,
	'iata_code', air.iata_code,
	'airport_local_code', air.local_code,
	'airport_keywords', to_jsonb(string_to_array(air.keywords, ','))
)
FROM airports AS air;


SELECT jsonb_build_object(
	'id', air.id,
	'ident', air.ident,
	'name', air.name,
	'latitude_deg', air.latitude_deg,
	'elevation_ft', air.elevation_ft,
	'continent', air.continent,
	'iso_country', air.iso_country,
	'iso_region', air.iso_region,
	'airport_home_link', air.home_link,
	'airport_wikipedia_link', air.wikipedia_link,
	'municipality', air.municipality,
	'scheduled_service', air.scheduled_service,
	'gps_code', air.gps_code,
	'iata_code', air.iata_code,
	'airport_local_code', air.local_code,
	'airport_keywords', to_jsonb(string_to_array(air.keywords, ',')),
	'country_name', countries.name,
	'country_wikipedia_link', countries.wikipedia_link,
	'country_keywords', to_jsonb(string_to_array(countries.keywords, ',')),
	'region_name', regions.name,
	'region_wikipedia_link', regions.wikipedia_link,
	'regions_keywords', to_jsonb(string_to_array(regions.keywords, ','))
)
FROM airports AS air
INNER JOIN regions ON air.iso_region=regions.code
INNER JOIN countries ON air.iso_country = countries.code;

SELECT JSONB_STRIP_NULLS (
	 jsonb_build_object(
	'id', air.id,
	'ident', air.ident,
	'name', air.name,
	'latitude_deg', air.latitude_deg,
	'elevation_ft', air.elevation_ft,
	'continent', air.continent,
	'iso_country', air.iso_country,
	'iso_region', air.iso_region,
	'airport_home_link', air.home_link,
	'airport_wikipedia_link', air.wikipedia_link,
	'municipality', air.municipality,
	'scheduled_service', air.scheduled_service,
	'gps_code', air.gps_code,
	'iata_code', air.iata_code,
	'airport_local_code', air.local_code,
	'airport_keywords', to_jsonb(string_to_array(air.keywords, ',')),
	'country_name', countries.name,
	'country_wikipedia_link', countries.wikipedia_link,
	'country_keywords', to_jsonb(string_to_array(countries.keywords, ',')),
	'region_name', regions.name,
	'region_wikipedia_link', regions.wikipedia_link,
	'regions_keywords', to_jsonb(string_to_array(regions.keywords, ','))
))
FROM airports AS air
INNER JOIN regions ON air.iso_region=regions.code
INNER JOIN countries ON air.iso_country = countries.code;




						Aggregating Json Fields

SELECT to_jsonb(runway_json) FROM
(SELECT le_ident, he_ident, length_ft, width_ft, surface, lighted AS is_lighted,
closed AS is_closed,
le_latitude_deg, le_longitude_deg,le_elevation_ft,le_displaced_threshold_ft,
he_latitude_deg,he_longitude_deg,he_elevation_ft, he_heading_degt,he_displaced_threshold_ft
FROM runways
WHERE airport_ident = 'JRA') as runway_json;


SELECT JSONB_AGG(to_jsonb(runway_json)) FROM
(SELECT le_ident, he_ident, length_ft, width_ft, surface, lighted AS is_lighted,
closed AS is_closed,
le_latitude_deg, le_longitude_deg,le_elevation_ft,le_displaced_threshold_ft,
he_latitude_deg,he_longitude_deg,he_elevation_ft, he_heading_degt,he_displaced_threshold_ft
FROM runways
WHERE airport_ident = 'JRA') as runway_json;

SELECT JSONB_AGG(to_jsonb(nav)) FROM
(SELECT name, filename, ident, type, frequency_khz,
latitude_deg, longitude_deg, elevation_ft, dme_frequency_khz,
dme_channel, dme_latitude_deg, dme_latitude_deg,dme_elevation_ft,
slaved_variation_deg, magnetic_variation_deg,usagetype, power
FROM navaids
WHERE associated_airport = 'CYYZ') AS nav



						Building airPorts_Json Tables


CREATE TABLE airports_json AS (
SELECT JSONB_STRIP_NULLS (
	 jsonb_build_object(
	'id', air.id,
	'ident', air.ident,
	'name', air.name,
	'latitude_deg', air.latitude_deg,
	'elevation_ft', air.elevation_ft,
	'continent', air.continent,
	'iso_country', air.iso_country,
	'iso_region', air.iso_region,
	'airport_home_link', air.home_link,
	'airport_wikipedia_link', air.wikipedia_link,
	'municipality', air.municipality,
	'scheduled_service', air.scheduled_service,
	'gps_code', air.gps_code,
	'iata_code', air.iata_code,
	'airport_local_code', air.local_code,
	'airport_keywords', to_jsonb(string_to_array(air.keywords, ',')),
	'country_name', countries.name,
	'country_wikipedia_link', countries.wikipedia_link,
	'country_keywords', to_jsonb(string_to_array(countries.keywords, ',')),
	'region_name', regions.name,
	'region_wikipedia_link', regions.wikipedia_link,
	'regions_keywords', to_jsonb(string_to_array(regions.keywords, ',')),
	'runways', (SELECT JSONB_AGG(to_jsonb(runway_json)) FROM
		(SELECT le_ident, he_ident, length_ft, width_ft, surface,
		 	lighted AS is_lighted,closed AS is_closed,
			le_latitude_deg, le_longitude_deg,le_elevation_ft,le_displaced_threshold_ft,
			he_latitude_deg,he_longitude_deg,he_elevation_ft, he_heading_degt,he_displaced_threshold_ft
		FROM runways
		WHERE airport_ident = air.ident) as runway_json
		),
	'navaids', (SELECT JSONB_AGG(to_jsonb(nav)) FROM
				(SELECT name, filename, ident, type, frequency_khz,
					latitude_deg, longitude_deg, elevation_ft, dme_frequency_khz,
					dme_channel, dme_latitude_deg, dme_latitude_deg,dme_elevation_ft,
					slaved_variation_deg, magnetic_variation_deg,usagetype, power
				FROM navaids
				WHERE associated_airport = air.ident) AS nav
		),
	'frequencies', (SELECT JSONB_AGG(to_jsonb(nav)) FROM
				(SELECT type, description, frequency_mhz
				FROM airport_frequencies
				WHERE airport_ident = air.ident) AS nav
		)
)) AS airports

FROM airports AS air
INNER JOIN regions ON air.iso_region=regions.code
INNER JOIN countries ON air.iso_country = countries.code
);




							Selecting Information Out of JSON fields


SELECT airports->'runways'->0, airports->'country_name'
FROM airports_json;

SELECT airports->'runways'->>0, airports->>'country_name'
FROM airports_json;

SELECT '{"a": {"b": [3, 2, 1]}}'::jsonb #> '{a,b}';

SELECT '{"a": {"b": [3, 2, 1], "c": {"d": 5}}}'::jsonb #> '{a, c, d}';

SELECT airports->'frequencies'->1, airports->>'region_name'
FROM airports_json
ORDER BY  airports->'frequencies'->1 ASC;



									Searching JSON Data

SELECT * FROM airports_json
WHERE airports @> '{"iso_country": "BR"}';

SELECT COUNT(*) FROM airports_json
WHERE airports->>'iso_country' = 'BR';


SELECT COUNT(*) FROM airports_json
WHERE airports->>'iso_region' = 'US-AR';

SELECT COUNT(*) FROM airports_json
WHERE airports @> '{"iso_region": "US-AR"}';

SELECT COUNT(*) FROM airports_json
WHERE airports->'runways'-> 0 @> '{"length_ft": 2000}';

SELECT COUNT(*) FROM airports_json
WHERE airports->'navaids'-> 1 @> '{"frequency_khz": 400}';




							Updating And Deleting Information inside JSON Fields


UPDATE airports_json
SET airports = airports || '{"nearby_lakes": ["Lake Chicot"]}'::jsonb
WHERE airports->>'iso_region' = 'US-AR'
		AND airports->>'municipality' = 'Lake Village';


SELECT airports->'nearby_lakes'
FROM airports_json
WHERE airports->>'iso_region' = 'US-AR'
		AND airports->>'municipality' = 'Lake Village';

UPDATE airports_json
SET airports = airports || '{"nearby_lakes": ["Lake Providence"]}'::jsonb
WHERE airports->>'iso_region' = 'US-AR'
		AND airports->>'municipality' = 'Lake Village';

SELECT airports->'nearby_lakes'
FROM airports_json
WHERE airports->>'iso_region' = 'US-AR'
		AND airports->>'municipality' = 'Lake Village';

UPDATE airports_json
SET airports = airports - 'nearby_lakes'
WHERE airports->>'iso_region' = 'US-AR'
		AND airports->>'municipality' = 'Lake Village';

SELECT airports->'nearby_lakes'
FROM airports_json
WHERE airports->>'iso_region' = 'US-AR'
		AND airports->>'municipality' = 'Lake Village';

--put it back in so we can delete with other syntax
UPDATE airports_json
SET airports = airports || '{"nearby_lakes": ["Lake Chicot","Lake Providence"]}'::jsonb
WHERE airports->>'iso_region' = 'US-AR'
		AND airports->>'municipality' = 'Lake Village';

SELECT airports->'nearby_lakes'
FROM airports_json
WHERE airports->>'iso_region' = 'US-AR'
		AND airports->>'municipality' = 'Lake Village';

UPDATE airports_json
SET airports = airports #- '{"nearby_lakes", 1}'
WHERE airports->>'iso_region' = 'US-AR'
		AND airports->>'municipality' = 'Lake Village';

SELECT airports->'nearby_lakes'
FROM airports_json
WHERE airports->>'iso_region' = 'US-AR'
		AND airports->>'municipality' = 'Lake Village';

UPDATE airports_json
SET airports = airports || '{"good_restaurants": ["La Terraza", "McDonalds"]}'
WHERE airports->>'id' = '20426';

SELECT airports->'good_restaurants'
FROM airports_json
WHERE airports->>'id' = '20426';

UPDATE airports_json
SET airports = airports #- '{"good_restaurants", 1}'
WHERE airports->>'id' = '20426';

SELECT airports->'good_restaurants'
FROM airports_json
WHERE airports->>'id' = '20426';



 
