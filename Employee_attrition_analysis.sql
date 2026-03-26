CREATE DATABASE Employee_attrition;
use Employee_attrition;


-- Total Employees
SELECT COUNT(*) FROM employee_data;

-- Preview first 5 rows
SELECT * FROM employee_data LIMIT 5;

-- Check all column names
SHOW COLUMNS FROM employee_data;

-- Attrition Count
SELECT Attrition, COUNT(*) AS Count
FROM employee_data
GROUP BY Attrition;

-- Attrition by Department
SELECT Department, COUNT(*) AS Attrition_Count
FROM employee_data WHERE Attrition = 'Yes'
GROUP BY Department
ORDER BY Attrition_Count DESC;

-- Average Salary by Job Role
SELECT Job_Role, AVG(Monthly_Income) AS Avg_Salary
FROM employee_data
GROUP BY Job_Role
ORDER BY Avg_Salary DESC;

-- Gender Distribution
SELECT Gender, COUNT(*) AS Total_Employees
FROM employee_data
GROUP BY Gender;

-- Experience vs Attrition
SELECT Years_At_Company, COUNT(*) AS Attrition_Count
FROM employee_data
WHERE Attrition='Yes'
GROUP BY Years_At_Company
ORDER BY Years_At_Company;

-- Overtime Impact on Attrition
SELECT Over_Time, COUNT(*) AS Employees_Left
FROM employee_data
WHERE Attrition='Yes'
GROUP BY Over_Time;

 -- Marital Status vs Attrition
 SELECT Marital_Status, COUNT(*) AS Total,
SUM(Attrition = 'Yes') AS Left_Count
FROM employee_data
GROUP BY Marital_Status;

-- Job Satisfaction vs Attrition
SELECT Job_Satisfaction, COUNT(*) AS Total,
SUM(Attrition = 'Yes') AS Left_Count
FROM employee_data
GROUP BY Job_Satisfaction
ORDER BY Job_Satisfaction;

 -- Average Age & Income
SELECT Attrition,
ROUND(AVG(Age), 1) AS Avg_Age,
ROUND(AVG(Monthly_Income), 2) AS Avg_Income
FROM employee_data
GROUP BY Attrition;

-- Department with Highest Attrition
SELECT Department, COUNT(*) AS Total,
SUM(Attrition = 'Yes') AS Left_Count
FROM employee_data
GROUP BY Department
HAVING Left_Count > 50
ORDER BY Left_Count DESC;
