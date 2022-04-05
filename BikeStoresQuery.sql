-- Select All from all the tables
SELECT * FROM production.brands;
SELECT * FROM production.categories;
SELECT * FROM production.products;
SELECT * FROM production.stocks;
SELECT * FROM sales.customers;
SELECT * FROM sales.order_items;
SELECT * FROM sales.orders;
SELECT * FROM sales.staffs;
SELECT * FROM sales.stores;

--Basic SQL Server Select Statements

-- write query to find the first name and last name of all customers
SELECT 
	first_name,last_name
FROM
	sales.customers;

SELECT 
	first_name,last_name, email
FROM
	sales.customers;

-- Sorting Data
-- ORDER BY :: Sort the result by one column in ascending / descending order
-- display the customer list by the first name in ascending order
SELECT
	first_name,
	last_name
FROM
	sales.customers
ORDER BY
	first_name;

-- display the customer list by the first name in descending order
SELECT
	first_name,
	last_name
FROM
	sales.customers
ORDER BY
	first_name DESC;

-- Sort the result set by multiple columns
SELECT 
	city,
	first_name,
	last_name
FROM
	sales.customers
ORDER BY
	city,
	first_name;

-- Sort the result set by multiple columns and different orders
SELECT 
	city,
	first_name,
	last_name
FROM
	sales.customers
ORDER BY
	city ASC,
	first_name DESC;

-- Sort the result set by a column that is not in the select list
SELECT 
	city,
	first_name,
	last_name
FROM
	sales.customers
ORDER BY
	state;

-- Function 
SELECT 
	first_name,
	LEN(first_name),
	last_name
FROM
	sales.customers;

-- Sort the customers by the length of the first name
SELECT 
	first_name,
	LEN(first_name) 'first_name_length',
	last_name
FROM
	sales.customers
ORDER BY
	LEN(first_name);

-- Sort by ordinal positions of columns
SELECT 
	last_name,
	first_name
FROM
	sales.customers
ORDER BY
	2;


-- Limiting Rows
-- OFFSET FETCH

-- Display all product from products table and sort the products by their list price and name
SELECT 
	*
FROM
	production.products
ORDER BY
	list_price,
	product_name;


-- Skip the first 10 product and return the rest using OFFSET
SELECT 
	*
FROM
	production.products
ORDER BY
	list_price,
	product_name
OFFSET 10 ROWS;

-- Skip the first 10 product and select the next 10 products only using OFFSET and FETCH
SELECT 
	*
FROM
	production.products
ORDER BY
	list_price,
	product_name
OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY;

-- Get the top 10 most expensive products using both OFFSET and FETCH
SELECT 
	*
FROM
	production.products
ORDER BY
	list_price DESC,
	product_name
OFFSET 0 ROWS
FETCH FIRST 10 ROWS ONLY;

-- TOP
SELECT TOP 10
	*
FROM
	production.products
ORDER BY
	list_price DESC;

-- TOP WITH TIES
SELECT TOP 10 WITH TIES
	*
FROM
	production.products
ORDER BY
	list_price DESC;

-- FILTERING DATA
-- DISTINCT

SELECT 
	city
FROM
	sales.customers
ORDER BY
	city;

-- returns all distinct cities 
SELECT DISTINCT
	 city
FROM
	sales.customers
ORDER BY
	city;

-- WHERE 
SELECT 
	*
FROM
	production.products;

-- Finding rows by using a simple equality
-- Retrieve all products with the category id 1
SELECT 
	*
FROM
	production.products
WHERE
	category_id = 1
ORDER BY
	list_price;

-- Retreve the product which have category id 1 and model year as 2018
SELECT 
	*
FROM
	production.products
WHERE
	category_id = 1 AND model_year = 2018
ORDER BY
	list_price;

-- Retreve the product which have category id 1 and model year as 2018 and price is greater than 300
SELECT 
	*
FROM
	production.products
WHERE
	category_id = 1 AND model_year = 2018 and list_price > 300
ORDER BY
	list_price;

-- Retreve the product whose list prices are between 1,899 and 1,999.99
SELECT 
	*
FROM
	production.products
WHERE 
	list_price >= 1899 AND list_price <= 1999.99
ORDER BY list_price;

-- BETWEEN
SELECT 
	*
FROM
	production.products
WHERE 
	list_price BETWEEN 1899 AND 1999.99
ORDER BY list_price;

-- IN
-- Find the products whose price is 299.99 , 466.99 , 489.99
SELECT 
	*
