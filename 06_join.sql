
-- The JOIN operation -- 

-- 1. Germany goals
/*
	Show the matchid and player name for all goals 
	Germany
*/

SELECT matchid, player FROM goal 
  WHERE teamid = 'GER';

-- 2. Game 1012
/*
	Show id, stadium, team1, team2 for just game 1012
*/

SELECT DISTINCT id,stadium,team1,team2
  FROM game
  JOIN goal
   ON goal.matchid = game.id
  WHERE matchid = 1012;

-- 3. Every German goal
/*
	Show the player, teamid, stadium and mdate for
	every German goal.
*/

SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
 WHERE teamid = 'GER';

-- 4. Player called Mario
/*
	Show the team1, team2, and player for every goal scored by
	a player called Mario, player LIKE 'Mario%'
*/

SELECT team1, team2, player
  FROM game JOIN goal ON (id=matchid)
 WHERE player LIKE 'Mario%';

-- 5. All goals scored in first 10 minutes
/*
	Show player, teamid, coach, gtime for all goals scored in
	the first 10 minutes gtime<=10
*/

SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON teamid = id
 WHERE gtime<=10;

-- 6. Coach Fernando Santos 
/*
	List the dates of the matches and the name of the team
	in which 'Fernando Santos' was the team1 coach.
*/

SELECT mdate, teamname
  FROM game JOIN eteam ON team1 = eteam.id
 WHERE coach LIKE 'Fernando Santos';

-- 7. Goal at National Stadium, Warsaw
/*
	List the player for every goal scored in a game where the 
	stadium was 'National Stadium, Warsaw'
*/

SELECT player
  FROM goal
 JOIN game
  ON id = matchid
 WHERE stadium = 'National Stadium, Warsaw';

-- 8. Goal against Germany
/*
	Show the name of all players who scored a goal against 
	Germany.
*/

SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' AND teamid!='GER') 
    OR (team2='GER' AND teamid!='GER');

-- 9. Teamname and number of goals
/*
	Show teamname and the total number of goals scored.
*/

SELECT teamname, COUNT(*)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname
 ORDER BY teamname;

-- 10. Stadium and number of goals
/*
	Show the stadium and the number of goals scored in each
	stadium.
*/

SELECT stadium, COUNT(*)
  FROM game JOIN goal ON id=matchid
 GROUP BY stadium
 ORDER BY stadium;

-- 11. POL matches
/*
	For every match involving 'POL' show the matchid, date and
	the number of goals scored.
*/

SELECT id, mdate, COUNT(*)
  FROM goal JOIN game ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY game.id, game.mdate
ORDER BY game.id;

-- 12. GER match and number of goals
/*
	For every match where 'GER' scored, show matchid, match
	date and the number of goals scored by 'GER'
*/

SELECT id, mdate, COUNT(*)
  FROM goal JOIN game ON matchid = id 
 WHERE (teamid = 'GER')
GROUP BY game.id, game.mdate
ORDER BY game.id;

-- 13. Match and goals
/*
	List every match with the goals scored by each team as
	shown. 
*/

SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
 FROM game LEFT JOIN goal ON (id = matchid)
  GROUP BY mdate,team1,team2
  ORDER BY mdate, matchid, team1, team2;
