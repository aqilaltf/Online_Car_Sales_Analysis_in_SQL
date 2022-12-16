-- In this concluding exercise we're going to use the CarsOnline dataset
-- Have you found the car just right for you, but it's miles away? No worries, just contact us at CarsOnline, buy the car online and your car will be delivered right to your door.
-- CarsOnline is a fictional online platform, allowing customers to find the right car for them, buy it online, and get it right at their doorstep.

-- The CarsOnline consists of the following tables:
-- cars - Provides details about the various cars (both sold and unsold)
-- car_types - Provides further details about the car type (i.e., Ford Mustang 1980)
-- fuel_types - Provides further details about the car fuel type (i.e., Diesel, Electric etc.)
-- transmission_types - Provides further details about the car gearbox type
-- customers - Provides details about the company’s customers who have bought at least one car
-- genders - Provides further details about the gender of each customer
-- locations - Provides further details about the location of each customer
-- sales - Provides details about each car purchase

USE carsonline;
-- Questions for this assignment
-- 1 [cars and car_types]
-- a. Write a query to display the car_id, price, car_make, car_model, and car_year for each car
SELECT a.car_type_id, a.price, b.car_make, b.car_model, b.car_year
FROM cars a LEFT JOIN car_types b
ON a.car_type_id = b.car_type_id;

-- b. restrict your query to display only cars made by bmw on 2019
SELECT a.car_id, a.price, b.car_make, b.car_model, b.car_year
FROM cars a LEFT JOIN car_types b
ON a.car_type_id = b.car_type_id
WHERE b.car_make = 'bmw' AND b.car_year = 2019;

-- c. Display the average price for each car model during this year
SELECT b.car_model, AVG(a.price) AS avg_price, b.car_year
FROM cars a JOIN car_types b
ON a.car_type_id = b.car_type_id
WHERE b.car_make = 'bmw' AND b.car_year = YEAR(CURDATE())
GROUP BY 1;

-- 2 [cars and fuel_types]
-- a. Write a query to display the car_id, price and fuel_type_name for each car
SELECT a.car_id, a.price, b.fuel_type_name
FROM cars a JOIN fuel_types b
ON a.fuel_type_id = b.fuel_type_id;

-- b. Display the number of cars by each fuel_type_name. Sort the output by the number of cars (descending)
SELECT b.fuel_type_name, COUNT(*) AS num_of_cars
FROM cars a JOIN fuel_types b
ON a.fuel_type_id = b.fuel_type_id
GROUP BY 1
ORDER BY 2 DESC;

-- 3 [cars and transmission_types]
-- a. Write a query to display the car_id, price and transmission_name for each car
SELECT a.car_id, a.price, b.transmission_name
FROM cars a JOIN transmission_types b
ON a.transmission_type_id = b.transmission_type_id;

-- b. Display the average price for each transmission_name. Sort the output by the average price (descending)
SELECT b.transmission_name, AVG(a.price) avg_price
FROM cars a JOIN transmission_types b
ON a.transmission_type_id = b.transmission_type_id
GROUP BY 1
ORDER BY 2 DESC;

-- 4 [cars, car_types and fuel_types]
-- Write a query to display the unique number of hybrid cars for each car_make. Sort the output by the number of cars (Descending)
SELECT b.car_make, COUNT(DISTINCT b.car_model) AS unique_car_model
FROM cars a
JOIN car_types b ON a.car_type_id = b.car_type_id
JOIN fuel_types c ON a.fuel_type_id = c.fuel_type_id
WHERE c.fuel_type_name = 'hybrid'
GROUP BY 1
ORDER BY 2;

-- 5 [cars, car_types and transmission_types]
-- Write a query to display the number of manual-gearbox cars, by each car_year and car_make. Sort the output by the year (ascending)
SELECT b.car_year, b.car_make, COUNT(*) AS num_car
FROM cars a
JOIN car_types b ON a.car_type_id = b.car_type_id
JOIN transmission_types c ON a.transmission_type_id = c.transmission_type_id
WHERE transmission_name = 'manual'
GROUP BY 1,2
ORDER BY 1;

-- 6 [customers and genders]
-- a. Write a query to display the customer_id, first_name, last_name, birth_date, and gender
SELECT a.customer_id, a.first_name, a.last_name, a.birth_date, b.gender
FROM customers a
JOIN genders b ON a.gender_code = b.gender_code;

-- b. Display the number of customers by each gender
SELECT b.gender, COUNT(*) AS num_of_cust
FROM customers a
JOIN genders b ON a.gender_code = b.gender_code
GROUP BY 1;

-- c. Display the number of customers by each gender and age. Sort the output by the number of customers (descending)
SELECT b.gender, TIMESTAMPDIFF(YEAR, a.birth_date, CURDATE()) AS 'age', COUNT(*) AS num_of_cust
FROM customers a
JOIN genders b ON a.gender_code = b.gender_code
GROUP BY 1,2
ORDER BY 3 DESC;

-- d. Restrict your query to for customers above the age 59
SELECT b.gender, TIMESTAMPDIFF(YEAR, a.birth_date, CURDATE()) AS 'age', COUNT(*) AS num_of_cust
FROM customers a
JOIN genders b ON a.gender_code = b.gender_code
WHERE TIMESTAMPDIFF(YEAR, a.birth_date, CURDATE()) > 59
GROUP BY 1,2
ORDER BY 3 DESC;

-- 7 [customers and locations]
-- a. Write a query to display the number of customers living in Australia.
SELECT COUNT(*) AS num_cust_australia
FROM customers a
JOIN locations b ON a.location_code = b.location_code
WHERE b.country = 'australia';

-- b. Write another query to display the number of customers with updated phone_number living in Australia (customers who has value in phone_number)
SELECT COUNT(a.phone_number) AS num_cust_australia
FROM customers a
JOIN locations b ON a.location_code = b.location_code
WHERE b.country = 'australia';

-- c. Write another query to display the number of australian customers with NULL value in their phone_number, break down the result for each city, sort it by the count (descending).
SELECT b.city, COUNT(*) AS num_cust_australia
FROM customers a
JOIN locations b ON a.location_code = b.location_code
WHERE b.country = 'australia' AND a.phone_number IS NULL
GROUP BY 1
ORDER BY 2 DESC;

-- 8 [sales and customers]
-- Write a query to display the customer_id and full name of customers who bought more than 5 cars
SELECT a.customer_id, CONCAT(b.first_name, ' ', b.last_name) AS full_name, COUNT(*) AS num_of_cars
FROM sales a
JOIN customers b ON a.customer_id = b.customer_id
GROUP BY 1
HAVING COUNT(*) > 5
ORDER BY 2 DESC;

-- 9 [sales and cars]
-- Not every car on the cars table has been sold. Write a query to display the percent of sold cars.
SELECT COUNT(a.customer_id) / COUNT(*) * 100 AS percent_of_sold_cars
FROM sales a
RIGHT OUTER JOIN cars b ON a.car_id = b.car_id;

-- 10 [sales, cars and car_types]
-- On 2019 (of purchase date), What was the average price of sold cars made by Audi?
SELECT AVG(b.price) AS avg_price
FROM sales a
JOIN cars b ON a.car_id = b.car_id
JOIN car_types c ON b.car_type_id = c.car_type_id
WHERE YEAR(a.purchase_date) = 2019 AND c.car_make = 'audi';