FROM
	production.products
WHERE
	list_price IN ( 299.99 , 466.99 , 489.99)
ORDER BY list_price;


-- Find the products whose prices are not one of the  299.99 , 466.99 , 489.99 
SELECT 
	*
FROM
	production.products
WHERE
	list_price NOT IN ( 299.99 , 466.99 , 489.99)
ORDER BY list_price;

-- LIKE OPERATOR
-- % :: any string of zero or more characters
-- _ :: any single character
-- [abc] :: any single character with the specific set
-- [^abc] :: any single character not within a set

-- find the customers whose last name starts with letter z
SELECT 
	*
FROM
	sales.customers
WHERE
	last_name LIKE 'z%'
ORDER BY
	first_name;

-- find the customers whose last name ends with 'er'
SELECT 
	*
FROM
	sales.customers
WHERE
	last_name LIKE '%er'
ORDER BY
	first_name;


--  find the customers where the second character is letter u
SELECT 
	*
FROM
	sales.customers
WHERE
	last_name LIKE '_u%'
ORDER BY
	first_name;

-- find the customers where the first character in the last name is the letter in the range A though C
SELECT 
	*
FROM
	sales.customers
WHERE
	last_name LIKE '[A-C]%'
	OR
	last_name LIKE '[F]%'
	OR
	last_name LIKE '[X-Z]%'
ORDER BY
	last_name;

SELECT 
	*
FROM
	sales.customers
WHERE
	last_name LIKE '[^A-C]%'
ORDER BY
	last_name;

-- COLUMN ALIAS
SELECT 
	*
FROM
	sales.customers
ORDER BY
	first_name;

-- Print the full name of all customers - Contactination
SELECT 
	first_name + ' ' + last_name AS full_name
FROM
	sales.customers
ORDER BY
	first_name;

SELECT 
	first_name + ' ' + last_name full_name
FROM
	sales.customers
ORDER BY
	first_name;

SELECT 
	first_name + ' ' + last_name 'full name'
FROM
	sales.customers
ORDER BY
	first_name;

-- use the alias in order by query
SELECT 
	first_name 'name'
FROM
	sales.customers

SELECT 
	first_name 'name'
FROM
	sales.customers
ORDER BY
	'name';

-- Grouping data
SELECT 
	*
FROM
	sales.orders;

SELECT 
	*
FROM
	sales.orders
WHERE
	customer_id IN(1,2);

-- Print the customer id and order date of customer having customer id 1 or 2 from order details
SELECT 
	customer_id,
	order_date
FROM
	sales.orders
WHERE
	customer_id IN(1,2)
ORDER BY
	customer_id;

-- Print the count of total orders placed by customer with customer id 1 OR 2
SELECT 
	customer_id,
	COUNT(customer_id)
FROM
	sales.orders
WHERE
	customer_id IN(1,2)
GROUP BY
	customer_id
ORDER BY
	customer_id;

SELECT
	customer_id,
	city
FROM	
	sales.customers
ORDER BY
	city;

-- Print the count of customers in every city
SELECT
	city,
	count(customer_id) 'customers_count'
FROM	
	sales.customers
GROUP BY
	city
ORDER BY
	city;


-- Aggrigate functions
SELECT 
	MIN(list_price) 
FROM
	production.products;

SELECT 
	MAX(list_price) 
FROM
	production.products;

SELECT 
	COUNT(list_price) 
FROM
	production.products;

SELECT 
	SUM(list_price) 'sum_of_all prices'
FROM
	production.products;

SELECT 
	AVG(list_price)  
FROM
	production.products;


SELECT
	*
FROM
	production.products;

-- Print the total count of products in every model year using group by
SELECT
	model_year,
	COUNT(model_year) 'total_models'
FROM
	production.products
GROUP BY
	model_year

-- Using Group by print the sum list price of each order 
SELECT * FROM sales.order_items;

SELECT 
	order_id ,
	SUM(list_price) 'total_amount',
	MAX(list_price) 'max_amount',
	MIN(list_price) 'max_amount'
FROM
	sales.order_items
GROUP BY
	order_id



-- Using Group by print orders with the sum list price of each order greater than 5000

SELECT 
	order_id ,
	SUM(list_price) 'total_amount',
	MAX(list_price) 'max_amount',
	MIN(list_price) 'min_amount'
FROM
	sales.order_items
where 
	list_price > 5000
GROUP BY
	order_id


