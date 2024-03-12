-- 1 = with non-correlated subqueries result:
    
-- select the contents of all reviews written by EmilyParker.
    
/*SELECT r.content
FROM review r
WHERE r.user_id = (SELECT u.id FROM user u WHERE u.name = 'EmilyParker');*/
    
-- change the score of Majestic Peak to the 3.5 eveywhere in trail_rating:

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

    
-- 4.EXISTS with non-correlated subqueries result
-- 

SELECT *
FROM user u
WHERE EXISTS (SELECT 1 FROM other_table WHERE condition);

-- EXISTS with correlated subqueries result

-- check if there is at least one location associated with the trail in Canada and give all info about those trails
/*SELECT t.*
FROM trail t
WHERE EXISTS (
    SELECT 1
    FROM location l
    WHERE l.id = t.location_id
      AND l.country = 'Canada'
);*/


-- NOT EXISTS with correlated subqueries result

--  select all details of trails where no review in the year 2023 exists. 

/*SELECT * FROM trail t
WHERE NOT EXISTS (SELECT 1 FROM review r
              WHERE r.trail_id = t.id AND YEAR(r.review_date) = 2023);*/
