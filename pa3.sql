-- 1. = with non-correlated subqueries result:
    
-- select the contents of all reviews written by EmilyParker.
    
/*SELECT r.content
FROM review r
WHERE r.user_id = (SELECT u.id FROM user u WHERE u.name = 'EmilyParker');*/
    
-- change the score of Majestic Peak to the 3.5 everywhere in trail_rating:

/*UPDATE trail_rating tr
SET tr.score = 3.5
WHERE tr.trail_id = (SELECT t.id FROM trail t WHERE t.name = 'Majestic Peaks');*/

-- delete reviews written by user with a password 'ForestWonder':
    
/*DELETE FROM review r
WHERE r.user_id = (SELECT u.id FROM user u WHERE u.password = 'ForestWonder');*/

    
-- 2. IN with non-correlated subqueries result: 
    
-- select trails (names), which were reviewed by user with id 15 (LucasTaylor):

/*SELECT t.name FROM trail t
WHERE t.id IN (SELECT r.trail_id FROM review r
              WHERE r.user_id = 15);*/
    
-- delete trails that are hard:
    
/*DELETE FROM trail t
WHERE t.difficulty_id IN (SELECT d.id FROM difficulty d WHERE d.name = 'Hard');*/

-- change trail score to 4 where difficulty level is easy    
    
/*UPDATE trail_rating tr
SET tr.score = 4
WHERE tr.difficulty_id IN (SELECT d.id FROM difficulty d WHERE d.name = 'Easy');*/


-- 3.NOT IN with non-correlated subqueries result

-- select locations where trails length is less then 7:

/*SELECT l.name FROM location l 
WHERE l.id NOT IN (SELECT t.location_id FROM trail t WHERE t.length > 7);*/

-- delete trails whose average scores are lower than 3.5 

/*DELETE FROM trail t 
WHERE t.id NOT IN (SELECT tr.id FROM trail_rating tr
                    JOIN trail t ON tr.trail_id = t.id
                    GROUP BY tr.trail_id
                    HAVING AVG(tr.score) > 3.5);*/

-- change the difficulty level in trail_rating table to 5 if the user who set it is noob (not pro or regular):

/*UPDATE trail_rating tr
SET tr.difficulty_id = 5
WHERE tr.user_id NOT IN (SELECT u.id FROM user u WHERE u.type IN ('regular', 'pro'));*/

-- 4.EXISTS with non-correlated sub-queries result

--  check for any users who have written more than 7 reviews and if those exist, select all trail names
/*SELECT t.name
FROM trail t
WHERE EXISTS (
    SELECT COUNT(*)
    FROM review r
    
    GROUP BY r.user_id
    HAVING COUNT(*) > 7
);*/

-- check if there are passwords in user able that start with 'River', if so, set user_id to 7 in review table, where review title starts with 'River'

/*UPDATE review r 
SET r.user_id = 7 
WHERE r.title LIKE 'River%' AND EXISTS (SELECT * FROM user u 
                                        WHERE u.user_password LIKE 'River%');*/

-- delete users whose email starts with 'a%' if there exists at least one location in Canada

/*DELETE FROM user u 
WHERE u.email LIKE 'a%' AND EXISTS (SELECT * FROM location l WHERE country = 'Canada')*/

-- 5.NOT EXISTS with non-correlated subqueries result

-- select user's name and email if there doesn't exist a review(s) made in year 2026;

/*SELECT u.name, u.email FROM user u 
WHERE NOT EXISTS (SELECT * FROM review r 
                  WHERE YEAR (r.review_date) = 2026);*/

-- update the elevations (make it 2 times shorter) of trails that have elevations higher than the average elevation, if there are no locations with latitude less than 0

/*UPDATE trail t 
SET t.elevation = t.elevation * 0.5
WHERE t.elevation > (SELECT AVG(t.elevation) as average_elevation from trail t
        GROUP BY t.id)
AND NOT EXISTS(SELECT * FROM location l 
            WHERE l.latitude < 0 );*/
-- delete reviews with dates in year 2026 if there are no names that start with 'Lucas' in user table   

/*DELETE FROM review r
WHERE YEAR(r.review_date) = 2026 
AND NOT EXISTS(SELECT * FROM user u 
                WHERE u.name LIKE 'Lucas%')*/


/*SELECT *
FROM user u
WHERE EXISTS (SELECT 1 FROM other_table WHERE condition);*/

-- 6. = with correlated sub-queries result
    
-- select reviews (titles and contents) with a score of 5:
    /*SELECT  DISTINCT r.title, r.content FROM review r 
WHERE r.user_id = (SELECT 1 FROM trail_rating tr WHERE r.user_id = tr.user_id AND tr.score =5)*/
    
-- delete users who have exactly two reviews associated with them:
/*DELETE FROM user u 
WHERE (SELECT COUNT(1) FROM review r WHERE r.user_id = u.id ) = 2;*/
    
-- set the length of a trail  based on the average score of trail ratings given by EmmaWilson

/*UPDATE trail t
SET t.length = (
    SELECT AVG(tr.score) AS average_score FROM trail_rating tr
    WHERE t.id = tr.trail_id
)
WHERE t.id = (
    SELECT tr.trail_idFROM user u
    JOIN  trail_rating tr ON tr.user_id = u.id
    WHERE u.name = 'EmmaWilson');*/

-- 7. IN with correlated sub-queries result

-- select information about trails that have been rated by users with a password starting with 'Rocky':

/*SELECT t.name, t.length, t.elevation, t.description
FROM trail t
WHERE t.id IN (
    SELECT tr.trail_id
    FROM trail_rating tr
             JOIN user u ON tr.user_id = u.id
    WHERE tr.trail_id = t.id AND u.user_password LIKE 'Rocky%'
);*/

