-- EDA Q9 How does the proximity of stores to customers impact rental frequency?
SELECT 
CASE 
WHEN customer.store_id = inventory.store_id THEN 'Close'
ELSE 'Far'
END AS proximity,
COUNT(rental.rental_id) AS rental_count
FROM rental
JOIN customer USING (customer_id)
JOIN inventory USING (inventory_id)
GROUP BY proximity;