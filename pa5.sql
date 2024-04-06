/*Create two different views whith the same logical load: select for Europe and for North America 
  trails ordered by their popularity which values number of posted 
reviews. Result set should include: trail name, image, coordinates, description, 
  first sentenses of two most recent reviews (comma-separated).*/

-- SET @na_poly = 'POLYGON((90 -168.75, 90 -10, 78.13 -10, 57.5 -37.5, 15 -30, 15 -75, 1.25 -105, 51 -180, 60 -180, 60 -168.75, 90 -168.75))';
-- SET @eur_poly = 'POLYGON((90 -10, 90 77.5, 42.5 48.8, 42.5 30, 40.79 28.81, 41 29, 40.55 27.31, 40.40 26.75, 40.05 26.36, 39.17 25.19, 35.46 27.91, 33 27.5, 38 10, 35.42 -10, 28.25 -13, 15 -30, 57.5 -37.5, 78.13 -10, 90 -10))';

CREATE VIEW popular_trails_from_europe AS 
SELECT t.name,
       t.image,
       CONCAT(l.longitude, '; ', l.latitude ) AS coordinates,
       t.description,    
       GROUP_CONCAT(
               SUBSTRING_INDEX(most_recent_reviews.content, '.', 1) SEPARATOR ', '
       ) AS recent_reviews
FROM trail t
         INNER JOIN location l ON t.location_id = l.id
         INNER JOIN review r ON r.trail_id = t.id
         INNER JOIN ( SELECT  *, ROW_NUMBER() OVER (PARTITION BY r.trail_id ORDER BY r.review_date DESC) AS number FROM review r) AS most_recent_reviews ON most_recent_reviews.id = r.id
WHERE most_recent_reviews.number <= 2 AND ST_CONTAINS(ST_GEOMFROMTEXT('POLYGON((90 -10, 90 77.5, 42.5 48.8, 42.5 30, 40.79 28.81, 41 29, 40.55 27.31, 40.40 26.75, 40.05 26.36, 39.17 25.19, 35.46 27.91, 33 27.5, 38 10, 35.42 -10, 28.25 -13, 15 -30, 57.5 -37.5, 78.13 -10, 90 -10))'), POINT(l.latitude, l.longitude))
GROUP BY
    t.name, t.image, coordinates, t.description
ORDER BY
    COUNT(t.id) DESC;


CREATE VIEW popular_trails_from_north_america AS 
SELECT t.name,
       t.image,
       CONCAT(l.longitude, '; ', l.latitude ) AS coordinates,
       t.description,
       GROUP_CONCAT(
               SUBSTRING_INDEX(most_recent_reviews.content, '.', 1) SEPARATOR ', '
       ) AS recent_reviews
FROM trail t
         INNER JOIN location l ON t.location_id = l.id
         INNER JOIN review r ON r.trail_id = t.id
         INNER JOIN ( SELECT  *, ROW_NUMBER() OVER (PARTITION BY r.trail_id ORDER BY r.review_date DESC) AS number FROM review r) AS most_recent_reviews ON most_recent_reviews.id = r.id
WHERE most_recent_reviews.number <= 2 AND ST_CONTAINS(ST_GEOMFROMTEXT('POLYGON((90 -168.75, 90 -10, 78.13 -10, 57.5 -37.5, 15 -30, 15 -75, 1.25 -105, 51 -180, 60 -180, 60 -168.75, 90 -168.75))'), POINT(l.latitude, l.longitude))
GROUP BY
    t.name, t.image, coordinates, t.description
ORDER BY
    COUNT(t.id) DESC;


SELECT * FROM popular_trails_from_europe;

SELECT * FROM popular_trails_from_north_america;






