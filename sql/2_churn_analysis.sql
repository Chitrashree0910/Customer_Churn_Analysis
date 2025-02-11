-- Checking the customer churn trends using aggregations and percentages

-- Checking how many customers have churned
SELECT COUNT (*) AS churned_customers
FROM customers
WHERE churn = 'Yes';

-- Checking churn percentage rate
SELECT
    ROUND(100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2)
    AS churn_rate_percentage
FROM customers;

-- Checking which contract type has the highest churn rate
SELECT contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY contract
ORDER BY churn_rate DESC; 

-- Checking which internet service type has the highest churn rate
SELECT InternetService,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2)AS churn_rate
FROM Customers
GROUP BY InternetService
ORDER BY churn_rate DESC;