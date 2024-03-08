/*INSERT INTO difficulty (name, description) VALUES
                ('Easy', 'Suitable for beginners and casual participants.'),
                ('Intermediate', 'Requires some skill and experience.'),
                ('Advanced', 'Challenging and suitable for experienced individuals.'),
                ('Expert', 'Very difficult, recommended for highly skilled participants.'),
                ('Extreme', 'Extremely challenging, only for experts and professionals.');

INSERT INTO location (name, country, region, latitude, longitude) VALUES
    ('Rocky Mountain National Park', 'United States', 'Rocky Mountains', 39.5501, -106.0674),
    ('Whistler Blackcomb', 'Canada', 'British Columbia', 53.7267, -127.6476),
    ('Milford Sound', 'New Zealand', 'South Island', -44.7036, 169.1326),
    ('Grand Canyon National Park', 'United States', 'Grand Canyon', 36.107, -112.113),
    ('Sydney Opera House', 'Australia', 'New South Wales', -31.9505, 115.8605),
    ('Munnar', 'India', 'Western Ghats', 10.8505, 76.2711),
    ('French Riviera', 'France', 'Provence-Alpes-Côte dAzur', 43.9426, 6.6501),
    ('Burj Khalifa', 'United Arab Emirates', 'Dubai', 25.2769, 55.2963),
    ('Sognefjord', 'Norway', 'Vestland', 60.472, 8.4689),
    ('Table Mountain', 'South Africa', 'Western Cape', -33.9249, 18.4241),
    ('Iguazu Falls', 'Argentina', 'Misiones', -26.1921, -54.6564),
    ('Phuket Island', 'Thailand', 'Phuket', 7.8804, 98.3923);

INSERT INTO trail (name, length, elevation, description, image, location_id, difficulty_id) VALUES
    ('Majestic Peaks', 10.2, 1500, 'Explore the majestic peaks and breathtaking landscapes.', 'https://cdn.trailhub.com/majestic-peaks-cover.jpg', 2, NULL),
    ('Sunset Serenade', 6.8, 900, 'Enjoy a serenade of colors during a mesmerizing sunset trail.', 'https://cdn.trailhub.com/sunset-serenade-cover.jpg', 3, NULL),
    ('Hidden Waterfalls', 8.5, 1200, 'Discover hidden waterfalls along this enchanting and refreshing trail.', 'https://cdn.trailhub.com/hidden-waterfalls-cover.jpg', 4, NULL),
    ('Moonlit Escapade', 7.1, 1000, 'Embark on an escapade under the moonlight on this mystical trail.', 'https://cdn.trailhub.com/moonlit-escapade-cover.jpg', 5, NULL),
    ('Wildflower Wonderland', 5.5, 700, 'Immerse yourself in a wonderland of vibrant wildflowers.', 'https://cdn.trailhub.com/wildflower-wonderland-cover.jpg', 6, NULL),
    ('Alpine Adventure', 9.8, 1800, 'Embark on an adventure through the breathtaking alpine landscapes.', 'https://cdn.trailhub.com/alpine-adventure-cover.jpg', 7, NULL),
    ('Mystic Lakes', 12.5, 1700, 'Explore the mystical lakes surrounded by scenic beauty.', 'https://cdn.trailhub.com/mystic-lakes-cover.jpg', 2, NULL),
    ('Golden Meadows', 8.2, 1100, 'Hike through golden meadows and enjoy the beauty of nature.', 'https://cdn.trailhub.com/golden-meadows-cover.jpg', 4, NULL),
    ('Eagle\'s Peak', 10.8, 2000, 'Reach the majestic Eagle\'s Peak for panoramic views of the landscape.', 'https://cdn.trailhub.com/eagles-peak-cover.jpg', 7, NULL),
    ('Sunrise Serenity', 7, 800, 'Experience the serenity of nature with a beautiful sunrise hike.', 'https://cdn.trailhub.com/sunrise-serenity-cover.jpg', 10, NULL),
    ('Whispering Pines', 9.5, 1300, 'Wander through a trail surrounded by the soothing sounds of whispering pines.', 'https://cdn.trailhub.com/whispering-pines-cover.jpg', 6, NULL),
    ('Frosty Peaks', 11.2, 1800, 'Embark on a winter adventure with frost-covered peaks and stunning vistas.', 'https://cdn.trailhub.com/frosty-peaks-cover.jpg', 3, NULL),
    ('Crystal Cascades', 6.7, 900, 'Discover the beauty of crystal-clear cascades along this refreshing trail.', 'https://cdn.trailhub.com/crystal-cascades-cover.jpg', 5, NULL),
    ('Hidden Valleys', 14.1, 2500, 'Explore the hidden valleys and experience the diversity of landscapes.', 'https://cdn.trailhub.com/hidden-valleys-cover.jpg', 8, NULL),
    ('Pine Ridge Trail', 8.9, 1200, 'Hike through the scenic Pine Ridge Trail with breathtaking pine forest views.', 'https://cdn.trailhub.com/pine-ridge-trail-cover.jpg', 1, NULL);

INSERT INTO trail_rating (trail_id, user_id, score, difficulty_id) VALUES
    (1, 1, 4.5, 1),
    (1, 2, 3.8, 2),
    (1, 3, 1, 3),
    (1, 4, 4, 4),
    (2, 5, 4.7, 5),
    (2, 6, 3.5, 1),
    (2, 7, 4.1, 2),
    (2, 8, 1, 3),
    (3, 9, 4.4, 4),
    (3, 10, 1, 5),
    (3, 11, 4.2, 1),
    (3, 12, 3.6, 2),
    (4, 13, 4, 3),
    (4, 14, 0, 4),
    (4, 15, 4.9, 5),
    (5, 1, 3.8, 1),
    (5, 2, 5, 2),
    (5, 3, 4.1, 3),
    (5, 4, 4.7, 4),
    (6, 5, 4.6, 5),
    (6, 6, 4.4, 1),
    (6, 7, 3.9, 2),
    (6, 8, 3, 3),
    (7, 9, 2, 4),
    (7, 10, 2, 5),
    (7, 11, 3.7, 1),
    (7, 12, 4, 2),
    (8, 13, 3.5, 3),
    (8, 14, 4.1, 4),
    (8, 15, 1, 5),
    (9, 1, 0.8, 1),
    (9, 2, 3.4, 2),
    (9, 3, 4.3, 3),
    (9, 4, 4.6, 4),
    (10, 5, 0, 5),
    (10, 6, 3.9, 1),
    (10, 7, 4.2, 2),
    (10, 8, 3.7, 3),
    (11, 9, 4.5, 4),
    (11, 10, 4, 5),
    (11, 11, 4.1, 1),
    (11, 12, 3.5, 2),
    (12, 13, 4.4, 3),
    (12, 14, 4.8, 4),
    (12, 15, 4.2, 5),
    (13, 1, 3.6, 1),
    (13, 2, 4.3, 2),
    (13, 3, 4.5, 3),
    (13, 4, 4.1, 4),
    (14, 5, 4.4, 5),
    (14, 6, 3.4, 1),
    (14, 7, 4.6, 2),
    (14, 8, 3.6, 3),
    (15, 9, 4.9, 4),
    (15, 10, 3.9, 5),
    (15, 11, 4, 1),
    (15, 12, 3.7, 2),
    (1, 13, 4.5, 3),
    (2, 14, 4.1, 4),
    (3, 15, 4.7, 5),
    (1, 1, 5, 1),
    (1, 16, 4.5, 1),
    (2, 17, 3.8, 2),
    (3, 18, 4.2, 3),
    (4, 19, 4, 4),
    (5, 20, 4.7, 5),
    (6, 21, 3.5, 1),
    (7, 22, 1, 2),
    (8, 23, 3.2, 3),
    (9, 24, 4.8, 4),
    (10, 25, 4.5, 5),
    (11, 26, 3.9, 1),
    (12, 27, 4.1, 2),
    (13, 28, 3.7, 3),
    (14, 29, 4.3, 4),
    (15, 30, 4.6, 5),
    (1, 16, 3.8, 1),
    (2, 17, 4.2, 2),
    (3, 18, 4.5, 3),
    (4, 19, 3.5, 4),
    (5, 20, 4.9, 5),
    (6, 21, 3, 1),
    (7, 22, 4.4, 2),
    (8, 23, 3.8, 3),
    (9, 24, 4.7, 4),
    (10, 25, 4.1, 5),
    (11, 26, 3.6, 1),
    (12, 27, 4.3, 2),
    (13, 28, 3.9, 3),
    (14, 29, 4.5, 4),
    (15, 30, 4.2, 5);

  INSERT INTO user (name, email, user_password, type) VALUES
    ('JohnDoe', 'john.doe@example.com', 'Adventure123!', 'regular'),
    ('AliceSmith', 'alice.smith@example.com', 'Hiking@2022', 'pro'),
    ('BobJohnson', 'bob.johnson@example.com', 'TrailRunner87', 'noob'),
    ('EmilyParker', 'emily.parker@example.com', 'ExploreNature', 'regular'),
    ('DavidMiller', 'david.miller@example.com', 'MountainClimb!', 'pro'),
    ('SophiaWilliams', 'sophia.williams@example.com', 'WildflowerLove', 'noob'),
    ('MichaelBrown', 'michael.brown@example.com', 'DesertTrekker', 'regular'),
    ('OliviaJones', 'olivia.jones@example.com', 'CoastalExplorer', 'pro'),
    ('DanielDavis', 'daniel.davis@example.com', 'SunsetChaser', 'noob'),
    ('EmmaWilson', 'emma.wilson@example.com', 'TrailBlazer2022', 'regular'),
    ('LiamThomas', 'liam.thomas@example.com', 'MountainAdventurer', 'pro'),
    ('AvaAnderson', 'ava.anderson@example.com', 'ForestWonder', 'noob'),
    ('JacksonMoore', 'jackson.moore@example.com', 'RiverWalker123', 'regular'),
    ('IsabellaClark', 'isabella.clark@example.com', 'RockyTerrain!', 'pro'),
    ('LucasTaylor', 'lucas.taylor@example.com', 'NatureEnthusiast', 'noob'),
    ('MiaMartin', 'mia.martin@example.com', 'HilltopExplorer', 'regular'),
    ('WilliamWhite', 'william.white@example.com', 'WildlifeWatcher', 'pro'),
    ('AveryHall', 'avery.hall@example.com', 'DesertTrail123', 'noob'),
    ('ScarlettAdams', 'scarlett.adams@example.com', 'CoastalDreamer', 'regular'),
    ('ElijahWard', 'elijah.ward@example.com', 'SunsetAdmirer', 'pro'),
    ('GraceLee', 'grace.lee@example.com', 'TrailSeeker2022', 'noob'),
    ('HenryBarnes', 'henry.barnes@example.com', 'ForestExplorer', 'regular'),
    ('LilyJohnson', 'lily.johnson@example.com', 'RiverBreeze123', 'pro'),
    ('AlexanderSmith', 'alexander.smith@example.com', 'RockyAdventures!', 'noob'),
    ('ChloeHarrison', 'chloe.harrison@example.com', 'MountainTopView', 'regular'),
    ('EthanEvans', 'ethan.evans@example.com', 'HillsideHiker', 'pro'),
    ('AmeliaWood', 'amelia.wood@example.com', 'DesertExplorer', 'noob'),
    ('OwenBaker', 'owen.baker@example.com', 'CoastalJourney', 'regular'),
    ('AriaFisher', 'aria.fisher@example.com', 'SunsetVoyager', 'pro'),
    ('NoahCarter', 'noah.carter@example.com', 'TrailDiscoverer', 'noob');
INSERT INTO review (id, trail_id, user_id, title, content, review_date) VALUES
                                                                            (1, 1, 1, 'Amazing Mountain Trail', 'Had an incredible experience on this trail. The views from the top were breathtaking!', '2022-01-15'),
                                                                            (2, 2, 2, 'Beautiful Forest Hike', 'A peaceful hike through the dense forest. Loved every moment of it.', '2022-02-05'),
                                                                            (3, 2, 3, 'Trail Running Adventure', 'Great trail for running! The varied terrain kept it interesting.', '2022-03-12'),
                                                                            (4, 4, 4, 'Nature Exploration', 'Explored deep canyons and enjoyed the beauty of the natural surroundings.', '2022-04-20'),
                                                                            (5, 5, 5, 'Scenic Riverbank Walk', 'Relaxing walk along the riverbank with soothing sounds of nature.', '2022-05-08'),
                                                                            (6, 6, 6, 'Panoramic Hilltop Vista', 'The short trail led to an amazing panoramic vista. Highly recommend!', '2022-06-17'),
                                                                            (8, 5, 8, 'Coastal Trail Bliss', 'Enjoyed the coastal views and the refreshing breeze. Perfect for a coastal hike.', '2022-08-04'),
                                                                            (10, 1, 10, 'Spectacular Sunset Ridge', 'Caught the breathtaking sunset from the ridge. A must-visit spot.', '2022-10-02'),
                                                                            (11, 1, 11, 'Memorable Mountain Adventure', 'Challenging trail with rewarding views. Definitely worth the effort!', '2022-11-11'),
                                                                            (12, 2, 12, 'Enchanting Forest Exploration', 'The forest trail was magical, like stepping into a fairy tale.', '2022-12-22'),
                                                                            (13, 3, 13, 'Canyon Beauty', 'Explored the grandeur of the canyon. A true natural wonder!', '2023-01-08'),
                                                                            (14, 4, 14, 'Rocky Adventure', 'Navigating through rocky terrains added an exciting element to the trek.', '2023-02-14'),
                                                                            (15, 5, 15, 'Nature\'s Canvas', 'The trail showcased nature\'s beauty at its finest. A picture-perfect experience.', '2023-03-25'),
                                                                            (16, 6, 16, 'Hilltop Serenity', 'Hiked to a serene hilltop with breathtaking views. A peaceful escape.', '2023-04-30'),
                                                                            (17, 6, 17, 'Nature\'s Symphony', 'The sounds of nature accompanied the hike, making it a memorable experience.', '2023-05-19'),
                                                                            (19, 3, 19, 'Coastal Trail Delight', 'Moderate difficulty with rewarding coastal scenery. Enjoyed every step!', '2023-07-15'),
                                                                            (21, 1, 21, 'Trailblazing Adventure', 'Challenged myself on this trail, and it was a thrilling adventure.', '2023-09-12'),
                                                                            (22, 2, 22, 'Forest Wonderland', 'The forest trail felt like stepping into a wonderland. Loved the diversity of flora.', '2023-10-23'),
                                                                            (23, 3, 23, 'River Breeze Bliss', 'Hiking along the river provided a refreshing experience with cool breezes.', '2023-11-05'),
                                                                            (24, 4, 24, 'Rocky Escapade', 'Navigating the rocky terrains was a bit challenging but added excitement to the trek.', '2023-12-18'),
                                                                            (25, 5, 25, 'Mountain Majesty', 'The trail led to majestic mountain views. A must-do for nature enthusiasts!', '2024-01-07'),
                                                                            (26, 6, 26, 'Hillside Harmony', 'Hiking along the hillsides provided a harmonious experience with nature.', '2024-02-14'),
                                                                            (33, 2, 2, 'Forest Symphony', 'The sounds of the forest created a symphony during the hike. Nature\'s music at its best.', '2024-08-05'),
                                                                            (34, 3, 3, 'Canyon Colors', 'The vibrant colors of the canyon walls were a visual feast. A captivating trek.', '2024-09-18'),
                                                                            (35, 4, 4, 'Rocky Challenge', 'Conquered the rocky challenge of the trail. A test of endurance and determination.', '2024-10-03'),
                                                                            (36, 5, 5, 'Riverbank Retreat', 'Relaxed by the riverbank, taking in the serenity of the surroundings. A peaceful escape.', '2024-11-14'),
                                                                            (37, 6, 6, 'Hilltop Haven', 'Found a serene haven at the hilltop, away from the hustle and bustle. A hidden gem.', '2024-12-26'),
                                                                            (38, 4, 7, 'Wildflower Wonderland', 'The trail transformed into a colorful wonderland with blooming wildflowers. Enchanting.', '2025-01-08'),
                                                                            (40, 4, 9, 'Coastal Tranquility', 'Experienced the tranquility of the coast with calming waves and scenic coastal views.', '2025-03-05'),
                                                                            (42, 3, 1, 'Mountain Majesty Redux', 'Returned to the majestic mountain trail for another dose of awe-inspiring views.', '2025-05-01'),
                                                                            (43, 3, 2, 'Forest Exploration II', 'Continued the exploration of the enchanting forest, uncovering new hidden spots.', '2025-06-14'),
                                                                            (44, 3, 3, 'River Adventure', 'Navigated the river trail, experiencing the adventure and beauty along the flowing waters.', '2025-07-27'),
                                                                            (45, 3, 4, 'Rocky Revelations', 'The rocky terrains revealed unique geological formations, making the trek a geological adventure.', '2025-08-10'),
                                                                            (46, 5, 5, 'Mountain Vista Delight', 'Enjoyed a delightful hike to another mountain vista, showcasing the diversity of the landscape.', '2025-09-23'),
                                                                            (47, 1, 1, 'Amazing Mountain Trail', 'Had an incredible experience on this trail. The views from the top were breathtaking!', '2022-01-15'),
                                                                            (48, 2, 2, 'Beautiful Forest Hike', 'A peaceful hike through the dense forest. Loved every moment of it.', '2022-02-05'),
                                                                            (49, 2, 3, 'Trail Running Adventure', 'Great trail for running! The varied terrain kept it interesting.', '2022-03-12'),
                                                                            (50, 4, 4, 'Nature Exploration', 'Explored deep canyons and enjoyed the beauty of the natural surroundings.', '2022-04-20'),
                                                                            (51, 5, 5, 'Scenic Riverbank Walk', 'Relaxing walk along the riverbank with soothing sounds of nature.', '2022-05-08'),
                                                                            (52, 6, 6, 'Panoramic Hilltop Vista', 'The short trail led to an amazing panoramic vista. Highly recommend!', '2022-06-17'),
                                                                            (54, 5, 8, 'Coastal Trail Bliss', 'Enjoyed the coastal views and the refreshing breeze. Perfect for a coastal hike.', '2022-08-04'),
                                                                            (56, 1, 10, 'Spectacular Sunset Ridge', 'Caught the breathtaking sunset from the ridge. A must-visit spot.', '2022-10-02'),
                                                                            (57, 1, 11, 'Memorable Mountain Adventure', 'Challenging trail with rewarding views. Definitely worth the effort!', '2022-11-11'),
                                                                            (58, 2, 12, 'Enchanting Forest Exploration', 'The forest trail was magical, like stepping into a fairy tale.', '2022-12-22'),
                                                                            (59, 3, 13, 'Canyon Beauty', 'Explored the grandeur of the canyon. A true natural wonder!', '2023-01-08'),
                                                                            (60, 4, 14, 'Rocky Adventure', 'Navigating through rocky terrains added an exciting element to the trek.', '2023-02-14'),
                                                                            (61, 5, 15, 'Nature\'s Canvas', 'The trail showcased nature\'s beauty at its finest. A picture-perfect experience.', '2023-03-25'),
                                                                            (62, 6, 16, 'Hilltop Serenity', 'Hiked to a serene hilltop with breathtaking views. A peaceful escape.', '2023-04-30'),
                                                                            (63, 6, 17, 'Nature\'s Symphony', 'The sounds of nature accompanied the hike, making it a memorable experience.', '2023-05-19'),
                                                                            (65, 3, 19, 'Coastal Trail Delight', 'Moderate difficulty with rewarding coastal scenery. Enjoyed every step!', '2023-07-15'),
                                                                            (67, 1, 21, 'Trailblazing Adventure', 'Challenged myself on this trail, and it was a thrilling adventure.', '2023-09-12'),
                                                                            (68, 2, 22, 'Forest Wonderland', 'The forest trail felt like stepping into a wonderland. Loved the diversity of flora.', '2023-10-23'),
                                                                            (69, 3, 23, 'River Breeze Bliss', 'Hiking along the river provided a refreshing experience with cool breezes.', '2023-11-05'),
                                                                            (70, 4, 24, 'Rocky Escapade', 'Navigating the rocky terrains was a bit challenging but added excitement to the trek.', '2023-12-18'),
                                                                            (71, 5, 25, 'Mountain Majesty', 'The trail led to majestic mountain views. A must-do for nature enthusiasts!', '2024-01-07'),
                                                                            (72, 6, 26, 'Hillside Harmony', 'Hiking along the hillsides provided a harmonious experience with nature.', '2024-02-14'),
                                                                            (79, 2, 2, 'Forest Symphony', 'The sounds of the forest created a symphony during the hike. Nature\'s music at its best.', '2024-08-05'),
                                                                            (80, 3, 3, 'Canyon Colors', 'The vibrant colors of the canyon walls were a visual feast. A captivating trek.', '2024-09-18'),
                                                                            (81, 4, 4, 'Rocky Challenge', 'Conquered the rocky challenge of the trail. A test of endurance and determination.', '2024-10-03'),
                                                                            (82, 5, 5, 'Riverbank Retreat', 'Relaxed by the riverbank, taking in the serenity of the surroundings. A peaceful escape.', '2024-11-14'),
                                                                            (83, 6, 6, 'Hilltop Haven', 'Found a serene haven at the hilltop, away from the hustle and bustle. A hidden gem.', '2024-12-26'),
                                                                            (84, 4, 7, 'Wildflower Wonderland', 'The trail transformed into a colorful wonderland with blooming wildflowers. Enchanting.', '2025-01-08'),
                                                                            (86, 4, 9, 'Coastal Tranquility', 'Experienced the tranquility of the coast with calming waves and scenic coastal views.', '2025-03-05'),
                                                                            (88, 3, 1, 'Mountain Majesty Redux', 'Returned to the majestic mountain trail for another dose of awe-inspiring views.', '2025-05-01'),
                                                                            (89, 3, 2, 'Forest Exploration II', 'Continued the exploration of the enchanting forest, uncovering new hidden spots.', '2025-06-14'),
                                                                            (90, 3, 3, 'River Adventure', 'Navigated the river trail, experiencing the adventure and beauty along the flowing waters.', '2025-07-27'),
                                                                            (91, 3, 4, 'Rocky Revelations', 'The rocky terrains revealed unique geological formations, making the trek a geological adventure.', '2025-08-10'),
                                                                            (92, 5, 5, 'Mountain Vista Delight', 'Enjoyed a delightful hike to another mountain vista, showcasing the diversity of the landscape.', '2025-09-23'),
                                                                            (93, 1, 1, 'Amazing Experience!', 'The views from the top were absolutely breathtaking. A must-do trail!', '2022-01-16'),
                                                                            (94, 1, 2, 'Unforgettable Hike', 'Challenging but rewarding. The summit provides a sense of accomplishment.', '2022-02-02'),
                                                                            (95, 1, 3, 'Spectacular Scenery', 'Nature at its best! The trail offers panoramic views that leave you in awe.', '2022-02-20'),
                                                                            (96, 2, 4, 'Enchanting Forest Trail', 'Like walking through a fairy tale. The dense forest adds a magical touch to the hike.', '2022-03-10'),
                                                                            (97, 2, 5, 'Peaceful Retreat', 'A serene and peaceful hike. Perfect for those looking to escape into nature.', '2022-03-28'),
                                                                            (98, 2, 6, 'Trail Runner\'s Delight', 'Great for running with varied terrain. Keeps the adventure alive!', '2022-04-15'),
                                                                            (99, 3, 7, 'Grand Canyon Exploration', 'Explored the grandeur of the canyon. A natural wonder worth experiencing.', '2022-05-01'),
                                                                            (100, 3, 8, 'Canyon Colors', 'Vibrant colors of the canyon walls create a visual feast. A photographer\'s dream!', '2022-05-18'),
                                                                            (101, 3, 9, 'Canyon Beauty', 'The trail offers a unique adventure along the flowing waters of the canyon.', '2022-06-02'),
                                                                            (102, 4, 10, 'Rocky Terrain Challenge', 'Conquered the challenging rocky terrains. A test of endurance and determination.', '2022-06-20'),
                                                                            (103, 4, 11, 'Nature Exploration', 'Immersed in the beauty of natural surroundings. The deep canyons add an extra thrill.', '2022-07-07'),
                                                                            (104, 4, 12, 'Rocky Adventure', 'Navigating through the rocky terrains added an exciting element to the trek.', '2022-07-23'),
                                                                            (105, 5, 13, 'Riverbank Bliss', 'A relaxing walk along the riverbank with soothing sounds of nature. Truly refreshing!', '2022-08-10'),
                                                                            (106, 5, 14, 'Scenic Beauty', 'The trail showcases nature\'s beauty at its finest. Every step is a picture-perfect experience.', '2022-08-26'),
                                                                            (107, 5, 15, 'Coastal Trail Retreat', 'Perfect for a coastal escape. The coastal views and breeze make it a delightful hike.', '2022-09-12'),
                                                                            (108, 6, 16, 'Hilltop Views', 'Hiked to a serene hilltop with breathtaking views. A peaceful escape from the hustle.', '2022-09-28'),
                                                                            (109, 6, 17, 'Symphony of Nature', 'The sounds of nature accompanied the hike, making it a memorable and harmonious experience.', '2022-10-15'),
                                                                            (110, 6, 18, 'Hidden Gem', 'Found a serene haven at the hilltop, away from the bustle. A true hidden gem!', '2022-10-31'),
                                                                            (202, 7, 1, 'Enchanting Wildflowers', 'The trail was lined with colorful wildflowers. Absolutely enchanting.', '2023-07-23'),
                                                                            (203, 8, 2, 'Coastal Trail Bliss', 'Enjoyed the coastal views and the refreshing breeze. Perfect for a coastal hike.', '2023-08-04'),
                                                                            (204, 9, 3, 'Moderate Difficulty', 'Moderate difficulty with stunning coastal views. Loved the ocean breeze!', '2023-09-15'),
                                                                            (205, 10, 4, 'Breathtaking Sunset Ridge', 'Caught the breathtaking sunset from the ridge. A must-visit spot.', '2023-10-02'),
                                                                            (206, 11, 5, 'Memorable Mountain Adventure', 'Challenging trail with rewarding views. Definitely worth the effort!', '2023-11-11'),
                                                                            (207, 12, 6, 'Enchanting Forest Exploration', 'The forest trail was magical, like stepping into a fairy tale.', '2023-12-22'),
                                                                            (208, 13, 7, 'Canyon Beauty', 'Explored the grandeur of the canyon. A true natural wonder!', '2024-01-08'),
                                                                            (209, 14, 8, 'Rocky Adventure', 'Navigating through rocky terrains added an exciting element to the trek.', '2024-02-14'),
                                                                            (210, 15, 9, 'Nature\'s Canvas', 'The trail showcased nature\'s beauty at its finest. A picture-perfect experience.', '2024-03-25'),
                                                                            (211, 7, 10, 'Wildflower Wonderland', 'The trail transformed into a colorful wonderland with blooming wildflowers. Enchanting.', '2025-01-08'),
                                                                            (212, 8, 11, 'Desert Serenity', 'Discovered the tranquil side of the desert landscape. A serene desert trekking experience.', '2025-02-21'),
                                                                            (213, 9, 12, 'Coastal Tranquility', 'Experienced the tranquility of the coast with calming waves and scenic coastal views.', '2025-03-05'),
                                                                            (214, 10, 13, 'Sunset Seeker', 'Embarked on a journey to seek the perfect sunset view. Nature\'s canvas painted with hues of warmth.', '2025-04-18'),
                                                                            (215, 11, 14, 'Mountain Majesty Redux', 'Returned to the majestic mountain trail for another dose of awe-inspiring views.', '2025-05-01'),
                                                                            (216, 12, 15, 'Forest Exploration II', 'Continued the exploration of the enchanting forest, uncovering new hidden spots.', '2025-06-14'),
                                                                            (217, 13, 16, 'River Adventure', 'Navigated the river trail, experiencing the adventure and beauty along the flowing waters.', '2025-07-27'),
                                                                            (218, 14, 17, 'Rocky Revelations', 'The rocky terrains revealed unique geological formations, making the trek a geological adventure.', '2025-08-10'),
                                                                            (219, 15, 18, 'Mountain Vista Delight', 'Enjoyed a delightful hike to another mountain vista, showcasing the diversity of the landscape.', '2025-09-23');

INSERT INTO review (id, trail_id, user_id, title, content, review_date)
VALUES
    (220, 7, 19, 'Trail Serenity', 'Found serenity along the trail. A peaceful escape from the routine.', '2025-10-05'),
    (221, 8, 20, 'Coastal Harmony', 'The coastal trail provided a harmonious experience with nature. Refreshing!', '2025-11-18'),
    (222, 9, 21, 'Sunset Exploration', 'Explored the trail during the mesmerizing hues of sunset. Spectacular views!', '2025-12-01'),
    (223, 10, 22, 'Forest Oasis', 'Discovered an oasis within the forest trail. Nature\'s hidden gem!', '2026-01-14'),
    (224, 11, 23, 'Canyon Tranquility', 'Enjoyed a tranquil experience in the heart of the canyon. Serene surroundings.', '2026-02-27'),
    (225, 12, 24, 'Rocky Challenge II', 'Took on the challenge of rocky terrains again. Pushing limits!', '2026-03-12'),
    (226, 13, 25, 'Riverbank Reflections', 'Moments of reflection by the riverbank. Perfect for introspection.', '2026-04-25'),
    (227, 14, 26, 'Mountain Ascent', 'Embarked on an ascent to the mountain summit. Breathtaking views at the top!', '2026-05-08'),
    (228, 1, 26, 'Great Hike!', 'Enjoyed the trail a lot.', '2024-03-06'),
    (229, 2, 27, 'Beautiful Scenery', 'Breathtaking views!', '2024-03-07'),
    (230, 3, 28, 'Challenging but Fun', 'The trail had some difficult sections, but it was worth it.', '2024-03-08'),
    (231, 4, 29, 'Peaceful Retreat', 'Found serenity in nature.', '2024-03-09'),
    (232, 5, 30, 'Family Adventure', 'Took the kids and had a wonderful time.', '2024-03-10'),
    (233, 1, 1, 'Great Trail!', 'This trail was amazing!', '2024-03-06'),
    (234, 2, 2, 'Awesome Hike', 'I loved the scenery on this trail.', '2024-03-07'),
    (235, 3, 3, 'Trail Adventure', 'Had a great time exploring this trail.', '2024-03-08'),
    (236, 4, 4, 'Beautiful Nature', 'The nature on this trail is stunning.', '2024-03-09'),
    (237, 5, 5, 'Scenic Route', 'The route offered breathtaking views.', '2024-03-10'),
    (238, 6, 6, 'Nature Walk', 'A peaceful walk through nature.', '2024-03-11'),
    (239, 7, 7, 'Mountain Trail', 'Hiking this mountain trail was challenging but rewarding.', '2024-03-12'),
    (240, 8, 8, 'Trailblazing', 'Blazing new trails and loving it!', '2024-03-13'),
    (241, 9, 9, 'Sunset Hike', 'Witnessed a beautiful sunset on this trail.', '2024-03-14'),
    (242, 10, 10, 'Trail Tales', 'Sharing stories with fellow hikers.', '2024-03-15'),
    (243, 11, 11, 'Hilltop Views', 'Reached the hilltop for panoramic views.', '2024-03-16'),
    (244, 12, 12, 'Nature\'s Symphony', 'Listened to the symphony of nature throughout the trail.', '2024-03-17'),
    (245, 13, 13, 'River Walk', 'Enjoyed a calming walk along the river.', '2024-03-18'),
    (246, 14, 14, 'Trail Reflections', 'Reflecting on life while hiking this trail.', '2024-03-19'),
    (247, 15, 15, 'Trailblazers Unite', 'Uniting with fellow trailblazers!', '2024-03-20'),
    (248, 1, 16, 'Morning Hike', 'Started the day with an invigorating hike.', '2024-03-21'),
    (249, 2, 17, 'Forest Exploration', 'Explored the depths of the forest on this trail.', '2024-03-22'),
    (250, 3, 18, 'Peak Challenge', 'Challenged myself to reach the peak.', '2024-03-23'),
    (251, 4, 19, 'Trail Serenity', 'Found serenity in the midst of nature.', '2024-03-24'),
    (252, 5, 20, 'Trailblazing Solo', 'Solo trailblazing adventure!', '2024-03-25'),
    (253, 6, 21, 'Wildlife Encounter', 'Encountered amazing wildlife along the trail.', '2024-03-26'),
    (254, 7, 22, 'Rocky Terrain', 'Navigated through challenging rocky terrain.', '2024-03-27'),
    (255, 8, 23, 'Trail Photography', 'Captured stunning moments on camera.', '2024-03-28'),
    (256, 9, 24, 'Sunrise Hike', 'Chased the sunrise on this early morning hike.', '2024-03-29'),
    (257, 10, 25, 'Trail Meditations', 'Meditated in the peacefulness of the trail.', '2024-03-30'),
    (258, 11, 26, 'Countryside Stroll', 'A leisurely stroll through the countryside.', '2024-03-31'),
    (259, 12, 27, 'Trailside Picnic', 'Enjoyed a picnic with a view.', '2024-04-01'),
    (260, 13, 28, 'Trail Runner', 'Running the trail for an adrenaline rush.', '2024-04-02'),
    (261, 14, 29, 'Trailside Sketching', 'Captured the beauty on paper.', '2024-04-03'),
    (262, 15, 30, 'Fantastic Views', 'The views from this trail are breathtaking.', '2024-04-04');
*/
