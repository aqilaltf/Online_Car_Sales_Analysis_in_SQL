USE onlinecampus;
-- 1.	Write a query to display all of the information inside courses table
SELECT * FROM courses LIMIT 10;

-- 2.	Write a query to display for each course - the course_id, price_usd, num_students, and content_duration_minutes
SELECT course_id, price_usd, num_students, content_duration_minutes FROM courses LIMIT 10;

-- 3.	Write a query to display the :
-- 		a. course_title
-- 		b. num_students
-- 		c. positive_reviews + negative_reviews (name this calculation: `total_reviews` for example)
-- 		d. A new column representing the ratio between the total_reviews & num_students: (positive_reviews + negative_reviews) / num_students
SELECT course_title, num_students, positive_reviews + negative_reviews AS total_reviews, (positive_reviews + negative_reviews) / num_students AS reviews_ratio FROM courses LIMIT 10;

-- 4.	Write a query to display the course_id, course_title, num_lessons, content_duration_minutes, and a new column representing the average duration for each lecture (content_duration_minutes / num_lessons)
SELECT course_id, course_title, num_lessons, content_duration_minutes, content_duration_minutes / num_lessons AS avg_lctrs_durations_min FROM courses LIMIT 10;

-- 5.	Write a query to display the
-- 		a. course_id
-- 		b. course_title
-- 		c. num_students
-- 		d. price_usd (the column represents price in USD)
-- 		e. Total course revenues in USD (num_students * price_usd)
SELECT course_id, course_title, num_students, price_usd, num_students * price_usd AS course_revenues_usd FROM courses LIMIT 10;

-- 6.	Write a query to display the course_id, and course_subject concatenated with course_title
SELECT course_id, CONCAT(course_subject, ' ', course_title) AS course_details FROM courses LIMIT 10;

-- 7.	Write a query to display the course_id, price_usd, content_duration_minutes, and a new column representing the content duration in hours (content_duration_minutes / 60)
SELECT course_id, price_usd, content_duration_minutes, content_duration_minutes / 60 AS content_duration_hours FROM courses LIMIT 10;

-- 8.	Write a query to display the distinct values in course_subject column
SELECT DISTINCT course_subject AS unique_list_of_subjects FROM courses LIMIT 10;

-- 9.	Write a query to display the unique values in course_level column
SELECT DISTINCT course_level AS unique_list_of_levels FROM courses;

-- 10.	Write a query to display the distinct combination of values in course_subject and course_level columns
SELECT DISTINCT course_subject, course_level FROM courses LIMIT 10;