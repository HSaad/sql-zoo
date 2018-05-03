-- 1. Bigger than Russia
/*
List each country name where the population is larger than
that of 'Russia'.
*/

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia');

-- 2. Richer than UK
/*
	Show the countries in Europe with a per capita GDP greater
	than 'United Kindom'
*/

SELECT name FROM world
 WHERE continent = 'Europe'
 AND GDP/population > 
  (SELECT GDP/population FROM world
    WHERE name='United Kingdom');

-- 3. Neighbours of Argentina and Australia
/*
	List the name and continent of countries in the continents
	containing either Argentina or Australia. Order by name of
	the country.
*/

SELECT name, continent FROM world
 WHERE continent IN
  (SELECT continent FROM world
    WHERE name IN ('Argentina', 'Australia'))
 ORDER BY name;

-- 4. Between Canada and Poland
/*
	Which country has a population that is more than Canada but
	less than Poland? SHow the name and population.
*/

SELECT name, population FROM world
 WHERE population > 
  (SELECT population FROM world
    WHERE name LIKE 'Canada')
 AND population < 
  (SELECT population FROM world
    WHERE name LIKE 'Poland');

-- 5. Percentages of Germany
/*
	Show the name and the population of each country in 
	Europe.Show the population as a percentage of the population of Germany.
*/

SELECT name, REPLACE(ROUND(population /(SELECT population FROM world WHERE name LIKE 'Germany'), 2) * 100, '.00', '%') 
  FROM world
 WHERE continent = 'Europe';

-- 6. Bigger than every country in Europe
/*
	Which countries have a GDP greater than every country in 
	Europe? Give the name only.
*/

SELECT name FROM world
 WHERE GDP > ALL (SELECT GDP
                    FROM world
                  WHERE GDP > 0
                   AND continent = 'Europe'); 

-- 7. Largest in each continent
/*
	Find the largest country (by area) in each continent, show
	the continent, the name and the area.
*/

SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND population>0)

-- 8. First country of each continent (alphabetically)
/*
	List each continent and the name of the country that comes
	first alphabetically.
*/

SELECT continent, MIN(name) FROM world
 GROUP BY continent
 ORDER BY continent;

-- 9.
/*
	Find the continents where all countries have a population
	<= 250000000. Then find the names of the countries 
	associated with these continents. Show name, continent and
	population.
*/

SELECT name, continent, population
  FROM world x
 WHERE 25000000 > ALL
  (SELECT population FROM world y 
    WHERE x.continent = y.continent 
    AND y.population > 0);

-- 10.
/*
	Some countries have populations more than three times
	that of any of their neighbours (in the same continent). Give
	the countries and continents.
*/

SELECT name, continent
  FROM world x
 WHERE population >= ALL
  (SELECT population * 3 FROM world y 
    WHERE x.continent = y.continent 
    AND y.population > 0 
    AND x.name != y.name);
