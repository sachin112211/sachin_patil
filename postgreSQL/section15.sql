
CREATE TABLE returns(
  returnid SERIAL), 
  customerid NUMERIC(4),
  returneddate TIMESTAMP,
  productid INT,
  quantity SMALLINT,
  orderid INTEGER
);


ALTER TABLE returns
RENAME returneddate TO returned_date;


ALTER TABLE returns
RENAME TO bad_orders;


ALTER TABLE bad_orders
ADD COLUMN  reason text;


ALTER TABLE bad_orders
DROP COLUMN  reason;

ALTER TABLE bad_orders
ALTER COLUMN  quantity SET DATA TYPE int;


DROP TABLE bad_orders;