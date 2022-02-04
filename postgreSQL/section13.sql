
CREATE UNIQUE INDEX idx_employees_employeeid
ON employees (employeeid);

CREATE INDEX idx_orders_customerid_orderid
ON orders (customerid, orderid);


DROP INDEX idx_employees_employeeid;

DROP INDEX idx_orders_customerid_orderid;


DROP TABLE IF EXISTS performance_test;
CREATE TABLE performance_test (
  id serial,
  location text
);

SELECT * FROM performance_test

INSERT INTO performance_test (location)
SELECT 'Katmandu, Nepal' FROM generate_series(1,500000000);


SELECT * FROM pg_stat_activity WHERE state = 'active';


SELECT pg_cancel_backend(PID);


SELECT pg_terminate_backend(PID);

SELECT pg_cancel_backend(6352);--Stop RUNNING query 

]
DROP TABLE IF EXISTS performance_test;

CREATE TABLE performance_test (
  id serial,
  location text
);




-- this takes forever 332
SELECT COUNT(*) FROM performance_test;



-- notice that it does a sequential scan
EXPLAIN SELECT COUNT(*) FROM performance_test;




CREATE INDEX idx_performance_test_id ON performance_test (id);





EXPLAIN SELECT COUNT(*) FROM performance_test;

-
SELECT COUNT(*) FROM performance_test;




DROP TABLE IF EXISTS performance_test;
CREATE TABLE performance_test (
  id serial,
  location text
);
INSERT INTO performance_test (location)
SELECT md5(random()::text) FROM generate_series(1,10000000);



EXPLAIN ANALYZE SELECT * FROM performance_test
WHERE id = 2000000;

ANALYZE performance_test;


EXPLAIN ANALYZE SELECT * FROM performance_test
WHERE id = 2000000;



ALTER TABLE performance_test
ADD COLUMN name text;

UPDATE performance_test
SET name = md5(location);

EXPLAIN ANALYZE SELECT *
FROM  performance_test
WHERE location LIKE 'df%' AND name LIKE 'cf%';

CREATE INDEX idx_peformance_test_location_name
ON performance_test(location,name);


EXPLAIN ANALYZE SELECT *
FROM  performance_test
WHERE location LIKE 'df%' AND name LIKE 'cf%';


EXPLAIN ANALYZE SELECT *
FROM  performance_test
WHERE  name LIKE 'cf%';

EXPLAIN ANALYZE SELECT *
FROM  performance_test
WHERE location LIKE 'df%';



--Make sure we don't have indexes to see the effect
DROP INDEX IF EXISTS production.idx_product_name;
DROP INDEX IF EXISTS production.idx_product_upper_name;

-- you should see a sequential scan
-- "Seq Scan on product  (cost=0.00..17.56 rows=3 width=139)"
EXPLAIN select *
from production.product
WHERE name LIKE 'Flat%';

-- create normal index
CREATE INDEX idx_product_name
ON production.product (name);

-- this becomes an bitmap index scan
-- "  ->  Bitmap Index Scan on idx_product_name  (cost=0.00..4.32 rows=5 width=0)"
EXPLAIN select *
from production.product
WHERE name LIKE 'Flat%';

-- this is back to sequential scan
-- "Seq Scan on product  (cost=0.00..17.56 rows=3 width=139)"
EXPLAIN select *
from production.product
WHERE UPPER(NAME) LIKE UPPER('Flat%');

-- create an expression scan
CREATE INDEX idx_product_upper_name
ON production.product (UPPER(name));

-- now we get a bitmap index scan
-- "  ->  Bitmap Index Scan on idx_product_upper_name  (cost=0.00..4.30 rows=3 width=0)"
EXPLAIN select *
from production.product
WHERE UPPER(NAME) LIKE UPPER('Flat%');

--your turn
CREATE INDEX idx_person_fullname
ON person.person ( (firstname  || ' ' || lastname) );

--show that it uses the index
EXPLAIN SELECT *
FROM person.person
WHERE firstname || ' ' || lastname = 'Terri Duffy';

--74. Speeding Up Text Matching--
CREATE EXTENSION pg_trgm;

CREATE INDEX trgm_idx_performance_test_location
ON performance_test USING gin (location gin_trgm_ops);

CREATE INDEX idx_performance_test_name
ON performance_test (name);


-- terrible performance
EXPLAIN ANALYZE SELECT location
FROM  performance_test
WHERE name LIKE '%dfe%';

--only situation where pattern matching works
EXPLAIN ANALYZE SELECT location
FROM  performance_test
WHERE name LIKE 'dfe%';


-- much better performance
EXPLAIN ANALYZE SELECT location
FROM  performance_test
WHERE location LIKE '%dfe%';

EXPLAIN ANALYZE SELECT location
FROM  performance_test
WHERE location LIKE 'dfe%';