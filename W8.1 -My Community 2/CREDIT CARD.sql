USE EC_IT143_DA;
--Q What are the total debits and credits?
--A Let's ask SQL Server and find out--

SELECT 'Total debits and credits' AS My_Message,
       GETDATE() AS current_date_time;
GO

DROP VIEW IF EXISTS dbo.v_total_transactions;
GO

CREATE VIEW dbo.v_total_transactions
AS
SELECT 'Total debits and credits' AS My_Message, GETDATE() AS current_date_time; 
GO 

/***********************************************************************************************************
NAME: dbo.v_total_transactions
PURPOSE: Create the total transactions - Load view

MODIFICATION LOG:
Ver      Date         Author       Description
-----   ---------    ----------    -------------------------------------------------------------------------
1.0     02/02/2025   Joshua       1. Built this script for EC IT143

RUNTIME
1s

NOTES:
This script exists to help me learn step 4 of 8 in the Answer Focused Approach for T-SQL DATA Manipulation
****************************************************************************************************************/

SELECT 'Total debits and credits' AS My_Message,
       GETDATE() AS current_date_time;

--Q What are the total debits and credits?
--A Let's ask SQL Server and find out--

DROP TABLE IF EXISTS dbo.t_total_transactions;
GO

CREATE TABLE dbo.t_total_transactions
(as_of_date DATE NOT NULL,
 total_debits DECIMAL(18,2) NOT NULL,
 total_credits DECIMAL(18,2) NOT NULL,
 CONSTRAINT PK_t_total_transactions PRIMARY KEY CLUSTERED (as_of_date)
);
GO

--1) Reload data

TRUNCATE TABLE dbo.t_total_transactions;

INSERT INTO dbo.t_total_transactions
       SELECT v.My_Message,
	          v.current_date_time
		FROM dbo.t_total_transactions AS v;
	
--2) Review results
GO
SELECT *
FROM dbo.t_total_transactions;
GO

CREATE PROCEDURE dbo.usp_total_transactions_load
AS
/***********************************************************************************************************
NAME: dbo.usp_total_transactions_load
PURPOSE: Load total transactions into the table

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
    TRUNCATE TABLE dbo.t_total_transactions;
    
    INSERT INTO dbo.t_total_transactions
    SELECT GETDATE()total_debits, total_credits
    FROM dbo.v_total_transactions;
    
    --2) Review results
    SELECT *
    FROM dbo.t_total_transactions;
END;
GO
