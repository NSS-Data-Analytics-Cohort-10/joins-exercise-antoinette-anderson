-- ** Movie Database project. See the file movies_erd for table\column info. **

-- 1. Give the name, release year, and worldwide gross of the lowest grossing movie.
SELECT film_title, release_year, worldwide_gross
FROM specs
LEFT JOIN revenue
ON specs.movie_id = revenue.movie_id
WHERE worldwide_gross < 38000000;

-- Semi-Tough released in 1977 had 37,187,139 worldwide gross.

-- 2. What year has the highest average imdb rating?

SELECT AVG(rating.imdb_rating), specs.release_year
FROM rating
LEFT JOIN specs
ON rating.movie_id = specs.movie_id
GROUP BY specs.release_year
ORDER BY AVG(rating.imdb_rating) DESC;

-- 1991

-- 3. What is the highest grossing G-rated movie? Which company distributed it?

SELECT film_title, mpaa_rating, worldwide_gross
FROM specs
INNER join revenue
ON specs.movie_id = revenue.movie_id
INNER JOIN distributors
ON specs.domestic_distributor_id = distributors.distributor_id
WHERE mpaa_rating ='G'
ORDER BY worldwide_gross DESC;

-- Toy Story 4


-- 4. Write a query that returns, for each distributor in the distributors table, the distributor name and the number of movies associated with that distributor in the movies 
-- table. Your result set should include all of the distributors, whether or not they have any movies in the movies table.
SELECT COUNT (specs.film_title) AS title_count, distributors.company_name
FROM specs
LEFT JOIN distributors
ON specs.domestic_distributor_id = distributors.distributor_id
GROUP BY company_name 
ORDER BY title_count DESC;


-- 5. Write a query that returns the five distributors with the highest average movie budget.

SELECT ROUND(AVG(film_budget)) AS avg_budget, distributors.company_name
FROM revenue
CROSS JOIN distributors
GROUP BY company_name
ORDER BY avg_budget DESC
LIMIT 5


-- 6. How many movies in the dataset are distributed by a company which is not headquartered in California? Which of these movies has the highest imdb rating?
SELECT COUNT(film_title) AS title_count, distributors.company_name, distributors.headquarters
FROM specs
CROSS JOIN distributors
WHERE headquarters NOT LIKE '%CA%'
GROUP BY distributors.headquarters, distributors.company_name

-- IFC in New York has 430
-- Vestron Pictures in Chicago has 430

SELECT DISTINCT film_title, distributors.company_name, imdb_rating
FROM specs
CROSS JOIN distributors
CROSS JOIN rating
WHERE headquarters NOT LIKE '%CA%' 
     AND imdb_rating >=9.0 
	  


-- 7. Which have a higher average rating, movies which are over two hours long or movies which are under two hours?
