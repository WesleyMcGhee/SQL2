SELECT * FROM invoice_line
WHERE unit_price > .99;

SELECT invoice_date, first_name, last_name, total 
FROM invoice
JOIN customer ON invoice.customer_id = customer.customer_id;

SELECT e.first_name, e.last_name, c.first_name, c.last_name
FROM customer c
JOIN employee e ON support_rep_id = employee_id;

SELECT al.title, ar.name
FROM album al
JOIN artist ar ON al.artist_id = ar.artist_id;

SELECT pt.playlist_track_id, pt.track_id FROM playlist_track pt
JOIN playlist p ON p.playlist_id = pt.playlist_id
WHERE p.name = 'Music';

SELECT t.name FROM track t
JOIN playlist_track pt ON t.track_id = pt.track_id
WHERE pt.playlist_id = 5;

SELECT t.name, p.name FROM track t 
JOIN playlist_track pt ON pt.track_id = t.track_id
JOIN playlist p ON p.playlist_id = pt.playlist_id

SELECT t.name, p.name FROM track t 
JOIN playlist_track pt ON pt.track_id = t.track_id
JOIN playlist p ON p.playlist_id = pt.playlist_id
WHERE p.name = 'Alternative & Punk';


SELECT * FROM invoice_line
WHERE unit_price > .99;

SELECT * FROM playlist_track
WHERE playlist_id IN (SELECT playlist_id FROM playlist WHERE playlist_id = 1 OR playlist_id = 3);

SELECT name FROM track
WHERE track_id IN (SELECT playlist_id FROM playlist WHERE playlist_id = 5);

SELECT * FROM track 
WHERE genre_id IN (SELECT genre_id FROM genre WHERE genre_id = 22);

SELECT * FROM track 
WHERE album_id IN (SELECT album_id FROM album WHERE album_id = 60);

SELECT * FROM track
WHERE album_id IN 
(SELECT album_id FROM album WHERE artist_id IN 
 (SELECT artist_id FROM artist WHERE artist_id = 51));
  
CREATE VIEW rock AS 
SELECT name FROM genre
WHERE name = 'Rock';

CREATE VIEW classical_count AS
SELECT COUNT(*) FROM track
WHERE track_id IN (SELECT playlist_id FROM playlist_track WHERE playlist_id = 11);

UPDATE customer
SET fax = null;

UPDATE customer 
SET company = 'Self'
WHERE company is null;

UPDATE customer 
SET last_name = 'Thompson'
WHERE customer_id = 28;

UPDATE customer
SET support_rep_id = 4
WHERE customer_id = 57;

UPDATE track
SET composer = 'The darkness around us'  
WHERE composer is null and track_id  IN 
(SELECT track_id FROM playlist_track WHERE playlist_id IN 
   (SELECT playlist_id FROM playlist WHERE playlist_id = 17));
SELECT * FROM track;

ALTER TABLE animals
ADD COLUMN location VARCHAR(255);

CREATE TABLE animals (
id SERIAL PRIMARY KEY, name VARCHAR(50), type TEXT, age INTEGER
);
INSERT INTO animals ( name, type, age ) VALUES ('Leo', 'lion', 12), ('Jerry', 'mouse', 4), ('Marty', 'zebra', 10), ('Gloria', 'hippo', 8), ('Alex', 'lion', 9), ('Melman', 'giraffe', 15), ('Nala', 'lion', 2), ('Marie', 'cat', 1), ('Flounder', 'fish', 8);

DELETE FROM animals 
WHERE type = 'lion';

DELETE FROM animals
WHERE name LIKE 'M%';

DELETE FROM animals 
WHERE age < 9;

SELECT * FROM animals;

INSERT INTO animals ( name, type, age ) VALUES ('Leo', 'lion', 12), ('Jerry', 'mouse', 4), ('Marty', 'zebra', 10), ('Gloria', 'hippo', 8), ('Alex', 'lion', 9), ('Melman', 'giraffe', 15), ('Nala', 'lion', 2), ('Marie', 'cat', 1), ('Flounder', 'fish', 8);
SELECT * FROM animals;

ALTER TABLE animals 
ADD COLUMN location VARCHAR(255);

INSERT INTO animals (name, type, age, location)
VALUES ('Fred', 'cat', 7, 'Minnesota'), ('Louie', 'cat', 4, 'Minnesota'), ('Toby', 'dog', 14, 'Arizona');

ALTER TABLE animals
RENAME COLUMN type
TO species;

ALTER TABLE animals 
ALTER COLUMN species SET DATA TYPE VARCHAR(255);

SELECT COUNT(*) FROM track
GROUP BY genre_id;

SELECT * FROM genre;

SELECT COUNT (*) FROM track 
WHERE genre_id = 1 OR genre_id = 9
GROUP BY genre_id;

SELECT COUNT(*), artist_id FROM album 
GROUP BY artist_id;

-- CREATE TABLE users (
--   id SERIAL PRIMARY KEY,
--   name VARCHAR(255),
--   email VARCHAR(255));

-- CREATE TABLE products (
--   id SERIAL PRIMARY KEY,
--   name VARCHAR(255),
--   price INT);
  
-- CREATE TABLE cart (
--   id SERIAL PRIMARY KEY,
--   user_id INT REFERENCES users(id),
--   product_id INT REFERENCES products(id),
-- 	quantity INT
-- );


-- INSERT INTO users (name, email)
-- VALUES ('Jeff John', 'jeffjohn@hotmail.com'), ('Sally Sue', 'sallysue@gmail.com'), ('Bonnie Clyde', 'bonnieclyde@aol.com');

-- INSERT INTO products (name, price)
-- VALUES ('Candy', 5),
-- ('Meat', 10),
-- ('Vegetable', 7),
-- ('Fruit', 7),
-- ('Chips', 3);

-- SELECT * FROM users;
-- SELECT * FROM products;


-- INSERT INTO cart (product_id, user_id, quantity)
-- VALUES (2, 1, 5),
-- (3, 1, 2),
-- (1, 2, 3),
-- (5, 2, 2),
-- (4, 3, 2), 
-- (3, 3, 4);