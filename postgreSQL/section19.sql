SELECT employeeid,*  FROM supplier_order_details WHERE employeeid=5
ALTER VIEW supplier_order_details RENAME TO supplier_orders;

 Creating Updatable Views
CREATE VIEW north_america_customers AS
SELECT *
FROM customers
WHERE country in ('USA','Canada','Mexico');

SELECT fax,* FROM north_america_customers WHERE customerid='CFDCM'

INSERT INTO north_america_customers
(customerid,companyname,contactname,contacttitle,address,city,region,postalcode,country,phone,fax)
VALUES ('CFDCM','Catfish Dot Com','Will Bunker','President','Old Country Road','Lake Village','AR','71653','USA','555-555-5555',null);

UPDATE north_america_customers SET fax='555-333-4141' WHERE customerid='CFDCM';
DELETE FROM north_america_customers WHERE customerid='CFDCM';

CREATE VIEW protein_products AS
SELECT * FROM products
WHERE categoryid in (4,6,8);

SELECT *  FROM protein_products

 With Check Option
SELECT *  FROM north_america_customers 

INSERT INTO north_america_customers
(customerid,companyname,contactname,contacttitle,address,city,region,postalcode,country,phone,fax)
VALUES ('CFDCM','Catfish Dot Com','Will Bunker','President','Old Country Road','Lake Village','AR','71653','Germany','555-555-5555',null);
SELECT *  FROM north_america_customers WHERE customerid='CFDCM'--DATA is not showing

CREATE OR REPLACE VIEW north_america_customers  AS
SELECT *
FROM customers
WHERE country in ('USA','Canada','Mexico')
WITH LOCAL CHECK OPTION;

SELECT country,*  FROM north_america_customers 


INSERT INTO north_america_customers
(customerid,companyname,contactname,contacttitle,address,city,region,postalcode,country,phone,fax)
VALUES ('xxxx','Catfish Dot Com','Will Bunker','President','Old Country Road','Lake Village','AR','71653','Germany','555-555-5555',null);

CREATE OR REPLACE VIEW protein_products AS
SELECT * FROM products
WHERE categoryid in (4,6,8)
WITH LOCAL CHECK OPTION;

SELECT * FROM protein_products