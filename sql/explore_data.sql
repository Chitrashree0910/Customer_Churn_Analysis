-- DATA EXPLORATION AND CLEANING

-- Data Exploration

-- Checking all table names in the database
SELECT name FROM sqlite_master WHERE type = 'table';

-- Displaying the structure of the 'customers' table
PRAGMA table_info(customers);

-- Displaying the first 5 rows to inspect data
SELECT * FROM customers LIMIT 5;

-- Counting the total number of rows
SELECT COUNT(*) FROM customers;

-- Checking for the missing values(like NULLs) in each column
SELECT
    SUM(CASE WHEN customerID IS NULL THEN 1 ELSE 0 END) AS missing_customerID,
    SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS missing_gender,
    SUM(CASE WHEN SeniorCitizen IS NULL THEN 1 ELSE 0 END) AS missing_SeniorCitizen,
    SUM(CASE WHEN Partner IS NULL THEN 1 ELSE 0 END) AS missing_Partner,
    SUM(CASE WHEN Dependents IS NULL THEN 1 ELSE 0 END) AS missing_Dependents,
    SUM(CASE WHEN tenure IS NULL THEN 1 ELSE 0 END) AS missing_tenure,
    SUM(CASE WHEN MonthlyCharges IS NULL THEN 1 ELSE 0 END) AS missing_MonthlyCharges,
    SUM(CASE WHEN TotalCharges IS NULL THEN 1 ELSE 0 END) AS missing_TotalCharges,
    SUM(CASE WHEN Churn IS NULL THEN 1 ELSE 0 END) AS missing_Churn
FROM customers;

-- Checking for the unique values in categorical column
SELECT DISTINCT gender FROM customers;
SELECT DISTINCT SeniorCitizen FROM customers;
SELECT DISTINCT Partner FROM customers;
SELECT DISTINCT Dependents FROM customers;
SELECT DISTINCT Churn FROM customers;

-- Data Cleaning

-- Convert 'TotalCharges'from TEXT to REAL(float)
ALTER TABLE customers ADD COLUMN TotalCharges_REAL REAL;

-- Copy data from old TotalCharges column (convert to REAL, set NULL if conversion fails)
UPDATE customers
SET TotalCharges_REAL = CASE
    WHEN TotalCharges = '' THEN NULL
    ELSE CAST(TotalCharges AS REAL)
END;

-- Drop the old TEXT column
ALTER TABLE customers DROP COLUMN TotalCharges;

-- Rename the new column to replace the old one
ALTER TABLE customers RENAME COLUMN TotalCharges_REAL TO TotalCharges;

-- Verifying the change
PRAGMA table_info(customers);

-- Replace 'No Internet Service' and 'No Phone Service' with 'NO'
UPDATE customers SET Multiplelines = 'No' WHERE Multiplelines = 'No phone service';
UPDATE customers SET OnlineSecurity = 'No' WHERE OnlineSecurity = 'No internet service';
UPDATE customers SET OnlineBackup = 'No' WHERE OnlineBackup = 'No internet service';
UPDATE customers SET DeviceProtection = 'No' WHERE DeviceProtection = 'No internet service';
UPDATE customers SET TechSupport = 'No' WHERE TechSupport = 'No internet service';
UPDATE customers SET StreamingTV = 'No' WHERE StreamingTV = 'No internet service';
UPDATE customers SET StreamingMovies = 'No' WHERE StreamingMovies = 'No internet service';

-- Verifying Changes
SELECT DISTINCT MultipleLines, OnlineSecurity, OnlineBackup, DeviceProtection, TechSupport, StreamingTV, StreamingMovies FROM customers;