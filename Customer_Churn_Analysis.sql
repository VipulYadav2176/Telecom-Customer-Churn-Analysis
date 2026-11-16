
-- ==========================================
-- PROJECT: TELECOM CUSTOMER CHURN ANALYSIS
-- TOOL: MySQL
-- TABLE: customer_churn_cleaned
-- ==========================================

-- 1. OVERALL CHURN ANALYSIS
SELECT
    COUNT(*) AS Total_Customers,
    SUM(Churn) AS Churned_Customers,
    COUNT(*) - SUM(Churn) AS Active_Customers,
    ROUND(AVG(Churn) * 100, 2) AS Churn_Rate
FROM customer_churn_cleaned;


-- 2. CHURN BY COMPLAINTS
SELECT
    Complains,
    COUNT(*) AS Total_Customers,
    SUM(Churn) AS Churned_Customers,
    ROUND(AVG(Churn) * 100, 2) AS Churn_Rate
FROM customer_churn_cleaned
GROUP BY Complains
ORDER BY Churn_Rate DESC;


-- 3. CHURN BY TARIFF PLAN
SELECT
    `Tariff Plan`,
    COUNT(*) AS Total_Customers,
    SUM(Churn) AS Churned_Customers,
    ROUND(AVG(Churn) * 100, 2) AS Churn_Rate
FROM customer_churn_cleaned
GROUP BY `Tariff Plan`
ORDER BY Churn_Rate DESC;


-- 4. CHURN BY AGE GROUP
SELECT
    `Age Group`,
    COUNT(*) AS Total_Customers,
    SUM(Churn) AS Churned_Customers,
    ROUND(AVG(Churn) * 100, 2) AS Churn_Rate
FROM customer_churn_cleaned
GROUP BY `Age Group`
ORDER BY Churn_Rate DESC;


-- 5. CHURN BY SUBSCRIPTION LENGTH
SELECT
    CASE
        WHEN `Subscription  Length` <= 6 THEN '0-6 Months'
        WHEN `Subscription  Length` <= 12 THEN '7-12 Months'
        WHEN `Subscription  Length` <= 24 THEN '13-24 Months'
        ELSE '25+ Months'
    END AS Subscription_Group,
    COUNT(*) AS Total_Customers,
    SUM(Churn) AS Churned_Customers,
    ROUND(AVG(Churn) * 100, 2) AS Churn_Rate
FROM customer_churn_cleaned
GROUP BY Subscription_Group
ORDER BY Churn_Rate DESC;


-- 6. CHURN BY FREQUENCY OF USE
SELECT
    CASE
        WHEN `Frequency of use` <= 5 THEN 'Low Usage'
        WHEN `Frequency of use` <= 15 THEN 'Medium Usage'
        ELSE 'High Usage'
    END AS Usage_Group,
    COUNT(*) AS Total_Customers,
    SUM(Churn) AS Churned_Customers,
    ROUND(AVG(Churn) * 100, 2) AS Churn_Rate
FROM customer_churn_cleaned
GROUP BY Usage_Group
ORDER BY Churn_Rate DESC;
