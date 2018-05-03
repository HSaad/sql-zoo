-- 1. Name, continent, population of all countries

SELECT name, continent, population FROM world;

-- 2. Large Countries with at least 2 million population

SELECT name FROM world
WHERE population >= 200000000;

-- 3. Per capita GDP for countries with at least 2 million population

SELECT name, GDP/population FROM world
WHERE population >= 200000000;

-- 4. South America In millions

SELECT name, population/1000000 FROM world
WHERE continent = 'South America';

-- 5. Population of France, Germany, Italy

SELECT name, population FROM world
WHERE name IN ('France', 'Germany', 'Italy');

-- 6. Countries with 'United' in the name

SELECT name FROM world
WHERE name LIKE '%United%';

-- 7. Two ways to be big

SELECT name, population, area FROM world
WHERE area > 3000000 OR population > 250000000;

-- 8.One or the other (but not both)

SELECT name, population, area FROM world
WHERE area > 3000000 XOR population > 250000000;

-- 9. Rounding: South America population in millions, GDP in billions

SELECT name, ROUND(population/1000000, 2), ROUND(GDP/1000000000, 2)
FROM world
WHERE continent = 'South America';

-- 10. Trillion dollars economies

SELECT name, ROUND(GDP/population, -3) FROM world
WHERE GDP >= 1000000000000;

-- 11. Name and capital have the same length

SELECT name, capital
  FROM world
 WHERE LENGTH(name) = LENGTH(capital);

-- 12. Matching name and capital

SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1) AND name <> capital;

-- 13. All the vowels: Country contains all vowels and no spaces

SELECT name
   FROM world
WHERE name LIKE '%a%'
  AND name LIKE '%e%'
  AND name LIKE '%i%'
  AND name LIKE '%o%'
  AND name LIKE '%u%'
  AND name NOT LIKE '% %';
