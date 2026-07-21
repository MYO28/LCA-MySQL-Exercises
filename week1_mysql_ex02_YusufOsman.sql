USE edutrack_sa;

SELECT * FROM trainees 
ORDER BY last_name ASC;

SELECT * FROM courses 
ORDER BY duration_weeks DESC;

SELECT * FROM enrolments 
ORDER BY enrolment_date DESC 
LIMIT 3;

SELECT * FROM trainees 
WHERE province = 'Gauteng';

SELECT * FROM trainees 
WHERE first_name LIKE 'S%';

SELECT * FROM courses 
WHERE duration_weeks > 8;

SELECT * FROM enrolments 
WHERE status = 'Active';

SELECT COUNT(trainee_id) AS total_trainees 
FROM trainees;

SELECT AVG(duration_weeks) AS average_duration 
FROM courses;

SELECT MAX(duration_weeks) AS max_duration 
FROM courses;

SELECT course_id, COUNT(enrolment_id) AS enrolment_count 
FROM enrolments 
GROUP BY course_id;

SELECT province, COUNT(trainee_id) AS trainee_count 
FROM trainees 
GROUP BY province;

SELECT province, COUNT(trainee_id) AS trainee_count 
FROM trainees 
GROUP BY province 
HAVING COUNT(trainee_id) > 1;

SELECT * FROM enrolments 
ORDER BY enrolment_date DESC 
LIMIT 2 OFFSET 1;

SELECT * FROM trainees 
WHERE email LIKE '%.co.za';

SELECT f.first_name, f.last_name, COUNT(c.course_id) AS course_count 
FROM facilitators f
JOIN courses c ON f.facilitator_id = c.facilitator_id
GROUP BY f.facilitator_id, f.first_name, f.last_name
HAVING COUNT(c.course_id) > 1;