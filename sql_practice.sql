-- SQL practice file.

SELECT release_year
FROM films
GROUP BY release_year
HAVING COUNT(title) > 200


-- HackerRank Weather Station Challenge

SELECT CITY
FROM STATION
WHERE ID % 2 = 0
GROUP BY CITY;

-- Weather station #4 challenge
SELECT (COUNT(CITY) - COUNT(DISTINCT CITY))
FROM STATION;

-- Point of this above exercise was to show how to do simple math in the SELECT command, and to utilize DISTINCT.

-- HackerRank SQL #5:

SELECT CITY AS c, LENGTH(CITY) AS l
FROM STATION
ORDER BY l DESC, c DESC
LIMIT 1;

SELECT CITY AS c, LENGTH(CITY) AS l
FROM STATION
ORDER BY l ASC, c ASC
LIMIT 1;



-- Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE lower(substring(CITY, 1, 1)) IN ('a', 'e', 'i', 'o', 'u');

-- Finding cities with the last letter being a vowel, requires one simple difference since I'm using the substring function. Nice!

SELECT DISTINCT CITY
FROM STATION
WHERE lower(substring(CITY, -1, 1)) IN ('a', 'e', 'i', 'o', 'u');

-- Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(SUBSTRING(CITY, 1, 1)) NOT IN ('a', 'e', 'i', 'o', 'u');


-- Finding The city names that don't end with a vowel:


SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(SUBSTRING(CITY, -1, 1)) NOT IN ('a', 'e', 'i', 'o', 'u');

-- Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(SUBSTRING(CITY, 1, 1)) NOT IN ('a', 'e', 'i', 'o', 'u')
OR LOWER(SUBSTRING(CITY, -1, 1)) NOT IN ('a', 'e', 'i', 'o', 'u');

-- Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(SUBSTRING(CITY, 1, 1)) NOT IN ('a', 'e', 'i', 'o', 'u')
AND LOWER(SUBSTRING(CITY, -1, 1)) NOT IN ('a', 'e', 'i', 'o', 'u');

-- Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

SELECT NAME
FROM STUDENTS
WHERE MARKS > 75
ORDER BY RIGHT(NAME, 3), ID ASC;

-- Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.

SELECT name
FROM Employee
ORDER BY name;

-- Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than 2000 per month who have been employees for less than 10 months. Sort your result by ascending employee_id.

SELECT name
FROM employee
WHERE salary > 2000 AND months < 10
ORDER BY employee_id ASC;

-- Query the total population of all cities in CITY where District is California.

SELECT SUM(population)
FROM city
WHERE district LIKE "California"

-- Query the average population of all cities in CITY where District is California.

SELECT AVG(population)
FROM city
WHERE district LIKE "California";

-- Query the average population for all cities in CITY, rounded down to the nearest integer.

SELECT ROUND(AVG(population), 0)
FROM city;