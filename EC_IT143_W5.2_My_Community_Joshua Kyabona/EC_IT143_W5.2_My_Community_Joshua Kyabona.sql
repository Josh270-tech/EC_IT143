/*****************************************************************************************************************
NAME:    EC_IT143_W5.2_My_Community_Joshua Kyabona
PURPOSE: How do I translate My Communities data set questions into SQL statements

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     02/8/2025   Joshua       1. Built this script for EC IT440


RUNTIME: 
Xm Xs

NOTES: 
This is where I talk about what this script is, why I built it, and other stuff...
 
******************************************************************************************************************/

-- Q1: How do I translate My Communities data set questions into SQL statements?
-- A1: Lets see the sql code below

SELECT GETDATE() AS my_date;

--MyFC---
--1. How many players have a monthly salary above $150,000?
SELECT COUNT(*) AS players_above_150k 
FROM tblPlayerFact
WHERE mtd_salary > 150000;

---2. What percentage of our budget is allocated to player salaries?
SELECT (SUM(mtd_salary) / 2000000) * 100 AS budget_percentage
 FROM tblPlayerFact;

---3. How do our player salaries compare to those of competing FCs?
 SELECT 
    'Our Team' AS team, 
    MIN(mtd_salary) AS min_salary, 
    MAX(mtd_salary) AS max_salary
FROM tblPlayerFact

UNION ALL 

SELECT 
    'Competing FCs' AS team, 
    MIN(mtd_salary) AS min_salary, 
    MAX(mtd_salary) AS max_salary
FROM competing_fc_salaries;

--  Another student
--How are the top 10 highest paid players.

SELECT  pl_id, mtd_salary
FROM tblPlayerFact
ORDER BY mtd_salary DESC 
LIMIT 10;

--Simpson

--1.What is the total number of transactions?

  SELECT COUNT(*) AS total_transactions
FROM FBS_Viza_Costmo;

--2.What is the earliest transaction date?
 SELECT MIN(Date) AS earliest_transaction_date
FROM FBS_Viza_Costmo;
---3. What is the total amount of debits?
SELECT SUM(Debit) AS total_debits
FROM FBS_Viza_Costmo
WHERE Debit IS NOT NULL;
--4. How much does Homer Make?
 --From another student

SELECT SUM(Credit) AS total_income
FROM FBS_Viza_Costmo
WHERE Member_Name = 'Homer Simpson' AND Credit IS NOT NULL;
