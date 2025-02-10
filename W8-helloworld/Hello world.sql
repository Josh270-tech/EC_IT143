USE EC_IT143_DA
--Q What is the current date and time?
--A Lets ask sql server and findout--

SELECT 'HELLO WORLD' AS My_Message,
GETDATE() AS current_date_time;
GO
DROP VIEW IF EXISTS dbo.v_hello_world_load;
GO
CREATE VIEW dbo.v_hello_world_load
AS
SELECT 'HELLO WORLD' AS My_Message, GETDATE() AS current_date_time; 
GO 
/***********************************************************************************************************
NAME: dbo.v_hello_world_load
PURPOSE: Create the hello world - Load view

MODIFICATION LOG:
Ver      Date         Author       Description
-----   ---------    ----------    -------------------------------------------------------------------------
1.0     02/02/2025   Joshua       1. Built this script for EC IT143


RUNTIME
1s

NOTES:
This script exists to help me learn step 4 of 8 in the Answer Focused Approach for T-SQL DATA Manipulation

****************************************************************************************************************/

SELECT 'Hello world' AS my_message,
GETDATE() AS current_date_time;

--Q What is the current date and time?
--A Lets ask sql server and findout--

SELECT v.my_message,
v.current_date_time
INTO dbo.t_hello_world
FROM dbo.v_hello_world_load AS v;

DROP TABLE IF EXISTS dbo.t_hello_world;
GO

CREATE TABLE dbo.t_hello_world
(my_message     VARCHAR(25) NOT NULL,
current_date_time DATETIME NOT NULL
                            DEFAULT GETDATE(),
CONSTRAINT PK_t_hello_world PRIMARY KEY CLUSTERED(my_message ASC)
);
GO

--Q What is the current date and time?
--A Lets ask sql server and findout--
--1) Reload data

TRUNCATE TABLE dbo.t_hello_world;

INSERT INTO dbo.t_hello_world
       SELECT v.my_message,
	          v.current_date_time
		FROM dbo.v_hello_world_load AS v;

--2) Review results
GO
SELECT t.*
   FROM dbo.v_hello_world_load AS t;
GO
CREATE PROCEDURE dbo.usp_hello_world_load
AS

/***********************************************************************************************************
NAME: dbo.v_hello_world_load
PURPOSE: Create the hello world - Load view

MODIFICATION LOG:
Ver      Date         Author       Description
-----   ---------    ----------    -------------------------------------------------------------------------
1.0     02/02/2025   Joshua       1. Built this script for EC IT143


RUNTIME
1s

NOTES:
This script exists to help me learn step 4 of 8 in the Answer Focused Approach for T-SQL DATA Manipulation

****************************************************************************************************************/

  BEGIN
     --1) Reload data
	 TRUNCATE TABLE dbo.t_hello_world;

INSERT INTO dbo.t_hello_world
       SELECT v.my_message,
	          v.current_date_time
		FROM dbo.v_hello_world_load AS v;

--2) Review results

SELECT t.*
   FROM dbo.v_hello_world_load AS t;
   END;

GO

