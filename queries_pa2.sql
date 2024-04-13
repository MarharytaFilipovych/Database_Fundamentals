--  Retrieve a list of trails that have both "Advanced" and "Easy" difficulty levels and show their average scores.
SELECT DISTINCT t.name FROM (SELECT tr.trail_id FROM trail_rating tr
               INNER JOIN difficulty d ON tr.difficulty_id = d.id
               WHERE d.name = 'Advanced'  ) ta
INNER JOIN (SELECT tr.trail_id FROM trail_rating tr
            INNER JOIN difficulty d ON tr.difficulty_id = d.id
            WHERE d.name = 'Easy') te
ON te.trail_id = ta.trail_id
INNER JOIN trail t ON t.id = te.trail_id;


--  Identify users who have rated the same trail more than once, and display their names and the trail difficulty details.
SELECT
    u.name AS user_name,
    t.name AS trail_name,
    COUNT(t.id) AS rating_count
FROM user u
        INNER JOIN trail_rating tr ON u.id = tr.user_id
        INNER JOIN trail t ON tr.trail_id = t.id
    INNER JOIN difficulty d ON tr.difficulty_id = d.id
GROUP BY  u.id, t.id
HAVING COUNT(t.id) > 1
ORDER BY u.name;

;

-- List all trails with their average ratings:

SELECT t.name, ROUND(AVG(tr.score), 2) AS average_score FROM trail t 
INNER JOIN trail_rating tr ON t.id = tr.trail_id
GROUP BY t.id
ORDER BY average_score DESC;

-- Find the most popular locations based on the number of trails:

SELECT l.name, COUNT(t.id) AS quantity FROM location l 
INNER JOIN trail t ON l.id = t.location_id
GROUP BY l.id
ORDER BY quantity DESC;

-- Find the most popular locations based on the number of trails:

-- Find trails with both high ratings and reviews:
SELECT DISTINCT t.name, ROUND(AVG(tr.score), 2) AS average_score, COUNT(r.id) AS number_of_reviews FROM trail t 
INNER JOIN trail_rating tr ON t.id = tr.trail_id
INNER JOIN review r ON t.id = r.trail_id
GROUP BY t.id, r.id
HAVING average_score > 4 AND number_of_reviews > 6;

-- List users who have reviewed trails with the highest average score:

SELECT DISTINCT u.name, MAX(s.average_score) AS max_average_score
FROM user u
         INNER JOIN (
    SELECT t.name, u.id, AVG(tr.score) AS average_score
    FROM trail t
             INNER JOIN trail_rating tr ON t.id = tr.trail_id
             INNER JOIN user u ON tr.user_id = u.id
    GROUP BY t.id, u.id, t.name
    HAVING average_score > 4
) s ON s.id = u.id
GROUP BY u.id, u.name;


-- Retrieve trails that have ratings from users with the highest number of reviews:
SELECT t.name, tr.score, us.number_of_reviews AS max_reviews FROM trail t 
INNER JOIN trail_rating tr ON t.id = tr.trail_id
INNER JOIN user u ON tr.user_id = u.id
INNER JOIN
(SELECT u.id, u.name, COUNT(u.id) AS number_of_reviews FROM user u
INNER JOIN review r ON u.id = r.user_id
GROUP BY u.id
ORDER BY number_of_reviews DESC
LIMIT 1) us ON us.id = u.id
GROUP BY t.id, tr.id;

-- Find locations where the average trail length is above the overall average:
SELECT l.name, AVG(t.length) as average_length FROM location l 
INNER JOIN trail t ON l.id = t.location_id
GROUP BY l.id
HAVING average_length > (SELECT AVG(t.length) FROM trail t);


