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
Country, number of customers, number of active customers, number of inactive customers, number of stores in the country 

### Rentals
Category, number of DVDs rented, percentage rented per category, average time rented for every film category, 1/0 whether avg time rented is higher than overall avg time rented, number of distinct films in each category, number of distinct customers renting the category of film

Top 10 customers with most rentals and their average rental time 

