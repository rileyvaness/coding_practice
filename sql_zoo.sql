   /* SELECT basics 
   

Table
World: name, continent, area, population, gdp */
   
/* #1 Modify it to show the population of Germany */

SELECT population FROM world
WHERE name = 'Germany'

/* #2 Show the name and the population for 'Sweden', 'Norway' and 'Denmark'. */

SELECT name, population FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');


/* #3 Show the country and the area for countries with an area between 200,000 and 250,000. */

SELECT name, area FROM world
WHERE area BETWEEN 200000 AND 250000
  
    
    /* SELECT from WORLD

/* #1 #/

/* #2 */

/* #3 */

/* #4 */

/* #5 */

/* #6 */

/* #7 */

/* #8 */

/* #9 */

/* #10 */

/* #11 */

/* #12 */

/* #13 */
    
    /* The Join Operation 

Tables 
game: id, mdate, stadium, team1, team2
goal: matchid, teamid, player, game
eteam: id, teamname, coach 

//#1 Show all goals scored by German players

SELECT matchid, player FROM goal 
WHERE teamid = 'GER'
  
//#2 Show id, stadium, team1, team2 for just game 1012

SELECT id,stadium,team1,team2
FROM game 
WHERE id = 1012

//#3 Show the player, teamid, stadium and mdate for every German goal.

SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER'

//#4 Show the team1, team2 and player for every goal scored by a player called Mario.

SELECT team1, team2, player 
FROM game JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%'

//#5 Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10

SELECT player, teamid, coach,  gtime
FROM goal JOIN eteam on teamid = id
WHERE gtime<=10

//#6 List the the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.

SELECT mdate, teamname
FROM game JOIN eteam ON (team1=eteam.id) 
WHERE coach = 'Fernando Santos'

//#7 List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'.

SELECT player 
FROM goal JOIN game ON (matchid = id)
WHERE stadium = 'National Stadium, Warsaw'

//#8  In the Germany-Greece quarterfinal, show the name of all players who scored a goal against Germany.

SELECT DISTINCT player 
FROM game JOIN goal ON (id = matchid)
WHERE (team1 = 'GER' OR team2 = 'GER') 
AND teamid <> 'GER' 

//#9 Show teamname and the total number of goals scored.

SELECT teamname, COUNT(teamid) 
FROM  goal JOIN eteam ON (teamid = id)
GROUP BY teamname

//#10 Show the stadium and the number of goals scored in each stadium.

SELECT stadium, COUNT(*) 
FROM game JOIN goal ON (id = matchid)
GROUP BY stadium

//#11 For every match involving 'POL', show the matchid, date and the number of goals scored.

SELECT matchid, mdate, COUNT(*) 
FROM game JOIN goal ON (id = matchid)
WHERE team1 = 'POL' OR team2 = 'POL'
GROUP BY mdate,matchid

//#12 For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'

SELECT matchid, mdate, COUNT(*)
FROM game JOIN goal ON (id = matchid)
WHERE teamid = 'GER'
GROUP BY mdate, matchid

//#13 List every match with the goals scored by each team as shown. Sort your result by mdate, matchid, team1 and team2.
