-- EDA Q13 What are the busiest hours or days for each store location, and how does it impact staffing requirements?
SELECT 
HOUR(rental_date) AS hour,
COUNT(rental_id) AS rental_count
FROM rental
GROUP BY hour
ORDER BY rental_count DESC;