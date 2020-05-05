/* Creating a subquery to pull number of rentals in each store in each month / year */
WITH t1 AS (SELECT DATE_PART('month', rental_date) AS month, DATE_PART('year', rental_date) AS year, store_id, COUNT (film_id) OVER (PARTITION BY DATE_TRUNC('month', rental_date) ORDER BY store_id) AS count_rentals
FROM rental r
JOIN inventory i
ON i.inventory_id = r.inventory_id)

/* Using subquery to count the total number of rentals in each store over month / year */
SELECT t1.month AS rental_month, t1.year AS rental_year, t1.store_id, COUNT(count_rentals) AS count_rentals
FROM t1
GROUP BY 1, 2, 3
ORDER BY count_rentals DESC;
