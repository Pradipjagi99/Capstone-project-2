-- EDA Q5  Are certain language films more popular among specific customer segments?
SELECT 
language.name,
COUNT(rental.rental_id) AS rental_count
FROM rental
JOIN inventory USING (inventory_id)
JOIN film USING (film_id)
JOIN language USING (language_id)
GROUP BY language.name
ORDER BY rental_count DESC;