-- Print the total count of products in every model year using group by
SELECT
	model_year,
	COUNT(model_year) 'total_models'
FROM
	production.products
GROUP BY
	model_year

-- Print only the products with  the total count of products is greater than 50 in every model year 
-- using group by
SELECT
	model_year,
	COUNT(model_year) 'total_models'
FROM
	production.products
GROUP BY
	model_year
HAVING
	COUNT(model_year) >= 50

CREATE TABLE sales.employee (
	employee_id INT IDENTITY,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	department VARCHAR(20),
	city VARCHAR(20),
	salary FLOAT
);

INSERT INTO sales.employee VALUES
('Rahul','Mohane' , 'DB' , 'Mumbai' , 15000),
('Rahul','Devkate' , 'DB' , 'Navi Mumbai' , 15000),
('Lakshminarsimhan','' , 'IT' , 'Mumbai' , 12000),
('Balasalheb','Ugale' , 'DB' , 'Thane' , 15000),
('Rahul','Mohane' , 'DB' , 'Mumbai' , 15000),
('Adityan','Chandran' , 'IT' , 'Mumbai' , 12000),
('Anil','Gangawat' , 'DB' , 'Navi Mumbai' , 15000),
('Aarti','Thakur' , 'IT' , 'Mumbai' , 12000),
('Mayura','Salgonkar' , 'DB' , 'Mumbai' , 15000),
('Santosh','Mane' , 'IT' , 'Mumbai' , 12000),
('Vipul','Rane' , 'DB' , 'Navi Mumbai' , 15000);

SELECT * FROM sales.employee;

-- Print the sum of salary for the employees who work in IT department
SELECT 
	SUM(salary)
FROM
	sales.employee
WHERE
	department = 'IT';

-- Print the sum of salary for the employees of every department
SELECT
	department , 
	SUM(salary) 'total salary'
FROM
	sales.employee
GROUP BY
	department;

-- Print the count of employees work in each department
SELECT
	department , 
	count(employee_id) 'total employees'
FROM
	sales.employee
GROUP BY
	department;

-- Print the count of employees work in each department only if the total employees are > 5
SELECT
	department , 
	count(employee_id) 'total employees'
FROM
	sales.employee
GROUP BY
	department
HAVING 
	count(employee_id) > 5;


-- Dates functions
SELECT GETDATE();
SELECT DAY(GETDATE());
SELECT DAY('2022-03-30');
SELECT MONTH('2022-03-30');
SELECT YEAR('2022-03-30');
SELECT DATEADD(DAY,1,'2022-03-30');
SELECT DATEADD(MONTH,1,'2022-03-30');
SELECT DATEADD(YEAR,1,'2022-03-30');
SELECT DATENAME(WEEKDAY ,'2022-03-30');
SELECT DATEDIFF(DAY ,'2022-03-01','2022-03-30');
SELECT DATEDIFF(MONTH ,'2022-02-01','2022-03-30');

SELECT 
	*
FROM
	sales.orders
WHERE  order_date BETWEEN '2016-01-01' AND '2016-01-15';

-- Print the orders which are delived on time
SELECT 
	*
FROM
	sales.orders
WHERE 
	DATEDIFF(DAY , required_date , shipped_date) = 0

-- Print the orders which are NOT delived on time
SELECT 
	*
FROM
	sales.orders
WHERE 
	DATEDIFF(DAY , required_date , shipped_date) > 0

-- String functions
SELECT LOWER('HELLO');
SELECT UPPER('hi');

SELECT 
	UPPER(first_name)
FROM 
	sales.employee;

SELECT 
	UPPER(CONCAT(first_name,' ',last_name))
FROM 
	sales.employee;

-- Joins
	--  Inner Join , Natural Join , Join
	--  Outer Join
		-- a. Left Outer Join , Left Join
		-- b. Right Outer Join , Right Join
		-- c. Full Outer Join , Full Join
	-- Cross Join - No Comman Column Required To Join
	-- Selft Join

CREATE SCHEMA hr;

-- Candidate table
CREATE TABLE hr.candidates(
	id INT IDENTITY PRIMARY KEY,
	fullname VARCHAR(20) NOT NULL
);

CREATE TABLE hr.employee(
	id INT IDENTITY PRIMARY KEY,
	fullname VARCHAR(20) NOT NULL
);

INSERT INTO hr.candidates(fullname)
VALUES('Balasaheb Ugale'),('Lakshminarasimhan'),('Vipul Rane'),('Rahul Devkate')

