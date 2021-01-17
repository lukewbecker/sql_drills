-- SQL practice file.

SELECT release_year
FROM films
GROUP BY release_year
HAVING COUNT(title) > 200


