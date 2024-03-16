/*CREATE TABLE trail(
                      id INT AUTO_INCREMENT PRIMARY KEY,
                      name VARCHAR(30) NOT NULL,
                      length DOUBLE NOT NULL,
                      elevation DOUBLE DEFAULT NULL,
                      description TEXT DEFAULT NULL,
                      image VARCHAR(100) NOT NULL,
                      location_id INT DEFAULT NULL,
                      difficulty_id INT DEFAULT NULL
);
-- ALTER TABLE trail
-- ADD FOREIGN KEY (location_id) REFERENCES location(id) ON DELETE CASCADE;

ALTER TABLE trail
    DROP COLUMN difficulty_id;


CREATE TABLE location(
                         id INT AUTO_INCREMENT PRIMARY KEY,
                         name VARCHAR(30) NOT NULL,
                         country VARCHAR(40) NOT NULL,
                         region VARCHAR(40) NOT NULL,
                         latitude DOUBLE NOT NULL,
                         longitude DOUBLE NOT NULL

);

CREATE TABLE difficulty(
                           id INT AUTO_INCREMENT PRIMARY KEY,
                           name VARCHAR(30) NOT NULL,
                           description TEXT DEFAULT NULL
);


CREATE TABLE trail_rating(
                             id INT AUTO_INCREMENT PRIMARY KEY,
                             trail_id INT NOT NULL,
                             user_id INT NOT NULL,
                             score DOUBLE DEFAULT 0
);
ALTER TABLE trail_rating
    ADD FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE,
    ADD FOREIGN KEY (trail_id) REFERENCES trail(id) ON DELETE CASCADE
    ADD COLUMN difficulty_id INT NOT NULL;

CREATE TABLE user (
                      id INT AUTO_INCREMENT PRIMARY KEY,
                      name VARCHAR(50) NOT NULL,
                      email VARCHAR(50) DEFAULT NULL,
                      user_password VARCHAR(50) CHECK(CHAR_LENGTH(user_password) BETWEEN 6 AND 50) NOT NULL,
                      type ENUM('noob', 'regular', 'pro')

);
CREATE TABLE review (
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        trail_id INT NOT NULL,
                        user_id INT NOT NULL,
                        title VARCHAR(40) NOT NULL,
                        content TEXT DEFAULT NULL,
                        review_date DATE NOT NULL
);

ALTER TABLE review
    ADD FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE,
    ADD FOREIGN KEY (trail_id) REFERENCES trail(id) ON DELETE CASCADE
  ;*/