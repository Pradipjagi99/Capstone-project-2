-- EDA Q8 How does the availability and knowledge of staff affect customer ratings?
SELECT 
staff.staff_id,
COUNT(rental.rental_id) AS rentals,
AVG(DATEDIFF(return_date, rental_date)) AS avg_duration
FROM rental
JOIN staff USING (staff_id)
GROUP BY staff.staff_id;