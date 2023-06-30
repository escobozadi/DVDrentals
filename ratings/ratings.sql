/* Looking at ratings */
	
/* Ratings (PG, PG-13, ...) 
	Number of films, avg rental duration, 
	avg rental cost, avg length of film */
SELECT rating, COUNT(*) AS num_films, 
	ROUND(AVG(rental_duration),2) AS avg_rental_duration, 
	ROUND(AVG(rental_rate),2) AS avg_rental_rate,
	ROUND(AVG(length),2) AS avg_length
	FROM film GROUP BY rating;

-- Looking at the number of categories found in each rating
SELECT rating, COUNT(DISTINCT name) 
	FROM film 
	JOIN film_category USING (film_id)
	JOIN category USING (category_id)
	GROUP BY rating;

-- looking at number of actors found in each rating
SELECT rating, COUNT(DISTINCT actor_id) FROM film 
	JOIN film_actor USING (film_id)
	GROUP BY rating;
	-- only PG-13 has all 200 actors in database

-- checking the categories for one rating
SELECT rating, name 
	FROM film 
	JOIN film_category USING (film_id)
	JOIN category USING (category_id)
	WHERE rating = 'G';
	

