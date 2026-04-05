-- EDA Q15 How does the availability of films in different languages impact customer satisfaction and rental frequency?
SELECT 
language.name,
COUNT(rental.rental_id) AS rental_count,
AVG(DATEDIFF(return_date, rental_date)) AS avg_duration
FROM rental
JOIN inventory USING (inventory_id)
JOIN film USING (film_id)
JOIN language USING (language_id)
GROUP BY language.name;