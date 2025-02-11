-- Churn analysis based on the other customer attributes

-- Checking which payment method has the highest churn rate
SELECT PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;

-- Checking churn rate by tenure
SELECT
    CASE
        WHEN tenure BETWEEN 0 AND 12 THEN '0-1 year'
        WHEN tenure BETWEEN 13 AND 24 THEN '1-2 years'
        WHEN tenure BETWEEN 25 AND 48 THEN '3-4 years'
        ELSE '4+ years'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)/ COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY tenure_group
ORDER BY churn_rate DESC;

-- Checking the churn rate by monthly charges
SELECT
    CASE
        WHEN MonthlyCharges < 30 THEN 'Low ($0 - $30)'
        WHEN MonthlyCharges BETWEEN 30 AND 60 THEN 'Medium ($30 - 60)'
        ELSE 'High ($60+)'
    END AS Charge_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY Charge_group
ORDER BY churn_rate DESC;