INSERT INTO hr.employee(fullname)
VALUES('Balasaheb Ugale'),('Lakshminarasimhan'),('Vipul Rane'),('Arati Thakur')

SELECT * FROM hr.candidates;
SELECT * FROM hr.employee;

-- Table Multiplication , Cartition Product
SELECT * FROM hr.candidates , hr.employee;

-- Inner Join
-- Inner Join produces a data set that inclues rows from the left table which have matching rows from the right table.

SELECT 
	*
FROM
	hr.candidates
JOIN
	hr.employee
ON
	hr.candidates.fullname = hr.employee.fullname;

-- Left Outer Join
-- Left join selects data start from the left table and matching rows in the right table.
-- The left join returns all rows from the left table and the matching rows from right table
-- If a row in the left table dose not have a matching row in right table , the columns of right table will have nulls.
SELECT 
	*
FROM
	hr.candidates
LEFT JOIN
	hr.employee
ON
	hr.candidates.fullname = hr.employee.fullname;

-- Right Outer Join
-- Right join selects data start from the right table and matching rows in the left table.
-- The right join returns all rows from the right table and the matching rows from left table
-- If a row in the right table dose not have a matching row in left table , the columns of left table will have nulls.
SELECT 
	*
FROM
	hr.candidates
RIGHT JOIN
	hr.employee
ON
	hr.candidates.fullname = hr.employee.fullname;

-- Full Join
-- The Full join returns a result that contains all rows from both left and right tables.
-- In case there is no match , the missing side will have NULL values.
SELECT 
	*
FROM
	hr.candidates
FULL JOIN
	hr.employee
ON
	hr.candidates.fullname = hr.employee.fullname;

-- CROSS JOIN
SELECT 
	*
FROM
	hr.candidates
CROSS JOIN
	hr.employee;

-- SELF JOIN

DROP TABLE hr.employees_details;

CREATE TABLE hr.employees_details (
	employee_id INT PRIMARY KEY,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	manager_id INT,
	salary FLOAT
);
 
INSERT INTO hr.employees_details VALUES 
(1,'Samarth','Patil',NULL,1000),
(2,'Gurubux','Gill',1,1000),
(3,'Vivek','Gohil',2,1000),
(4,'Trupti','Acharekar',2,1000),
(5,'Lakshminarsimhan','',3,1000),
(6,'Rahul','Mohane',4,1000),
(7,'Adityan','Chandran',3,1000),
(8,'Arati','Thakur',4,1000);

SELECT * FROM hr.employees_details;

--Step 1 - Create the replication / copy of table using alias
SELECT * FROM hr.employees_details e , hr.employees_details m;

--Step 2 - Get the matching records by condition e.managerid = m.employeeId 
SELECT 
	e.first_name,
	' Reports To ' reports_to,
	m.first_name
FROM
	hr.employees_details e
JOIN
	hr.employees_details m
ON
	e.manager_id = m.employee_id;

-- Step 3 - Get the result in required format
SELECT 
	e.first_name + ' Reports To ' + m.first_name 'employee and reporting manager'
FROM
	hr.employees_details e
JOIN
	hr.employees_details m
ON
	e.manager_id = m.employee_id;


-- Joins Examples Tables
SELECT * FROM sales.customers;
SELECT * FROM sales.orders;

-- Print only the customers who have placed the order
-- Customers = 1,445
SELECT
	*
FROM
	sales.customers
JOIN
	sales.orders
ON
	sales.customers.customer_id = sales.orders.customer_id;

SELECT
	 c.customer_id , c.first_name , c.last_name
FROM
	sales.customers c
JOIN
	sales.orders o
ON
	c.customer_id =o.customer_id;

-- print the count of the orders placed by each customer

SELECT
	 c.customer_id ,
	 COUNT(c.customer_id) 'orders count'
FROM
	sales.customers c
JOIN
	sales.orders o
ON
	c.customer_id =o.customer_id
GROUP BY c.customer_id

-- Print the orders details for the customers who locate in New York

SELECT * FROM production.products;
SELECT * FROM production.brands;

-- Print all the products of brand 'Haro'


-- Query 1
SELECT 
	*
FROM	
	production.brands 
WHERE 
	brand_name = 'Haro';

-- Query 2
SELECT 
	* 
FROM 
	production.products
WHERE 
	brand_id = -- Query 1

-- Nested Query - Good Performance compair to Joins
SELECT 
	* 
FROM 
	production.products
