USE hiking;

-- Select trails  from the trail table where the average rating is less than 3. 
CALL trails_with_average_rating_less_than_sproc(3);

-- Select the names of trails reviewed by a EmilyParker
CALL get_trails_reviewed_by_sproc('EmilyParker');

-- update the description of a trail Twilight Trail
SET @new_description = 'Feel the aesthetics of Twilight movies';
CALL update_trail_description_sproc('Twilight Trail', @new_description);

-- Select user details (such as name, email, and type) with id 25. It returns these details as OUT parameters.
CALL get_user_details_by_id(25, @user_name, @user_email, @user_type);
SELECT @user_name, @user_email, @user_type ;


-- Select user details (email, type and return them as OUT parameters) based on the user's name - MiaMartin
SET @user_name = 'MiaMartin';
CALL get_user_details_by_name_sproc(@user_name, @user_email, @user_type);
SELECT @user_email, @user_type;

-- check if a user with a given email exists in the database. It returns 1 for true, 0 for false, indicating whether the user exists or not. Let's check user with email william.white@example.com
CALL check_if_user_exists_by_their_email_sproc('william.white@example.com', @user_exists);
SELECT(@user_exists);


-- john.doe@example.com
-- update the email address (if it meets the validation conditions) of a user in a database table
CALL update_user_email_sproc(1, 'alice.smith@example.com'); -- rollback, because this email is already present in the table
CALL update_user_email_sproc(1, 'alice.smithe@#xample.cccc'); -- rollback, because this email does not have .com 
CALL update_user_email_sproc(1, 'gggggggggggggggggggg'); -- rollback, not valid email
CALL update_user_email_sproc(1, 'john.home@gmail.com'); -- new email in the table



/*The stored procedure change_trail_description is designed to update the description of a trail in the database. 
. It checks whether the new description is valid and within the specified length limit. 
  If the description is valid, it then checks if the trail exists in the database. 
  If the trail exists, it updates the description and commits the transaction. 
  Otherwise, it rolls back the transaction and returns a message indicating that the trail was not found.
 */
CALL change_trail_description_sproc('Pine Ridge Trail', ''); -- rollback; the description is empty
CALL change_trail_description_sproc('Pine Ridge Trail', 'New trail, just for you!') -- new description in the table