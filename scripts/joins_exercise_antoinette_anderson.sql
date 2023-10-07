-- ** Movie Database project. See the file movies_erd for table\column info. **

-- 1. Give the name, release year, and worldwide gross of the lowest grossing movie.
SELECT film_title, release_year, worldwide_gross
FROM specs
LEFT JOIN revenue
ON specs.movie_id = revenue.movie_id
WHERE worldwide_gross < 38000000;

-- Semi-Tough released in 1977 had 37,187,139 worldwide gross.

-- 2. What year has the highest average imdb rating?

SELECT DISTINCT release_year, imdb_rating
FROM specs
LEFT JOIN rating
ON specs.movie_id = rating.movie_id
WHERE imdb_rating >=9.0;

-- 2008

-- 3. What is the highest grossing G-rated movie? Which company distributed it?
SELECT 

-- 4. Write a query that returns, for each distributor in the distributors table, the distributor name and the number of movies associated with that distributor in the movies 
-- table. Your result set should include all of the distributors, whether or not they have any movies in the movies table.

-- 5. Write a query that returns the five distributors with the highest average movie budget.

-- 6. How many movies in the dataset are distributed by a company which is not headquartered in California? Which of these movies has the highest imdb rating?

-- 7. Which have a higher average rating, movies which are over two hours long or movies which are under two hours?