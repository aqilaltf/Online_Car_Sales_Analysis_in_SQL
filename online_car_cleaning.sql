USE carsonline;

-- 1. Check Missing Values
SELECT * FROM cars
WHERE car_id IS NULL OR price IS NULL OR car_type_id IS NULL OR transmission_type_id IS NULL OR fuel_type_id IS NULL
LIMIT 100;

SELECT * FROM car_types
WHERE car_type_id IS NULL OR car_make IS NULL OR car_model IS NULL OR car_year IS NULL
LIMIT 100;

SELECT * FROM customers
WHERE customer_id IS NULL OR first_name IS NULL OR last_name IS NULL OR email IS NULL OR street_address IS NULL OR phone_number IS NULL OR birth_date IS NULL OR gender_code  IS NULL OR location_code IS NULL
LIMIT 100;
-- there is missing values in phone number and location code

SELECT phone_number FROM customers
WHERE phone_number IS NULL;

SELECT location_code FROM customers
WHERE location_code IS NULL;


SELECT * FROM fuel_types
WHERE fuel_type_id IS NULL OR fuel_type_name IS NULL
LIMIT 100;

SELECT * FROM genders
WHERE gender_code IS NULL OR gender IS NULL
LIMIT 100;

SELECT * FROM locations
WHERE location_code IS NULL OR country IS NULL OR city IS NULL
LIMIT 100;

SELECT * FROM sales
WHERE sale_id IS NULL OR car_id IS NULL OR customer_id IS NULL OR purchase_date IS NULL
LIMIT 100;

SELECT * FROM transmission_types
WHERE transmission_type_id IS NULL OR transmission_name IS NULL
LIMIT 100;


-- 2. Check Duplicate
SELECT car_id, COUNT(car_id), price, COUNT(price), car_type_id, COUNT(car_type_id), transmission_type_id, count(transmission_type_id), fuel_type_id, COUNT(fuel_type_id)
FROM cars
GROUP BY 1,3,5,7,9
HAVING COUNT(car_id) >1 AND COUNT(price) >1 AND COUNT(car_type_id)>1 AND count(transmission_type_id)>1 AND COUNT(fuel_type_id)>1
LIMIT 100;

SELECT car_type_id, COUNT(car_type_id), car_make, COUNT(car_make), car_model, COUNT(car_model), car_year, COUNT(car_year)
FROM car_types
GROUP BY 1,3,5,7
HAVING COUNT(car_type_id) >1 AND COUNT(car_make) >1 AND COUNT(car_model)>1 AND count(car_year)>1
LIMIT 100;

SELECT customer_id, COUNT(customer_id), first_name, COUNT(first_name), last_name, COUNT(last_name), email, COUNT(email), street_address, COUNT(street_address), phone_number, COUNT(phone_number), birth_date, COUNT(birth_date), gender_code, COUNT(gender_code), location_code, COUNT(location_code)
FROM customers
GROUP BY 1,3,5,7,9,11,13,15,17
HAVING COUNT(customer_id) >1 AND COUNT(first_name) >1 AND COUNT(last_name)>1 AND COUNT(email) >1 AND COUNT(street_address) >1 AND COUNT(phone_number) >1 AND COUNT(birth_date) >1 AND COUNT(gender_code) >1 AND COUNT(location_code) >1
LIMIT 100;

SELECT fuel_type_id, COUNT(fuel_type_id), fuel_type_name, COUNT(fuel_type_name)
FROM fuel_types
GROUP BY 1,3
HAVING COUNT(fuel_type_id) >1 AND COUNT(fuel_type_name) >1
LIMIT 100;

SELECT gender_code, COUNT(gender_code), gender, COUNT(gender)
FROM genders
GROUP BY 1,3
HAVING COUNT(gender_code) >1 AND COUNT(gender) >1
LIMIT 100;

SELECT location_code, COUNT(location_code), country, COUNT(country), city, COUNT(city)
FROM locations
GROUP BY 1,3,5
HAVING COUNT(location_code) >1 AND COUNT(country) >1 AND COUNT(city)>1
LIMIT 100;

SELECT sale_id, COUNT(sale_id), car_id, COUNT(car_id), customer_id, COUNT(customer_id), purchase_date, COUNT(purchase_date)
FROM sales
GROUP BY 1,3,5,7
HAVING COUNT(sale_id) >1 AND COUNT(car_id) >1 AND COUNT(customer_id) >1 AND COUNT(purchase_date) >1
LIMIT 100;

SELECT transmission_type_id, COUNT(transmission_type_id), transmission_name, COUNT(transmission_name)
FROM genders
GROUP BY 1,3
HAVING COUNT(transmission_type_id) >1 AND COUNT(transmission_name) >1
LIMIT 100;