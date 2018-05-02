-- 1. Countries that starts with Y

SELECT name FROM world
  WHERE name LIKE 'Y%';

-- 2. Countries that ends with y

SELECT name FROM world
  WHERE name LIKE '%y';

-- 3. Countries that contain the letter x

SELECT name FROM world
  WHERE name LIKE '%x%';

-- 4. Countries that end with land

SELECT name FROM world
  WHERE name LIKE '%land';

-- 5. Countries that start with C and end with ia

SELECT name FROM world
  WHERE name LIKE 'C%ia';

-- 6. Country that has oo in the name

SELECT name FROM world
  WHERE name LIKE '%oo%';

-- 7. Countries with three or more a in the name

SELECT name FROM world
  WHERE name LIKE '%a%a%a%';

-- 8. Countries with "t" as the second character

SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name;

-- 9. Countries with two "o" separated by two other characters

SELECT name FROM world
 WHERE name LIKE '%o__o%';

-- 10. Countries with four characters

SELECT name FROM world
 WHERE name LIKE '____';

-- 11. Country where name is the capital city

SELECT name
  FROM world
 WHERE name LIKE capital;

-- 12. Country where capital is country plus "City"

SELECT name
  FROM world
 WHERE capital LIKE concat(name, ' City');

-- 13. Country where capital includes name of country

SELECT capital, name
  FROM world
 WHERE capital LIKE concat(name, '%');

-- 14. Countries where capital is extension of name of the country 

SELECT capital, name
  FROM world
 WHERE capital LIKE concat(name, '_%');

-- 15. Name and extension where capital extension of name of country

SELECT name, REPLACE(capital, name, '')
  FROM world
 WHERE capital LIKE concat(name, '_%');