-- update the length of trails to 0 for those trails that have an average rating score below 3:
    
/*UPDATE trail t
SET t.length = 0
WHERE t.id IN (SELECT tr.trail_id FROM trail_rating tr
               WHERE tr.trail_id = t.id
               GROUP BY tr.trail_id
               HAVING AVG(tr.score) < 3);*/
    
--  delete reviews from users who are categorized as 'noob':    
    
/*DELETE FROM review r 
WHERE r.user_id IN (SELECT u.id FROM user u WHERE u.id = r.user_id AND u.type in ('noob'));*/


-- 8. NOT IN with correlated sub-queries result  

-- select trails that do not have an average rating greater than 3

/*SELECT t.name, t.length, t.elevation
FROM trail t
WHERE t.id NOT IN (
    SELECT tr.trail_id FROM trail_rating tr
    WHERE tr.user_id = t.id
    GROUP BY tr.trail_id
    HAVING AVG(tr.score) > 3);*/

-- delete reviews from users who have not rated at least 4 trails

/*DELETE FROM review r
WHERE r.user_id NOT IN (
    SELECT tr.user_id
    FROM trail_rating tr
    WHERE tr.user_id = r.user_id
    GROUP BY tr.user_id
    HAVING COUNT(tr.user_id) > 3
);*/
    
-- update the elevation of trails to 1.2 times their current value for those trails that haven't received a review in the year 2025

/*UPDATE trail t
SET t.elevation = t.elevation * 1.2
WHERE t.id NOT IN (
    SELECT r.trail_id
    FROM review r
    WHERE t.id = r.trail_id AND YEAR(r.review_date) = 2025);*/



-- 9. EXISTS with correlated sub-queries result

-- check if there is at least one location associated with the trail in Canada and give all info about those trails
/*SELECT t.*
FROM trail t
WHERE EXISTS (SELECT 1 FROM location l
    WHERE l.id = t.location_id AND l.country = 'Canada');*/

-- remove rows from the review table where the corresponding user's password (from the user table) starts with 'River':
    
/*DELETE FROM review r 
WHERE EXISTS(SELECT u.id FROM user u WHERE u.id = r.user_id AND u.user_password LIKE 'River%');*/

-- set user type to noob for users who have rated trails with a score less than 0.5:

/*UPDATE user u 
SET u.type = 'noob'
WHERE EXISTS (SELECT tr.user_id FROM trail_rating WHERE tr.user_id = u.id AND tr.score < 0.5);*/


-- 10. NOT EXISTS with correlated sub-queries result

--  select all details of trails where no review in the year 2023 exists. 

/*SELECT * FROM trail t
WHERE NOT EXISTS (SELECT 1 FROM review r
              WHERE r.trail_id = t.id AND YEAR(r.review_date) = 2023);*/

-- delete trails that do not have more than three reviews:

/*DELETE FROM trail t
WHERE NOT EXISTS (SELECT 1 FROM review r
                  WHERE r.trail_id = t.id 
                  HAVING COUNT(1) > 3);*/

-- update difficulty_id to 1 (easy) for rows in trail_rating table where the user is pro 

/*UPDATE trail_rating tr 
SET tr.difficulty_id = 1
WHERE NOT EXISTS (SELECT 1 FROM user u 
                  WHERE tr.user_id = u.id AND u.type NOT IN ('pro'));*/


-- INTERSECT
-- select information about trails that have been rated with both difficulty levels 5 and 3

/*SELECT t.name, t.length, t.elevation, t.description FROM trail t
WHERE t.id IN (
    SELECT tr.trail_id  FROM trail_rating tr
    WHERE tr.trail_id = t.id AND tr.difficulty_id = 5
    INTERSECT
    SELECT tr.trail_id FROM trail_rating tr
    WHERE tr.trail_id = t.id AND tr.difficulty_id = 3);*/

-- UNION ALL:
--  create a unified result set that includes both ratings and reviews from different users for various trails, along with an additional column activity_type to differentiate between rating and reviewing activities

/*SELECT tr.user_id, 'rated' AS activity_type, tr.trail_id, tr.score AS rating FROM trail_rating tr
UNION ALL
SELECT r.user_id, 'reviewed' AS activity_type, r.trail_id, NULL AS rating FROM review r;*/
    
-- UNION
-- create a report that includes the top-rated trails along with the most recent reviews

/*SELECT 'Top Rated Trails' AS category, t.name AS trail_name, tr.score AS rating FROM trail_rating tr
INNER JOIN trail t ON tr.trail_id = t.id
WHERE tr.score = (SELECT MAX(score) FROM trail_rating                                  
                  WHERE trail_id = tr.trail_id)
UNION
SELECT 'Most Recent Reviews' AS category, t.name AS trail_name, r.review_date AS rating FROM review r
INNER JOIN trail t ON r.trail_id = t.id
WHERE r.review_date = (SELECT MAX(review_date) FROM review
                       WHERE trail_id = r.trail_id)
ORDER BY category;*/

-- EXCEPT
-- select trails with the highest average ratings, excluding those located in the United States

/*WITH average_score AS 
    (SELECT AVG(tr.score) AS average_score, tr.trail_id FROM trail_rating tr
    INNER JOIN trail t ON tr.trail_id = t.id
    GROUP BY tr.trail_id)

SELECT t.name, a.average_score AS average_score FROM trail t
INNER JOIN average_score a ON a.trail_id = t.id
                                                
EXCEPT

SELECT t.name, a.average_score AS average_score FROM trail t
INNER JOIN location l ON l.id = t.location_id
INNER JOIN average_score a ON a.trail_id = t.id
WHERE l.country = 'United States';*/



