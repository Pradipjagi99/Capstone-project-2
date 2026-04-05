 -- EDA Q6  How does customer loyalty impact sales revenue over time?
 SELECT 
customer_id,
ROUND(SUM(amount),2) AS total_revenue
FROM payment
GROUP BY customer_id
ORDER BY total_revenue DESC;
 
