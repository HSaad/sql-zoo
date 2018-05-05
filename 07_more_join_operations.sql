-- 1. 1962 movies
/*
	List the films where the yr is 1962
*/

SELECT id, title
 FROM movie
 WHERE yr=1962;

-- 2.When was Citizen Kand released?
/*
	Give year of 'Citizen Kane'
*/

SELECT yr
 FROM movie
 WHERE title = 'Citizen Kane';

-- 3. Star Trek movies
/*
	List all of the Star Trek movies, including the id, title, and yr
	(all of these movies include the words Star Trek in the title). Order
	results by year.
*/

SELECT id, title, yr
  FROM movie
 WHERE title LIKE '%Star Trek%'
ORDER BY yr;

-- 4. id for actor Glenn Close
/*
	What id number does the actor 'Glenn Close' have?
*/

SELECT id
  FROM actor
 WHERE name = 'Glenn Close';

-- 5. id for Casablanca
/*
	What is the id of the film 'Casablanca'
*/

SELECT id
  FROM movie
 WHERE title = 'Casablanca';

-- 6. Cast list for Casablanca
/*
	Obtain the cast list for 'Casablanca'
*/

SELECT name 
  FROM actor 
 WHERE id IN (SELECT actorid
  FROM casting
 WHERE movieid = 11768);

-- 7. Alien cast list
/*
	Obtain the cast list for the film 'Alien'
*/

SELECT name 
  FROM actor 
 WHERE id IN (SELECT actorid
  FROM casting
 WHERE movieid = (SELECT id FROM movie WHERE title = 'Alien'));

-- 8. Harrison Ford movies
/*
	List the films in which 'Harrison Ford' has appeared
*/

SELECT title 
  FROM movie
 WHERE id IN (SELECT movieid FROM casting WHERE actorid IN 
 	(SELECT id FROM actor WHERE name = 'Harrison Ford'));

-- 9. Harrision Ford as a supporting actor
/*
	List the films where 'Harrsion Ford' has appeared -
	but not in the staring role.
*/

SELECT title 
  FROM movie
 WHERE id IN (SELECT movieid FROM casting WHERE actorid IN 
 	(SELECT id FROM actor 
 		WHERE name = 'Harrison Ford' AND ord != 1));

-- 10. Lead actores in 1962 movies
/*
	List the films together with the leading star for all 1962 films.
*/

SELECT title, name
  FROM casting 
  JOIN movie
   ON movieid = movie.id
  JOIN actor 
   ON actorid = actor.id
WHERE yr = 1962 AND ord = 1;

-- 11. Busy years for John Travolta
/*
	Which were the busiest years for 'John Travolta', show the year and 
	the number of movies he made each year for any year in which he
	made more than 2 movies. 
*/

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
where name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr,COUNT(title) AS c FROM
   movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
 where name='John Travolta'
 GROUP BY yr) AS t
);

-- 12. Lead actor in Julie Andrews movies
/*
	List the film title and the leading actor for all of the films 
	'Julie Andrews' played in. 
*/

SELECT title, name 
  FROM movie JOIN casting ON (movieid=movie.id 
                              AND ord=1)
             JOIN actor ON (actorid=actor.id)
WHERE movie.id IN (
 SELECT movieid FROM casting
  WHERE actorid IN (
   SELECT id FROM actor
     WHERE name='Julie Andrews'));

-- 13. Actors with 30 leading roles
/*
	Obtain a list, in alphabetical order, of actors who've had at least 30
	starring roles.
*/

SELECT actor.name
  FROM actor JOIN casting ON actor.id = casting.actorid
 WHERE ord = 1
  GROUP BY actor.name
   HAVING COUNT(actor.name) >= 30
 ORDER BY actor.name; 

-- 14. 
/*
	List the films released in the year 1978 ordered by the number of
	actors in the cast, then by title.
*/

SELECT title, COUNT(casting.actorid)
  FROM movie JOIN casting ON movie.id = casting.movieid
 WHERE yr = 1978
  GROUP BY title
 ORDER BY COUNT(casting.actorid) DESC, title; 

-- 15.
/*
	List all the people who have worked with 'Art Garfunkel'
*/

SELECT name 
  FROM actor JOIN casting ON actor.id = casting.actorid
 WHERE movieid IN 
  (SELECT movieid FROM casting WHERE actorid = 
  			(SELECT id FROM actor WHERE name = 'Art Garfunkel')) 
  AND name NOT LIKE 'Art Garfunkel';
