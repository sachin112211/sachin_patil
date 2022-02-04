
		SELECT customerid,COALESCE(shipregion,'N/A') FROM orders;


		SELECT companyname,COALESCE(homepage,'Call to find') from suppliers;


		SELECT companyname,phone,COALESCE(NULLIF(homepage,''),'Need to call')FROM suppliers;	


		SELECT companyname, COALESCE(NULLIF(fax,''),phone) AS confirmation FROM customers;