-- 1. Population of Germany

SELECT population FROM world
  WHERE name = 'Germany';

-- 2. Population of Sweden, Norway, and Denmark

SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- 3. Countries with an area between 200,000 and 250,000
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;