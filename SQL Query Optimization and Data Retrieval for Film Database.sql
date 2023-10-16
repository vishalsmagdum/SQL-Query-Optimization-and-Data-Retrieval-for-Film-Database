#Answer the following questions using the database given in the LMS#


/*Write a SQL query to count the number of characters except for the spaces for each actor
Return the first 10 actors' name lengths along with their names */

SELECT CONCAT(first_name, '-', last_name) as Full_Name,
LENGTH(CONCAT(first_name,  last_name)) as Number_of_Characters
FROM actor LIMIT 10;

/* Used-
1.CONCAT
2.LENGTH
3.LIMIT
4.ALIASE
*/


/*List all Oscar awardees(Actors who received the Oscar award)
with their full names and the length of their names*/

SELECT CONCAT(first_name, '_', last_name) AS Full_Name,
LENGTH(CONCAT(first_name, last_name)) AS Number_of_Characters,
awards
FROM actor_award
WHERE awards= 'Oscar';

/* Used-
1.CONCAT
2.LENGTH
3.WHERE
4.ALIASE
*/

#Find the actors who have acted in the film ‘Frost Head.’

/*Tables I used- actor, film_actor, film_text.
We can use film table also instead of film_text, but it contains too many columns*/

SELECT CONCAT(first_name, '-', last_name) AS Actor_Name, 
title AS Movie_Name
FROM actor
JOIN film_actor ON actor.actor_id=film_actor.actor_id
JOIN film_text ON film_actor.film_id=film_text.film_id
WHERE title= 'FROST HEAD';

/* USED-
1. INNER JOIN/JOIN
2. CONCAT
3. ALIASE
4. WHERE*/

#Pull all the films acted by the actor ‘Will Wilson.’

SELECT CONCAT(first_name, ' ', last_name) AS Actor_Name, 
title AS Movie_Name
FROM actor
JOIN film_actor ON actor.actor_id=film_actor.actor_id
JOIN film_text ON film_actor.film_id=film_text.film_id
WHERE first_name= 'WILL' AND last_name='WILSON';

/*Used-
1.CONCAT
2.ALIASE
3.INNER JOIN/JOIN
4.WHERE
*/

#Pull all the films which were rented and return them in the month of May.

SELECT title AS Film_Name,rental_date,return_date FROM film
JOIN inventory ON film.film_id=inventory.film_id
JOIN rental ON inventory.inventory_id=rental.inventory_id
WHERE MONTH(return_date)= 5 AND MONTH(rental_date)= 5;

/*Used-
1.ALIASE
2.INNER JOIN/JOIN
3.WHERE
4.MONTH
*/

#Pull all the films with ‘Comedy’ category.

SELECT title AS Film_Name, name AS Film_Category FROM film_text
JOIN film_category ON film_text.film_id=film_category.film_id
JOIN category ON film_category.category_id=category.category_id
WHERE name= 'Comedy';

/*Used
1.ALIASE
2.INNER JOIN/JOIN
3.WHERE*/