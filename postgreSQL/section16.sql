

	CREATE TABLE IF NOT EXISTS SUBSCRIBERS
    (
	  subid numeric ,
	  first_name varchar(50) NOT NULL,
	  last_name varchar(50)NOT NULL
	 )
	
 
   
   
  

    CREATE TABLE IF NOT EXISTS SUBSCRIBERS
    (subid numeric ,first_name varchar(50) NOT NULL,
	  last_name varchar(50)UNIQUE NOT NULL)
	 
  
  
	
	
  

    CREATE TABLE IF NOT EXISTS SUBSCRIBERS
    (subid numeric CONSTRAINT pk_sub PRIMARY KEY ,
	  first_name varchar(50) NOT NULL,
	  last_name varchar(50)UNIQUE NOT NULL)
	 
	
	

	 CREATE TABLE IF NOT EXISTS EMPLOYEE
    (empid numeric CONSTRAINT pk_empid PRIMARY KEY ,
	  empname varchar(50) NOT NULL,
	  salary numeric(15,2) NOT NULL,
	  deptno numeric(5),
	  FOREIGN KEY (deptno) REFERENCES DEPARTMENT(deptno))
	
	 CREATE TABLE IF NOT EXISTS DEPARTMENT
    (deptid numeric CONSTRAINT pk_deptid PRIMARY KEY ,
	  deptnamename varchar(50) NOT NULL)
	 
	
	 CREATE TABLE IF NOT EXISTS EMPLOYEE
	(empid numeric CONSTRAINT pk_empid PRIMARY KEY ,
	empname varchar(50) NOT NULL,
	salary numeric(15,2) NOT NULL,
	Age numeric,
	deptno numeric(5),
	FOREIGN KEY (deptno) REFERENCES DEPARTMENT(deptno),
	CHECK(Age > 18))	 
   
   
   
   

    CREATE TABLE Persons (
    ID int CONSTRAINT pk_id PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'MUMBAI'
    );