-- car sale
SELECT car_make, car_model, fuel_type_name, transmission_name, price, COUNT(*) AS num_of_cars, price*COUNT(*) AS revenue, purchase_date
FROM sales a
JOIN cars b ON a.car_id = b.car_id
JOIN fuel_types c ON b.fuel_type_id = c.fuel_type_id
JOIN car_types d ON b.car_type_id = d.car_type_id
JOIN transmission_types e ON b.transmission_type_id = e.transmission_type_id
GROUP BY 1,2,3,4
ORDER BY 1;

-- customer
SELECT gender,
CASE
	WHEN TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) BETWEEN 20 AND 30 THEN '20 - 30'
    WHEN TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) BETWEEN 31 AND 40 THEN '31 - 40'
    WHEN TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) BETWEEN 41 AND 50 THEN '41 - 50'
    WHEN TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) BETWEEN 51 AND 60 THEN '51 - 60'
    ELSE '> 60'
END AS age_range,
country, COUNT(*) AS num_of_cust
FROM customers a
JOIN genders b ON a.gender_code = b.gender_code
JOIN locations c ON a.location_code = c.location_code
GROUP BY 1,2,3
ORDER BY 4 DESC;

-- location
SELECT country, COUNT(*) AS num_of_cust
FROM sales a
JOIN customers b ON a.customer_id = b.customer_id
JOIN locations c ON b.location_code = c.location_code
GROUP BY 1
ORDER BY 2;