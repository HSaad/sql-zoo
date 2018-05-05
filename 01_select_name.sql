
-- SELECT names --

-- 1. Start with Y
/*
  Find the country that starts with Y
*/

SELECT name FROM world
  WHERE name LIKE 'Y%';

-- 2. Ends with y
/*
  Find the countries that end with y
*/

SELECT name FROM world
  WHERE name LIKE '%y';

-- 3. Contains x
/*
  Find the countries that contain the letter x.
*/

SELECT name FROM world
  WHERE name LIKE '%x%';

-- 4. End with land
/*
  Find the countries that end with land.
*/

SELECT name FROM world
  WHERE name LIKE '%land';

-- 5. Start with C and end with ia
/*
  Find the countries that start with C and end with ia.
*/

SELECT name FROM world
  WHERE name LIKE 'C%ia';

-- 6. Double o
/*
  Find the country that has oo in the name.
*/

SELECT name FROM world
  WHERE name LIKE '%oo%';

-- 7. Three or more a 
/*
  Find the countries that have three or more a in the name.
*/

SELECT name FROM world
  WHERE name LIKE '%a%a%a%';

-- 8. "T" second
/*
  Find the countries that have "t" as the second character
*/

SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name;

-- 9. "O" separated 
/*
  Find the countries that have two "o" characters separated by
  two others.
*/

SELECT name FROM world
 WHERE name LIKE '%o__o%';

-- 10. Four characters
/*
  Find the countries that have exactly four characters.
*/

SELECT name FROM world
 WHERE name LIKE '____';

-- 11. Country and capital city
/*
  Find the country where the name is the capital city.
*/

SELECT name
  FROM world
 WHERE name LIKE capital;

-- 12. Country plus "City"
/*
  Find the country where the capital is the country plus "City"
*/

SELECT name
  FROM world
 WHERE capital LIKE concat(name, ' City');

-- 13. Capital includes name of country
/*
  Find the capital and the name where the capital includes the
  name of the country.
*/

SELECT capital, name
  FROM world
 WHERE capital LIKE concat(name, '%');

-- 14. Capital extension of name of the country
/*
  Find the capital and the name where the capital is an 
  extension of name of the country.
*/

SELECT capital, name
  FROM world
 WHERE capital LIKE concat(name, '_%');

-- 15. Extension in capital
/*
  Show the name and the extension where the capital is an
  extension of name of the country.
*/

SELECT name, REPLACE(capital, name, '')
  FROM world
 WHERE capital LIKE concat(name, '_%');
