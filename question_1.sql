/* Writing a subquery to pull Family-like movie genres */
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

/* Using the subquery to gather the film title, category of the title, and number of times the film was rented out */
SELECT t1.title AS film_title, t1.name AS genres, COUNT(t1.title) AS rental_count
FROM t1
GROUP BY 1, 2
ORDER BY genres, film_title;
