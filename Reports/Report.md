Customer Churn Analysis Report

1. Introduction

Customer churn refers to the percentage of customers who stop using a company's service within a given period. Analyzing churn patterns helps businesses identify factors contributing to customer loss and take preventive measures. This report presents key findings from SQL-based analysis and visualization of churn trends using Python.

2. Key Findings from SQL Analysis

    - Total Customers: 7,043

    - Churned Customers: 1,869 (Approximately 26.5%)

    - High Churn Rate in Month-to-Month Contracts: Customers with month-to-month contracts have a significantly higher churn rate (~42%) compared to those with yearly or two-year contracts.

    - Internet Service Impact: Fiber optic users show a higher churn rate compared to DSL and customers with no internet service.

    - Payment Method Influence: Electronic check users exhibit the highest churn rate among payment methods.

    - Monthly Charges Effect: Higher monthly charges correlate with increased churn rates.

    - Tenure Relationship: New customers (0-1 year) show a much higher churn rate than long-term customers.

3. Visual Insights from Python Plots

    - Churn Rate by Contract Type: Month-to-month contracts have the highest churn, emphasizing the need for retention strategies like discounts or loyalty programs.

    - Churn Rate by Internet Service: Fiber optic users tend to churn more frequently, possibly due to cost or service dissatisfaction.

    - Churn Rate by Payment Method: Customers using electronic checks churn more, indicating potential issues with this payment mode.

    - Churn Rate by Monthly Charges: Higher charges lead to increased churn; businesses could introduce tiered pricing or discounts for high-paying customers.

    - Churn Rate by Tenure Group: Customers in their first year of service have the highest churn, emphasizing the importance of strong onboarding and customer engagement.

4. Conclusion & Recommendations

    - Customer Retention for Month-to-Month Plans: Introduce long-term incentives or discount offers.

    - Improve Fiber Optic Service: Address customer concerns regarding performance or cost.

    - Optimize Payment Methods: Investigate why electronic check users churn more and improve payment flexibility.

    - Reduce High Churn in New Customers: Implement better onboarding, personalized offers, and proactive engagement.

This analysis provides data-driven insights into churn patterns. Future work could involve building predictive models to anticipate churn and suggest targeted interventions.