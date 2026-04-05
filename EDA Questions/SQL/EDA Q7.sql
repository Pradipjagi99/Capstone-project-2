-- EDA Q7 Are certain film categories more popular in specific locations?
SELECT 
country.country,
category.name,
COUNT(rental.rental_id) AS rental_count
FROM rental
JOIN inventory USING (inventory_id)
JOIN film USING (film_id)
JOIN film_category USING (film_id)
JOIN category USING (category_id)
JOIN customer USING (customer_id)
JOIN address USING (address_id)
JOIN city USING (city_id)
JOIN country USING (country_id)
GROUP BY country.country, category.name
ORDER BY rental_count DESC;