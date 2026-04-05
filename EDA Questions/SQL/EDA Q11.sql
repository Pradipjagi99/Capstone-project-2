-- EDA Q11 What are the demographics and preferences of the highest-spending customers?
SELECT 
customer_id,
ROUND(SUM(amount),2) AS total_spent
FROM payment
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;