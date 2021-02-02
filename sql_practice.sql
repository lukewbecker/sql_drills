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

-- Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.

SELECT SUM(population)
FROM city
WHERE countrycode LIKE "JPN";

-- Query the difference between the maximum and minimum populations in CITY.

SELECT (MAX(population) - MIN(population))
FROM city;

-- Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's  key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeroes removed), and the actual average salary.
-- Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.

SELECT CEILING(AVG(salary) - AVG(REPLACE(salary, '0', '')))
FROM employees;

-- So I learned about the ceiling function, and the replace function in this exercise.

-- We define an employee's total earnings to be their monthly  worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as  space-separated integers.

SELECT salary * months AS total_earnings, COUNT(employee_id)
FROM employee
GROUP BY total_earnings
ORDER BY total_earnings DESC
LIMIT 1;


-- Query the following two values from the STATION table:

-- The sum of all values in LAT_N rounded to a scale of  decimal places.
-- The sum of all values in LONG_W rounded to a scale of  decimal places.

SELECT ROUND(SUM(lat_n), 2) AS lat, ROUND(SUM(long_w), 2) as lon
FROM station;

-- Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than  and less than . Truncate your answer to  decimal places.

SELECT ROUND(SUM(lat_n), 4)
FROM station
WHERE lat_n > 38.7880 AND lat_n < 137.2345

-- Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than . Truncate your answer to  decimal places.

SELECT ROUND(MAX(lat_n), 4)
FROM station
WHERE lat_n < 137.2345

-- Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than . Round your answer to  decimal places.

SELECT ROUND(long_w, 4)
FROM station
WHERE lat_n < 137.2345
ORDER BY lat_n DESC
LIMIT 1

-- Query the smallest Northern Latitude (LAT_N) from STATION that is greater than . Round your answer to  decimal places.

SELECT ROUND(MIN(lat_n), 4)
FROM station
WHERE lat_n > 38.7780

-- Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than . Round your answer to  decimal places.

SELECT ROUND(long_w, 4)
FROM station
WHERE lat_n > 38.7780
ORDER BY lat_n ASC
LIMIT 1;

/* Consider  and  to be two points on a 2D plane.

 happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
 happens to equal the minimum value in Western Longitude (LONG_W in STATION).
 happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
 happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points  and  and round it to a scale of  decimal places. */

SELECT ROUND(ABS(MIN(lat_n) - MAX(lat_n)) + ABS(MIN(long_w) - MAX(long_w)), 4)
FROM station;

-- Consider  and  to be two points on a 2D plane where  are the respective minimum and maximum values of Northern Latitude (LAT_N) and  are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.

-- Query the Euclidean Distance between points  and  and format your answer to display  decimal digits.

SELECT ROUND(SQRT(POWER(MIN(LAT_N)-MAX(LAT_N), 2) + POWER(MIN(LONG_W)-MAX(LONG_W), 2)), 4)
FROM station;

-- This quiz I learned more about the square root function and the power function in SQL. I'm 

-- weather station 20. So MySQL doesn't have a median command. That's interesting. But Oracle does. Weird.

SELECT ROUND(MEDIAN(Lat_N), 4)
FROM Station;

-- Triangles problem:

SELECT 
    CASE 
        WHEN A >= (B + C) OR B >= (A + C) OR C >= (A + B) THEN 'Not A Triangle'
        WHEN A = B AND A = C THEN 'Equilateral'
        WHEN A = B OR B = C OR A = C THEN 'Isosceles'
        ELSE 'Scalene'
    END
FROM TRIANGLES;

-- Found the city population sum in Asia:

SELECT SUM(c1.population)
FROM city AS c1
INNER JOIN country AS c2
ON c1.countrycode = c2.code
WHERE continent LIKE 'Asia';

-- Finding all city names in Africa
SELECT c1.name
FROM city AS c1
INNER JOIN country AS c2
ON c1.countrycode = c2.code
WHERE continent LIKE 'Africa';


-- Finding the population of each continent:
SELECT country.continent, FLOOR(AVG(city.population))
FROM city
INNER JOIN country
ON city.countrycode = country.code
GROUP BY country.continent;

-- Drawing a triangle.

set @number = 21;
select repeat('* ', @number := @number - 1) from information_schema.tables;

-- Drawing the triangle backwards:

set @row = 0;
select repeat('* ', @row := @row + 1) from information_schema.tables
WHERE @row < 20;

-- Occupation Test:


SELECT
  concat(name, concat('(', concat(substr(occupation, 1, 1), ')')))
FROM occupations
ORDER BY name;

SELECT
  concat('There are a total of', concat(' ', concat(COUNT(occupation), concat(' ', concat(LOWER(occupation), 's.'))))) AS total
FROM occupations
GROUP BY occupation
ORDER BY total;

-- Student Marks:
SELECT IF(GRADE < 8, 'NULL', Name), Grade, Marks
FROM students 
JOIN grades
WHERE Marks BETWEEN Min_Mark AND Max_Mark
ORDER BY Grade DESC, Name;

-- SQL Codeup curriculum practice. This is using my access to the Codeup DB.

-- I'll need to join two tables together, and then show all the languages spoken with % in Santa Monica.
SELECT cl.language, cl.Percentage
FROM city AS c
INNER JOIN countrylanguage AS cl ON c.CountryCode = cl.CountryCode
WHERE name LIKE "Santa Monica"
ORDER BY cl.Percentage;

-- How many different countries in each region?

SELECT region, count(name) AS num_countries
FROM country
GROUP BY region
ORDER BY num_countries;

-- population of each region:

SELECT Region, SUM(co.population) AS pop
FROM country as co
GROUP BY Region
ORDER BY pop DESC;