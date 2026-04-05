-- EDA Q12 How does the availability of inventory impact customer satisfaction and repeat business?
SELECT 
film_id,
COUNT(inventory_id) AS inventory_count
FROM inventory
GROUP BY film_id;