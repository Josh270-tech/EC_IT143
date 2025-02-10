USE EC_IT143_DA
--Q What is the total player salary per month?
--A Let's ask SQL Server and find out--

SELECT 'Total player salary per month' AS My_Message,
       GETDATE() AS current_date_time;
GO

DROP VIEW IF EXISTS dbo.v_total_salary_per_month;
GO

CREATE VIEW dbo.v_total_salary_per_month
AS
SELECT 'Total player salary per month' AS My_Message,
       GETDATE() AS current_date_time;
GO


/***********************************************************************************************************
NAME: dbo.v_total_salary_per_month
PURPOSE: Create the total player salary per month - Load view

MODIFICATION LOG:
Ver      Date         Author       Description
-----   ---------    ----------    -------------------------------------------------------------------------
1.0     02/02/2025   Joshua       1. Built this script for EC IT143

RUNTIME
1s

NOTES:
This script exists to help me learn step 4 of 8 in the Answer Focused Approach for T-SQL DATA Manipulation
****************************************************************************************************************/

SELECT 'Total player salary per month' AS My_Message,
       GETDATE() AS current_date_time;

--Q What is the total player salary per month?
--A Let's ask SQL Server and find out--



DROP TABLE IF EXISTS dbo.t_total_salary_per_month;
GO

CREATE TABLE dbo.t_total_salary_per_month
(as_of_date DATE NOT NULL,
 total_salary_per_month DECIMAL(18,2) NOT NULL,
 CONSTRAINT PK_t_total_salary_per_month PRIMARY KEY CLUSTERED (as_of_date)
);
GO

--1) Reload data
TRUNCATE TABLE dbo.t_total_salary_per_month;

INSERT INTO dbo.t_total_salary_per_month
       SELECT v.My_Message, 
	           v.current_date_time
FROM dbo.v_total_salary_per_month AS v;

--2) Review results
GO
SELECT *
FROM dbo.t_total_salary_per_month;
GO

CREATE PROCEDURE dbo.usp_total_salary_per_month_load
AS
/***********************************************************************************************************
NAME: dbo.usp_total_salary_per_month_load
PURPOSE: Create the total player salary per month - Load procedure

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
    TRUNCATE TABLE dbo.t_total_salary_per_month;
    
    INSERT INTO dbo.t_total_salary_per_month
    SELECT My_Message, current_date_time
    FROM dbo.v_total_salary_per_month;
    
    --2) Review results
    SELECT *
    FROM dbo.t_total_salary_per_month;
END;
GO
