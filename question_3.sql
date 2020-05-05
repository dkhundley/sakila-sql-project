/* Creating a subquery to get family-oriented genre quartiles */
WITH t1 AS (SELECT c.name AS genre, NTILE(4) OVER (ORDER BY f.rental_duration) AS standard_quartile
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
JOIN film f
ON f.film_id = fc.film_id
WHERE c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')
ORDER BY genre, standard_quartile)

/* Using subquery to count the number of genre movies in each quartile */
SELECT t1.genre, t1. standard_quartile, COUNT(*)
FROM t1
GROUP BY 1, 2
ORDER BY genre, standard_quartile;
