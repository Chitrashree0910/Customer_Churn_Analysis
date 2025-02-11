-- Count Total Customers
SELECT COUNT(*) AS total_customers FROM customers;

--Distribution of contract types
SELECT contract, COUNT(*) AS count
FROM customers
GROUP BY contract
ORDER BY count DESC;

-- Distribution of Internet service types
SELECT InternetService, COUNT(*) AS count
FROM customers
GROUP BY InternetService
ORDER BY count DESC;