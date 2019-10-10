1: 

SELECT * FROM invoice i
JOIN invoice_line il 
ON il.invoice_id = i.invoice_id
WHERE il.unit_price > 0.99;

2: 

SELECT invoice.invoice_date, customer.first_name, customer.last_name, invoice.total
FROM invoice
INNER JOIN customer
ON invoice.customer_id = customer.customer_id

3: 

SELECT customer.first_name, customer.last_name, employee.first_name, employee.last_name
FROM customer
JOIN employee
ON customer.support_rep_id = employee.employee_id

4: 

SELECT al.title, a.name
FROM album al
JOIN artist a
ON al.artist_id = a.artist_id

5: 

SELECT pt.track_id
FROM playlist_track pt
JOIN playlist p
ON pt.playlist_id = p.playlist_id

6: 

SELECT t.name
FROM track t
JOIN playlist_track pt
ON pt.track_id = t.track_id
WHERE pt.playlist_id = 5

7:

SELECT t.name, p.name
FROM track t
JOIN playlist_track pt
ON t.track_id = pt.track_id
JOIN playlist p
ON pt.playlist_id = p.playlist_id

8:

SELECT t.name, al.title
FROM track t
JOIN album al
ON t.album_id = al.album_id
JOIN genre g
ON g.genre_id = t.genre_id
WHERE g.name = 'Alternative & Punk'





1: 

SELECT * FROM invoice
WHERE invoice_id
IN (SELECT invoice_id FROM invoice_line 
WHERE unit_price > 0.99)

2: 

SELECT * FROM playlist_track
WHERE playlist_id 
IN (SELECT playlist_id FROM playlist
WHERE name = 'Music')

3:

SELECT name FROM track
WHERE track_id 
IN (SELECT track_id FROM playlist_track 
WHERE playlist_id = 5)

4: 

SELECT * FROM track
WHERE genre_id 
IN (SELECT genre_id FROM genre
WHERE name = 'Comedy')

5:

SELECT * FROM track 
WHERE album_id
IN (SELECT album_id FROM album
WHERE title = 'Fireball')

6: 

SELECT * FROM track 
WHERE album_id 
IN (SELECT album_id FROM album 
WHERE artist_id 
IN (SELECT artist_id FROM artist
WHERE name = 'Queen')) 





1:

UPDATE customer 
SET fax = NULL
WHERE fax is NOT NULL

2:

UPDATE customer
SET company = 'Self'
WHERE company IS NULL

3:

UPDATE customer
SET last_name = 'Thompson'
WHERE first_name = 'Julia'
AND last_name = 'Barnett';

4:

UPDATE customer
SET support_rep_id = 4
WHERE email = 'luisrojas@yahoo.cl'

5: 

UPDATE track
SET composer = 'The darkness around us'
WHERE genre_id = (SELECT genre_id 
FROM genre WHERE name = 'Metal')
AND composer IS NULL





1:

SELECT COUNT(*), g.name
FROM track t
JOIN genre g 
ON t.genre_id = g.genre_id
GROUP bY g.name


2: 

SELECT COUNT(*), g.name
FROM track t
JOIN genre g
ON t.genre_id = g.genre_id
WHERE g.name = 'Pop' OR g.name = 'Rock'
GROUP BY g.name

3: 

SELECT artist.name, COUNT(*)
FROM album
JOIN artist
ON artist.arist_id = album.artist_id
GROUP BY artist.name





1:

SELECT DISTINCT composer
FROM track

2: 

SELECT DISTINCT billing_postal_code
FROM invoice

3:

SELECT DISTINCT company
FROM customer



1: 

DELETE FROM practice_delete WHERE type = 'bronze' 

2:

DELETE FROM practice_delete WHERE type = 'silver'

3:

DELETE FROM practice_delete WHERE value = 150







1:

CREATE TABLE users (
users_id SERIAL PRIMARY KEY,
name VARCHAR(80),
email VARCHAR (100)

);

CREATE TABLE products (
products_id SERIAL PRIMARY KEY,
name VARCHAR(80),
price INTEGER

);

CREATE TABLE orders(
	order_id SERIAL PRIMARY KEY NOT NULL,
products_id INT,
FOREIGN KEY (products_id) REFERENCES products(products_id)
);



INSERT INTO users
(name, email)
VALUES
('Naji', 'Binx3000@live.com'),
('Jess', 'JessAlba@gmail.com'),
('Bobby', 'BobbyBrown@yahoo.com');

INSERT INTO products
(name, price)
VALUES
('Orange', 1.50),
('Mac Book', 3000.00),
('I Phone', 600.00);

INSERT INTO orders (products_id)
VALUES (1),(2),(3)




SELECT * FROM products
WHERE products_id = 1

SELECT * FROM orders


SELECT SUM(orders.quanity * products.price)
FROM orders 
INNER JOIN products
ON orders.products_id = products.products_id
WHERE order_id = 1

ALTER TABLE users
ADD COLUMN order_id INT REFERENCES orders(order_id)

UPDATE users
SET order_id = users_id

SELECT * FROM users 
WHERE order_id = 1

-- SELECT * FROM orders
-- WHERE users_id = 1

SELECT COUNT (*) FROM users
WHERE order_id = 1