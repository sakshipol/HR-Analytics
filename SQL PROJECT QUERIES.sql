use insuranceanalysis;
# KPI:1 -- Number of Invoices by Account Executive:
SELECT 'Account Executive', COUNT('Account Executive') AS ' Total No. of Invoices'
FROM invoice
GROUP BY 'Account Executive'
ORDER BY COUNT('Account Executive') DESC;

# KPI2: Yearly Meeting Count:
SELECT 
    YEAR(STR_TO_DATE(meeting_date, '%Y-%m-%d')) AS year, 
    COUNT(*) AS meeting_count
FROM 
    meeting
WHERE 
    meeting_date IS NOT NULL
    AND STR_TO_DATE(meeting_date, '%Y-%m-%d') IS NOT NULL
GROUP BY 
    YEAR(STR_TO_DATE(meeting_date, '%Y-%m-%d'))
ORDER BY 
    year;
    
 # KPI3.1: Cross Sell--Target, Achive, new
  SELECT 
    'Cross Sell' AS KPI_Type,
    COUNT(DISTINCT policy_number) AS Target,  -- Count of distinct policies for target
    SUM(Amount) AS Achieve,                   -- Total amount achieved (revenue)
    SUM(Amount) - COUNT(DISTINCT policy_number) AS New  -- New calculation (difference between target and achieve)
FROM brokerage
WHERE renewal_status = 'Endorsement'; -- Cross Sell policies are typically marked as 'Endorsement'

## KPI3.2: New-Target,Achive,new


SELECT 
    'New' AS KPI_Type,
    COUNT(DISTINCT policy_number) AS Target,  -- Count of distinct 'New' policies for target
    SUM(Amount) AS Achieve,                    -- Total amount for 'New' policies
    SUM(Amount) - COUNT(DISTINCT policy_number) AS New  -- New calculation (difference between target and achieve)
FROM brokerage
WHERE renewal_status = 'New';  -- Filter for policies marked as 'New'

# KPI3.3 Renewal-Target, Achive,new

SELECT 
    'Renewal' AS KPI_Type,
    COUNT(DISTINCT policy_number) AS Target,  -- Count of distinct 'Renewal' policies for target
    SUM(Amount) AS Achieve,                    -- Total amount for 'Renewal' policies
    SUM(Amount) - COUNT(DISTINCT policy_number) AS New  -- New calculation (difference between target and achieve)
FROM brokerage
WHERE renewal_status = 'Renewal';  -- Policies marked as 'Renewal'

# KPI4: Stage Funnel by Revenue:

SELECT stage, SUM(revenue_amount) AS revenue
FROM opportunity
GROUP BY stage;

# KPI5: Number of Meetings by Account Executive
SELECT 
    `Account Executive` AS account_executive, 
    COUNT(*) AS meeting_count
FROM 
    meeting
WHERE 
    `Account Executive` IS NOT NULL
GROUP BY 
    `Account Executive`
ORDER BY 
    meeting_count DESC;
    
# KPI6: Top Open Opportunity:

SELECT opportunity_name, SUM(revenue_amount) AS 'Top_Opportunity'
FROM opportunity
WHERE stage = 'Qualify Opportunity' OR stage = 'Propose Solution'
GROUP BY opportunity_name
ORDER BY SUM(revenue_amount) DESC
LIMIT 5;
