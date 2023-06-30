/* Rental Analysis */
SELECT * FROM rental;
SELECT * FROM inventory;
SELECT * FROM film_category;

-- Percentage of DVDs rented per category 
SELECT name, 
	COUNT(rental_id)/(SELECT COUNT(*) FROM rental)::float*100 AS perc_rented 
	FROM rental
	JOIN inventory USING (inventory_id)
	JOIN film_category USING (film_id)
	JOIN category USING (category_id)
	GROUP BY category.name
	ORDER BY perc_rented DESC;

-- AVG time between rental and return date
SELECT AVG(return_date - rental_date) FROM rental;
