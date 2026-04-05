-- EDA Q2 Which films have the highest rental rates and are most in demand?
SELECT 
film.title,
COUNT(rental.rental_id) AS rental_count,
film.rental_rate
FROM rental
JOIN inventory USING (inventory_id)
JOIN film USING (film_id)
GROUP BY film.title, film.rental_rate
ORDER BY rental_count DESC;