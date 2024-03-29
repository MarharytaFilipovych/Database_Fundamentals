-- It selects trail information from the trail table where the average rating is greater than the provided score. 
DELIMITER //
CREATE PROCEDURE trails_with_average_rating_greater_than(IN score INT)
BEGIN SELECT t.name, t.length, t.elevation
      FROM trail t
      WHERE t.id NOT IN (
          SELECT tr.trail_id FROM trail_rating tr
          WHERE tr.trail_id = t.id
          GROUP BY tr.trail_id
          HAVING AVG(tr.score) > score);
END//
DELIMITER ;

-- It selects the names of trails reviewed by a specific person
DELIMITER //
CREATE PROCEDURE get_trails_reviewed_by(IN person VARCHAR(50))
BEGIN SELECT t.name FROM trail t 
    INNER JOIN review r ON r.trail_id = t.id
    INNER JOIN user u ON r.user_id = u.id
    WHERE u.name = person;
END //
DELIMITER ;

-- update the description of a trail given its name. I can call this stored procedure by providing the name of the trail and the new description. 
-- After execution, I can retrieve the updated description from the new_description parameter.
DELIMITER //
CREATE PROCEDURE update_trail_description(IN trail_name VARCHAR(50), INOUT new_description TEXT)
BEGIN
    UPDATE trail t 
    SET description = new_description WHERE t.name = trail_name;
   
END;
DELIMITER ;

-- This stored procedure retrieves user details (such as name, email, and type) based on the user ID. It returns these details as OUT parameters.

DELIMITER //
CREATE PROCEDURE get_user_details_by_id(IN id INT, OUT name VARCHAR(50), OUT email VARCHAR(50), OUT type ENUM('noob', 'regular', 'pro'))
BEGIN 
    SELECT name, email, type INTO @name, @email, @type FROM user u 
    WHERE u.id = id;
END //
DELIMITER ;

-- get_user_details_by_name retrieves user details based on the user's name and returns them as OUT parameters.
DELIMITER //
CREATE PROCEDURE get_user_details_by_name( INOUT name VARCHAR(50), OUT email VARCHAR(50), OUT type ENUM('noob', 'regular', 'pro'))
BEGIN
    SELECT name, email, type INTO @name, @email, @type FROM user u
    WHERE u.name = name;
END //
DELIMITER ;

-- This stored procedure checks if a user with a given email exists in the database. It returns 1 for true, 0 for false, indicating whether the user exists or not.

DELIMITER //
CREATE PROCEDURE check_if_user_exists_by_their_email(IN email VARCHAR(50), OUT user_exists TINYINT)
    BEGIN
        SELECT COUNT(*) INTO user_exists FROM user u 
        WHERE u.email = email;
    END //
DELIMITER ;


/* The stored procedure update_user_email is designed to update the email address of a user in a database table. 
   It includes validation checks to ensure that the new email address meets certain criteria and that it does not already exist in the database. If any validation fails, the procedure rolls back the transaction. 
   If all checks pass, the procedure commits the changes and updates the email address.*/

DELIMITER //
CREATE PROCEDURE update_user_email(IN user_id INT, IN new_email VARCHAR(50))
BEGIN 
    DECLARE email_exists INT;
    DECLARE email_domain VARCHAR(50);
    DECLARE email_server_type VARCHAR(50);
    START TRANSACTION ;
    
    IF LENGTH(new_email)=0 OR LENGTH(new_email) >50 OR LOCATE('@', new_email) = 0 THEN
        ROLLBACK ;
        SELECT 'Rollback: New email is empty or does not contain "@".' AS message;
    ELSE
        SET email_domain = SUBSTRING_INDEX(new_email,'@', -1);
        SET email_server_type = SUBSTRING_INDEX(email_domain, '.', -1);
        
        IF email_server_type != 'com' THEN
        ROLLBACK;
        SELECT 'Rollback: Invalid email server type. Email server type must be ".com".' AS message;
        END IF;
    END IF;
    
    SELECT COUNT(*) INTO email_exists FROM user u 
    WHERE u.email = new_email;
    IF email_exists > 0 THEN 
    ROLLBACK;
    SELECT 'Rollback: Email already exists in the database.' AS message;
    END IF;
    
    UPDATE user u SET u.email = new_email WHERE u.id = user_id;
    COMMIT;
    SELECT 'Commit: Email updated successfully.' AS message;

END //


/*The stored procedure change_trail_description is designed to update the description of a trail in the database. 
. It checks whether the new description is valid and within the specified length limit. 
  If the description is valid, it then checks if the trail exists in the database. 
  If the trail exists, it updates the description and commits the transaction. 
  Otherwise, it rolls back the transaction and returns a message indicating that the trail was not found.
 */

DELIMITER //

CREATE PROCEDURE change_trail_description(In trail_name VARCHAR(50), IN new_description TEXT)
BEGIN
    DECLARE trail_exists INT;
    
    START TRANSACTION ;

    IF LENGTH(new_description) = 0 OR LENGTH(new_description)> 255 THEN
        ROLLBACK;
        SELECT 'Rollback: New description is empty or exceeds the maximum length of 255 characters.' AS message;
    ELSE

        SELECT COUNT(*) INTO trail_exists FROM trail t WHERE t.name = trail_name;
        IF trail_exists = 0 THEN
            ROLLBACK ;
            SELECT 'Rollback: Trail name not found.' AS message;
        ELSE

            UPDATE trail t SET t.description = new_description WHERE t.name = trail_name;
            SELECT 'Commit: Description updated successfully.' AS message;
        END IF;
        COMMIT;
    END IF;
END//

DELIMITER ;



