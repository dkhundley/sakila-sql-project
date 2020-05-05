/* Again writing a subquery to pull Family-like movie genres */
WITH t1 AS (SELECT *
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
JOIN film f
ON f.film_id = fc.film_id
JOIN inventory i
ON i.film_id = f.film_id
JOIN rental r
ON r.inventory_id = i.inventory_id
WHERE c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music'))

/* Using subquery to get quartile results for rental durations */
SELECT t1.title, t1.name, t1.rental_duration, NTILE(4) OVER (ORDER BY rental_duration) AS standard_quartile
FROM t1
ORDER BY standard_quartile;
