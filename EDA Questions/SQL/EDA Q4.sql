-- EDA Q4 Are there seasonal trends in customer behavior across different locations?
SELECT 
MONTH(payment_date) AS month,
ROUND(SUM(amount),2) AS total_revenue
FROM payment
GROUP BY MONTH(payment_date)
ORDER BY month;