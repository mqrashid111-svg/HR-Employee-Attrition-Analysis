CREATE DATABASE HR_Employee_Attrition;

USE HR_Employee_Attrition;

EXEC sp_rename 'dbo.[HR Employee Attrition Analysis 4]', 'HR_Employee';

SELECT * FROM HR_Employee;

SELECT COUNT(*) AS TotalEmployees
FROM HR_Employee;

SELECT DISTINCT Attrition
FROM HR_Employee;

SELECT COUNT(*) AS AttritionEmployees
FROM HR_Employee
WHERE Attrition = 1;

SELECT COUNT(*) AS ActiveEmployees
FROM HR_Employee
WHERE Attrition = 0;

SELECT
ROUND(
    COUNT(CASE WHEN Attrition = 1 THEN 1 END) * 100.0 / COUNT(*),
    2
) AS AttritionRate
FROM HR_Employee;

SELECT
ROUND(AVG(Age), 2) AS AverageAge
FROM HR_Employee;

SELECT
ROUND(AVG(MonthlyIncome), 2) AS AverageMonthlyIncome
FROM HR_Employee;

SELECT
ROUND(AVG(YearsAtCompany), 2) AS AverageYearsAtCompany
FROM HR_Employee;

SELECT
    Department,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS AttritionEmployees
FROM HR_Employee
GROUP BY Department
ORDER BY AttritionEmployees DESC;

SELECT
    JobRole,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS AttritionEmployees
FROM HR_Employee
GROUP BY JobRole
ORDER BY AttritionEmployees DESC;

SELECT
    Gender,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS AttritionEmployees
FROM HR_Employee
GROUP BY Gender
ORDER BY AttritionEmployees DESC;

SELECT
    EducationField,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS AttritionEmployees
FROM HR_Employee
GROUP BY EducationField
ORDER BY AttritionEmployees DESC;

SELECT
    MaritalStatus,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS AttritionEmployees
FROM HR_Employee
GROUP BY MaritalStatus
ORDER BY AttritionEmployees DESC;

SELECT
    OverTime,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS AttritionEmployees
FROM HR_Employee
GROUP BY OverTime
ORDER BY AttritionEmployees DESC;

SELECT
    BusinessTravel,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS AttritionEmployees
FROM HR_Employee
GROUP BY BusinessTravel
ORDER BY AttritionEmployees DESC;

SELECT
    CASE
        WHEN Age <= 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END AS AgeGroup,

    COUNT(*) AS TotalEmployees,

    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS AttritionEmployees

FROM HR_Employee

GROUP BY
    CASE
        WHEN Age <= 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END

ORDER BY AgeGroup;

SELECT
    CASE
        WHEN MonthlyIncome < 5000 THEN 'Low Salary'
        WHEN MonthlyIncome BETWEEN 5000 AND 10000 THEN 'Medium Salary'
        ELSE 'High Salary'
    END AS SalarySlab,

    COUNT(*) AS TotalEmployees,

    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS AttritionEmployees

FROM HR_Employee

GROUP BY
    CASE
        WHEN MonthlyIncome < 5000 THEN 'Low Salary'
        WHEN MonthlyIncome BETWEEN 5000 AND 10000 THEN 'Medium Salary'
        ELSE 'High Salary'
    END

ORDER BY TotalEmployees DESC;