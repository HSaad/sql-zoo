
-- Self join -- 

-- 1. Numberof stops
/*
	How many stops are in the database.
*/

SELECT COUNT(*)
  FROM stops;

-- 2. id for Craiglockhart
/*
	Find the id value for the stop 'Craiglockhart'
*/

SELECT id 
  FROM stops
 WHERE name = 'Craiglockhart';

-- 3. id for 4 LRT service
/*
	Give the id and the name for the stops on the '4' 'LRT' service
*/

SELECT id, name 
  FROM stops JOIN route ON route.stop = stops.id
 WHERE num = '4' AND company='LRT';

-- 4. Routes and stops
/*
	Give the number of routes that visit either London Road (149) or 
	Craiglockhart (53), with stops that have a count of 2.
*/

SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
 HAVING COUNT(*) = 2;

-- 5. From Craiglockhart to London Road 
/*
	Show the services from Craiglockhart to London Road.
*/

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop=149;

-- 6. Between Craiglockhart and London Road
/*
	Show the services between 'Craiglockhart' and 'London Road'.
*/

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'AND stopb.name='London Road';

-- 7. Using a self join
/*
	Give the list of all services which connect stops 115 and 137
	('Haymarket' and 'Leith')
*/

SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Haymarket'AND stopb.name='Leith';

-- 8. From Craighlockhart to Tollcross
/*
	Give a list of the services which connect the stops 'Craiglockhart'
	and 'Tollcross'
*/

SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'AND stopb.name='Tollcross';

-- 9. From Craighlockhart
/*
	Give a distinct list of the stops which may be reached from 
	'Craiglockhart' by taking one bus, including 'Craiglockhart' itself, 
	offered by the LRT company
*/

SELECT DISTINCT stopb.name, a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart';

-- 10. From Craiglockhart to Sighthill
/*
	Find the routes involving two buses that can go from Craiglockhart 
	to Sighthill.
*/

SELECT DISTINCT num1, company1, stops.name, num2, company2
FROM
  (SELECT a.num as num1, a.company as company1, b.stop as bstop
   FROM 
   route a JOIN route b JOIN stops s
   ON a.num=b.num AND s.id=a.stop
   WHERE s.name='Craiglockhart') CT
 JOIN 
  (SELECT d.num as num2, d.company as company2, c.stop as cstop
   FROM 
   route c JOIN route d JOIN stops s
   ON c.num=d.num AND c.company=d.company AND s.id=d.stop
   WHERE s.name='Sighthill') ST
 JOIN stops
ON bstop=cstop AND bstop=stops.id;
