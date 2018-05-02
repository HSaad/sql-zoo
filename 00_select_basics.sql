-- 1. Population of Germany

SELECT population FROM world
  WHERE name = 'Germany';

-- 2. Name and population for Sweden, Norway, and Denmark

SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- 3. 