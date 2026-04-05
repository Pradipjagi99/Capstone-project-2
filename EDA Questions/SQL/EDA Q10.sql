-- EDA Q10 Do specific film categories attract different age groups of customers?
SELECT 
category.name,
COUNT(rental.rental_id) AS rental_count
FROM rental
JOIN inventory USING (inventory_id)
JOIN film USING (film_id)
JOIN film_category USING (film_id)
JOIN category USING (category_id)
GROUP BY category.name
ORDER BY rental_count DESC;