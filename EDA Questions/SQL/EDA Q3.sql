-- EDA Q3 Are there correlations between staff performance and customer satisfaction?
SELECT 
staff.staff_id,
COUNT(rental.rental_id) AS total_rentals,
SUM(payment.amount) AS total_revenue,
AVG(DATEDIFF(return_date, rental_date)) AS avg_duration
FROM rental
JOIN payment ON rental.rental_id = payment.rental_id
JOIN staff ON rental.staff_id = staff.staff_id
GROUP BY staff.staff_id
ORDER BY staff.staff_id asc;