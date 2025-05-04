create database hr_analytics;
use hr_analytics;
select * from hr_1;
select * from hr_2;



# Average Attrition rate for all Departments
SELECT Department, ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100, 2) AS Average_Attrition_Rate
FROM hr_1 GROUP BY Department;


# Average Hourly rate of Male Research Scientist
SELECT ROUND(AVG(HourlyRate), 2) AS Average_Hourly_Rate FROM Hr_1 WHERE Jobrole = 'Research Scientist' 
AND Gender = 'Male';
    
    
    
# Attrition rate Vs Monthly income stats    
SELECT h2.MonthlyIncome, SUM(CASE WHEN h1.Attrition = 'Yes' THEN 1 ELSE 0 END) AS TotalAttritions, COUNT(h1.Employee) AS TotalEmployees, 
CAST(SUM(CASE WHEN h1.Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(h1.EmpID) AS DECIMAL(10, 2)) AS AttritionRate FROM hr_1 h1
JOIN hr_2 h2 ON h1.EmpID = h2.EmpID GROUP BY h2.MonthlyIncome ORDER BY AttritionRate DESC;
    
    
    
    
# Average working years for each Department


SELECT 
    h1.department, 
    AVG(h2.YearsAtCompany) AS AverageWorkingYears
FROM 
    Hr_1 h1
JOIN 
    Hr_2 h2
ON 
    h1.EmpID = h2.EmpID
GROUP BY 
    h1.department;



# Job Role Vs Work life balance


SELECT 
    Hr_1.JobRole, 
    Hr_2.WorkLifeBalance, 
    COUNT(*) AS TotalEmployees
FROM 
    Hr_1
JOIN 
    Hr_2 
ON 
    Hr_1.EmpID = Hr_2.EmpID
GROUP BY 
    Hr_1.JobRole, 
    Hr_2.WorkLifeBalance
ORDER BY 
    Hr_1.JobRole, 
    Hr_2.WorkLifeBalance;
    
    
    
# Attrition rate Vs Year since last promotion relation


SELECT 
    hr_2.YearsSinceLastPromotion,
    ROUND(AVG(CASE WHEN hr_1.Attrition = 'Yes' THEN 1 ELSE 0 END) * 100, 2) AS Attrition_Rate
FROM 
    hr_1
JOIN 
    hr_2
ON 
    hr_1.EmpID = hr_2.EmpID
GROUP BY 
    hr_2.YearsSinceLastPromotion
ORDER BY 
    hr_2.YearsSinceLastPromotion;

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


















    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    
    
    
    
    
    
    
    