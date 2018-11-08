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
    
Table
World: name, continent, area, population, gdp */


/* #1 Show the name, continent and population of all countries. */

SELECT name, continent, population FROM world

/* #2 Show the name for the countries that have a population of at least 200 million. */

SELECT name FROM world
WHERE population >= 200000000

/* #3 Give the name and the per capita GDP for those countries with a population of at least 200 million. */

SELECT name, gdp/population
FROM world 
WHERE population >= 200000000

/* #4 Show the name and population in millions for the countries of the continent 'South America'. */

SELECT name, population/1000000
FROM world
WHERE continent = 'South America'

/* #5 Show the name and population for France, Germany, Italy */

SELECT  name, population 
FROM world 
WHERE name IN ('France', 'Germany', 'Italy')

/* #6  Show the countries which have a name that includes the word 'United' */

SELECT name
FROM world 
WHERE name LIKE '%united%'

/* #7 A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.
Show the countries that are big by area or big by population. Show name, population and area.*/

SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000

/* #8 Show the countries that are big by area or big by population but not both. Show name, population and area. */

SELECT name, population, area
FROM world
WHERE (area > 3000000 AND population < 250000000)
OR (area < 3000000 AND population > 250000000)

/* #9 For South America show population in millions and GDP in billions both to 2 decimal places. */

SELECT name, ROUND(population/1000000,2), ROUND(gdp/1000000000,2)
FROM world
WHERE continent = 'South America'

/* #10 Show per-capita GDP for the trillion dollar countries to the nearest $1000. */

SELECT name, ROUND(gdp/population, -3)
FROM world
WHERE gdp > 1000000000000

/* #11 Show the name and capital where the name and the capital have the same number of characters. */

SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital)

/* #12 Show the name and the capital where the first letters of each match. 
Don't include countries where the name and the capital are the same word. */

SELECT name, capital
FROM world
WHERE LEFT(name,1) = LEFT(capital,1) AND name <> capital

/* #13 Find the country that has all the vowels and no spaces in its name. */

SELECT name
FROM world
WHERE name  NOT LIKE '% %'
AND name LIKE '%a%'
AND name LIKE '%e%'
AND name LIKE '%i%'
AND name LIKE '%o%'
AND name LIKE '%u%'

      /* SELECT from Nobel
      
Table
Nobel: yr, subject, winner */

/* #1 Change the query shown so that it displays Nobel prizes for 1950. */

SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950

/* #2 Show who won the 1962 prize for Literature. */

SELECT winner
FROM nobel
WHERE yr = 1962
AND subject = 'Literature'

/* #3 Show the year and subject that won 'Albert Einstein' his prize. */

SELECT yr, subject
FROM nobel 
WHERE winner = 'Albert Einstein'

/* #4 Give the name of the 'Peace' winners since the year 2000, including 2000. */

SELECT winner
FROM nobel 
WHERE yr >= 2000
AND subject = 'peace'

/* #5 Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive. */

SELECT yr, subject, winner 
FROM nobel
WHERE yr >= 1980 AND yr <= 1989 
AND subject = 'literature'

/* #6Show all details of the presidential winners: Theodore Roosevelt, Woodrow Wilson, Jimmy Carter, Barack Obama */

SELECT * FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')

/* #7 Show the winners with first name John */

SELECT winner FROM nobel 
WHERE winner LIKE 'John%'

/* #8 Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984. */

SELECT yr, subject, winner
FROM nobel 
WHERE (yr = '1984' AND subject = 'Chemistry') OR (yr = '1980' AND subject = 'physics')

/* #9 Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine */

SELECT yr, subject, winner 
FROM nobel 
WHERE yr = '1980' AND subject NOT IN ('Chemistry', 'Medicine')

/* #10 Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) 
together with winners of a 'Literature' prize in a later year (after 2004, including 2004) */

SELECT yr, subject, winner 
FROM nobel
WHERE yr < 1910 AND subject = 'Medicine' OR yr >= 2004 AND subject = 'Literature'

/* #11 Find all details of the prize won by PETER GRÜNBERG */

SELECT yr, subject, winner  
FROM nobel 
WHERE winner LIKE 'peter gr%nberg'

/* #12 Find all details of the prize won by EUGENE O'NEILL */

SELECT * FROM nobel 
WHERE winner LIKE 'eugene o\'neill'

/* #13 List the winners, year and subject where the winner starts with Sir. 
Show the the most recent first, then by name order. */

SELECT winner, yr, subject 
FROM nobel 
WHERE winner  LIKE 'sir%' 
ORDER BY yr DESC, winner

/* #14 Show the 1984 winners and subject ordered by subject and winner name;
but list Chemistry and Physics last.*/

SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY subject IN ('Physics', 'Chemistry'), subject, winner

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
