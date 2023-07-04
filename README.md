# DVDrentals
Querying and analyzing, using PostgreSQL, a Database of DVD rentals  
[Database used](https://www.postgresqltutorial.com/postgresql-getting-started/postgresql-sample-database/)  

## Index
Main topics for querying:
- [Ratings](ratings)
- [Customers](customers)
- [Rentals](rentals)

### Ratings
[rating.csv](ratings/rating.csv)  
Query to look at information about the movie ratings.
- rating    
Movie Ratings: PG, PG-13, NC-17, G and R
- num_films  
Number of films with each rating
- avg_rental_duration  
Average duration of the rental for each rating in days. NC-17 came up with the longest rental duration. 
- avg_rental_rate  
Average rental cost for every rating with the highest being PG-13 and lowest R.
- avg_length  
Average length of films in minutes for every movie rating. Longest average being PG-13 movies. 

### Customers
[countries.csv](customers/countries.csv)  
Query on customers' information according to country. 
- country  
Every country in the database.
- num_customers  
Number of customers from each country in the database.
- num_active  
Number of active customers for each country.
- num_inactive  
Number of inactive customers for each country.
- num_stores  
Number of stores in each country.

### Rentals
[categories.csv](rentals/categories.csv)   
Querying DVDs rented information according to movie category. 
- category  
Movie category.
- times_rented  
Number of times that film category was rented.
- perc_from_all  
Percentage rented from all rentals.
- avg_time_rented  
Average time the category was rented for in Days Hours: Munites: Seconds format.
- above_total_avg  
Boolean 1/0 variable whether the "avg_time_rented" is above the overall DVDs average rented time.  
- num_films  
Number of films in each category.  
- num_customers_renting  
Number of distinct customers from the 'times_rented'.   
  
[customers.csv](rentals/customers.csv)   
Query on top 10 customers with the most number of DVDs rentals.  
- customer_id  
Customer IDs.  
- avg_rental_time  
Average time customers rented DVDs.   
- num_rentals
Number of total DVDs rental by the customer.    
- above_avg_time  
1/0 variable whether the "avg_time_time" is above the overall DVDs average. 

