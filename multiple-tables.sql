/*
Lab | SQL Joins on multiple tables
In this lab, you will be using the Sakila database of movie rentals.
*/

-- 1 Write a query to display for each store its store ID, city, and country.
SELECT store_id, city, country FROM sakila.store
JOIN sakila.address USING (address_id)
JOIN sakila.city USING (city_id)
JOIN sakila.country on city.country_id = country.country_id;

-- 2 Write a query to display how much business, in dollars, each store brought in.
SELECT store_id, sum(amount) FROM sakila.staff
JOIN sakila.payment USING (staff_id);

-- 3 What is the average running time of films by category?
SELECT name, round(avg(length),0) AS avg_time FROM film_category
JOIN film USING (film_id)
JOIN category USING (category_id)
GROUP BY name;

-- 4 Which film categories are longest?
SELECT name, round(avg(length),0) AS avg_time FROM film_category
JOIN film USING (film_id)
JOIN category USING (category_id)
GROUP BY name
ORDER BY avg_time desc
LIMIT 3;

-- 5 Display the most frequently rented movies in descending order.
SELECT title, count(rental_id) AS frequency FROM sakila.rental
JOIN inventory USING (inventory_id)
JOIN film USING (film_id)
GROUP BY title
ORDER BY frequency DESC;

-- 6 List the top five genres in gross revenue in descending order.
SELECT name, sum(amount) AS revenue FROM sakila.category
JOIN film_category USING (category_id)
JOIN inventory USING (film_id)
JOIN rental USING (inventory_id)
JOIN payment USING (rental_id)
GROUP BY name
ORDER BY revenue
LIMIT 5;

-- 7 Is "Academy Dinosaur" available for rent from Store 1?
SELECT distinct title, store_id FROM sakila.store
JOIN inventory USING (store_id)
JOIN film USING (film_id)
WHERE title = "Academy Dinosaur" and store_id =1;

