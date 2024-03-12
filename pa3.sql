-- 1 = with non-correlated subqueries result:

/*SELECT column1, column2
FROM table1
WHERE column1 = (SELECT column1 FROM table2 WHERE condition);*/
    
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




