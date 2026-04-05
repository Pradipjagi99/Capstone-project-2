-- EDA Q1 What are the purchasing patterns of new customers versus repeat customers?-- 
SELECT 
customer_id,
COUNT(rental_id) AS total_rentals
FROM rental
GROUP BY customer_id
order by total_rentals desc;
