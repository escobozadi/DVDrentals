/*Looking at data from customers*/

-- Number of active and inactive customers
SELECT DISTINCT active, COUNT(active) FROM customer GROUP BY active;

CREATE TABLE customers_countries AS
	SELECT customer_id, store_id, active, country
		FROM customer
		JOIN address USING (address_id)
		JOIN city USING (city_id)
		JOIN country USING (country_id);

-- Number of customers and stores per country
WITH countries_data AS (SELECT country, 
	COUNT(customer_id) AS num_customers, 
	COUNT(DISTINCT store_id) AS num_stores
	FROM customers_countries
	GROUP BY country
	ORDER BY num_customers DESC, num_stores DESC)

/* 
	Looking at data per country, 
	num of customers,
	num of active customers,
	num of inactive customers,
	num of stores
*/
SELECT country, num_customers, num_active, num_inactive, num_stores 
	FROM countries_data 
	FULL OUTER JOIN (SELECT country, COUNT(active) AS num_active 
					 FROM customers_countries
					 WHERE active = 1 GROUP BY country) t3 USING (country)
	FULL OUTER JOIN (SELECT country, COUNT(active) AS num_inactive 
					 FROM customers_countries
					 WHERE active = 0 GROUP BY country) t2 USING (country)
	ORDER BY num_customers DESC, num_stores DESC, num_active DESC, num_inactive DESC;

DROP TABLE customers_countries;
