/* Rental Analysis */
SELECT * FROM rental;
SELECT * FROM inventory;
SELECT * FROM film_category;

CREATE TABLE rental_data AS 
	SELECT category_id, film_id, inventory_id, rental_id, customer_id,
	staff_id, store_id, rental_date, return_date, name 
	FROM rental
	JOIN inventory USING (inventory_id)
	JOIN film_category USING (film_id)
	JOIN category USING (category_id);

-- AVG time between rental and return date: time rented
SELECT AVG(return_date - rental_date) FROM rental;

/* Categories */
/* 
Number and Percentage of DVDs rented per category
Avg time rented for every category of film,
boolean flag if time rented for the category is higher than the avg time rented for all,
number of distinct films in each category,
number of distinct customers renting the category of film
*/
SELECT name category,
	COUNT(rental_id) times_rented,
	COUNT(rental_id)/(SELECT COUNT(*) FROM rental)::float*100 AS perc_from_all, 
	AVG(return_date - rental_date) AS avg_time_rented, 
	(CASE 
	 	WHEN AVG(return_date - rental_date) > (SELECT AVG(return_date - rental_date) FROM rental) 
	 		THEN 1 ELSE 0 END) above_total_avg,
	COUNT(DISTINCT film_id) num_films,
	COUNT(DISTINCT customer_id) num_customers_renting
	FROM rental_data GROUP BY name
	ORDER BY times_rented DESC;

/* Customers */
-- Avg number of rentals per customer
SELECT AVG(num_rentals) 
	FROM (SELECT customer_id, COUNT(customer_id) num_rentals 
		  FROM rental GROUP BY customer_id) customers; -- 26.7

-- Top 10 customers with most rentals and the avg time they rent for 
SELECT customer_id, AVG(return_date - rental_date) avg_rental_time, 
	COUNT(customer_id) num_rentals,
	(CASE 
	 	WHEN AVG(return_date - rental_date) > (SELECT AVG(return_date - rental_date) FROM rental) 
	 		THEN 1 ELSE 0 END) above_avg_time
	FROM rental 
	GROUP BY customer_id 
	ORDER BY num_rentals DESC
	LIMIT 10;

-- count of category films in inventory
SELECT name, COUNT(inventory_id) FROM rental_data GROUP BY name;

DROP TABLE rental_data;