WHERE 
	brand_id = 
	(
		SELECT 
			brand_id
		FROM	
			production.brands 
		WHERE 
			brand_name = 'Haro'
	);

-- Print the details of products with Highest list price
-- SELECT MAX(list_price) FROM	production.products;
SELECT 
	*
FROM
	production.products
WHERE 
	list_price = 
	(
		SELECT 
			MAX(list_price) 
		FROM	
			production.products
	);

-- View
	
SELECT 
	*
FROM 
	production.products;

CREATE VIEW production.vi_products
AS
SELECT
	product_id,
	product_name,
	list_price
FROM
	production.products


SELECT * FROM production.vi_products;

-- Print all the products of brand 'Haro'
SELECT 
	* 
FROM 
	production.products
WHERE 
	brand_id = 
	(
		SELECT 
			brand_id
		FROM	
			production.brands 
		WHERE 
			brand_name = 'Haro'
	);

-- Create a view to display the all the products of Haro brand
CREATE VIEW production.brands_haro
AS
SELECT 
	* 
FROM 
	production.products
WHERE 
	brand_id = 
	(
		SELECT 
			brand_id
		FROM	
			production.brands 
		WHERE 
			brand_name = 'Haro'
	);

SELECT * FROM production.brands_haro;

SELECT product_id , list_price , product_name FROM production.brands_haro ORDER BY list_price;
SELECT product_id , list_price , product_name FROM production.brands_haro WHERE list_price > 1000 ORDER BY list_price;


-- Update list price using view

SELECT * FROM production.vi_products;

UPDATE production.vi_products set list_price = list_price + (list_price * 0.10)

SELECT * FROM production.vi_products;

-- If view have the multiple tables using join then you cannot update , delete or truncate the using view 

-- Index
-- Why Index
DROP TABLE production.parts;
CREATE TABLE production.parts (
	part_id INT NOT NULL,
	part_name VARCHAR(100)
);

INSERT INTO 
	production.parts(part_id , part_name)
VALUES
	(1,'Feame'),
	(2,'Head Tube'),
	(3,'Handlebar Grip'),
	(4,'Shock Absorber'),
	(5,'Fork')

SELECT * FROM production.parts;

SELECT 
	*
FROM
	production.parts
WHERE
	part_id = 5;

CREATE CLUSTERED INDEX ix_part_id
ON production.parts(part_id)

DROP TABLE employee_temp;
CREATE TABLE employee_temp (
	employee_id INT IDENTITY,
	name VARCHAR(30),
	salary FLOAT
);

SELECT * FROM employee_temp;

-- insert 1000000 recoreds into employee_temp table
--- while loop
DECLARE @counter INT = 0;
WHILE @counter < 100000
BEGIN
	INSERT INTO employee_temp(name , salary) VALUES(CONCAT('Temp ' , @counter) , 1000 + @counter);
	SET @counter = @counter + 1;
END;
PRINT 'ALL VALUES ARE INSERTED';

SELECT * FROM employee_temp WHERE employee_id = 99999;

CREATE CLUSTERED INDEX ix_employee_id
ON employee_temp(employee_id)

-- IF 
SELECT 
	*
FROM
	sales.orders;

BEGIN
	DECLARE @required_date DATE;
	DECLARE @shipped_date DATE;

	SELECT 
		@required_date = required_date ,
		@shipped_date = shipped_date	
	FROM sales.orders
	WHERE order_id = 12;

	IF @required_date = @shipped_date
	BEGIN
		PRINT 'GREAT! your order delived on time';
	END
	ELSE
	BEGIN
		PRINT 'SORRY! your order is late'
	END
END

-- CASE 
-- 1	Children Bicycles
-- 2	Comfort Bicycles
-- 3	Cruisers Bicycles
-- 4	Cyclocross Bicycles
-- 5	Electric Bikes
-- 6	Mountain Bikes
-- 7	Road Bikes

SELECT * FROM production.products;



SELECT product_id , product_name , 
	CASE 
	WHEN category_id = 1 THEN 'Children Bicycles'
	WHEN category_id = 2 THEN 'Comfort Bicycles'
	WHEN category_id = 3 THEN 'Cruisers Bicycles'
	WHEN category_id = 4 THEN 'Cyclocross Bicycles'
	WHEN category_id = 5 THEN 'Electric Bikes'
	WHEN category_id = 6 THEN 'Mountain Bikes'
	WHEN category_id = 7 THEN 'Road Bikes'
	END	AS 'bike category' 	
FROM production.products;