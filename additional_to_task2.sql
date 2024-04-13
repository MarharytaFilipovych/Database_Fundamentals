CREATE TABLE trail_imaginary_index AS
SELECT * FROM trail_imaginary;


CREATE INDEX index_trail
    ON trail_imaginary_index (name);

SELECT * FROM trail_imaginary
WHERE name = 'Deer 2054';

SELECT * FROM trail_imaginary_index
WHERE name = 'Deer 2054'

-- data was populated thanks to file program