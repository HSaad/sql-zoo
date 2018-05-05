
-- SELECT from Nobel -- 

-- 1. Winners from 1950
/*
  Display Nobel prizes for 1950
*/

SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950;

-- 2. 1962 Literature
/*
  Display who won the 1962 prize for Literature
*/

SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature';

-- 3. Albert Einstein
/*
  Display the year and subject that won 'Albert Einstein' his prize.
*/

SELECT yr, subject 
  FROM nobel
 WHERE winner = 'Albert Einstein';

-- 4. Recent Peace Prizes
/*
  Give name of the 'Peace' winners since the year 2000 (including 2000)
*/

SELECT winner
  FROM nobel
 WHERE subject = 'Peace' 
  AND yr >= 2000;

-- 5. Literature in the 1980's
/*
  Show all details of the Literature prize winners for 1980 to 1989 inclusive
*/

SELECT * FROM nobel
 WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989;

-- 6. Only Presidents
/*
  Show all details of the presidential winners: T
	Theodore Roosevelt, Woodrow Wilson, Jimmy Carter, Barack Obama.
*/

SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama');

-- 7. John
/*
	Show the winners with the first name John
*/

SELECT winner
  FROM nobel
 WHERE winner LIKE 'John%';

-- 8. Chemistry and Physics from different years
/*
  Show the year, subject, and name of Physics winners for 1980
  together with the Chemistry winners for 1984.
*/

SELECT * FROM nobel
 WHERE (subject = 'Physics' AND yr = 1980) 
  OR (subject = 'Chemistry' AND yr = 1984);

-- 9. Exclude Chemists and Medics
/*
  Show the year, subject, and name of winners for 1980 
  excluding Chemistry and Medicine
*/

SELECT * FROM nobel 
  WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine');

-- 10. Early Medicine, Late Literature
/*
	Show year, subject, and name of people who won a 'Medicine' prize 
	in an early year (before 1910, not including 1910) together with winners 
	of a 'Literature' prize in a later year (after 2004, including 2004) 
*/

SELECT * FROM nobel 
 WHERE (subject = 'Medicine' AND yr < 1910) 
  OR (subject = 'Literature' AND yr >= 2004); 

-- 11. Umlaut
/*
	Find all details of the prize won by PETER GRÜNBERG 
*/

SELECT * FROM nobel
 WHERE winner LIKE 'Peter Grünberg';

-- 12. Apostrophe
/*
	Find all details of the prize won by EUGENE O'NEILL
*/

SELECT * FROM nobel
 WHERE winner LIKE 'Eugene O\'Neill';

-- 13. Knights of the realm
/*
	List the winners, year and subject where the winner starts with Sir. 
	Show the the most recent first, then by name order.
*/

SELECT winner, yr, subject FROM nobel
 WHERE winner LIKE 'Sir%'
 ORDER BY yr DESC, winner;

-- 14. Chemistry and Physics last
/*
	Show the 1984 winners and subject ordered by subject and winner name; 
	but list Chemistry and Physics last.
*/

SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'), subject, winner;
 