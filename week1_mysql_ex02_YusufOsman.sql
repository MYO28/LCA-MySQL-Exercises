USE edutrack_sa;

SELECT * 
FROM trainees 
ORDER BY surname ASC;

SELECT * 
FROM courses 
ORDER BY duration_weeks DESC;

SELECT * 
FROM enrolments 
ORDER BY enrolment_date DESC 
LIMIT 3;

SELECT * 
FROM trainees 
WHERE province = 'Gauteng';

SELECT * 
FROM trainees 
WHERE first_name LIKE 'A%';

SELECT * 
FROM courses 
WHERE duration_weeks > 6;

SELECT * 
FROM enrolments 
WHERE status = 'Active';

SELECT COUNT(*) AS total_trainees 
FROM trainees;

SELECT 
    AVG(duration_weeks) AS average_duration_weeks, 
    MAX(duration_weeks) AS max_duration_weeks 
FROM courses;

SELECT 
    course_id, 
    COUNT(*) AS total_enrolments 
FROM enrolments 
GROUP BY course_id;

SELECT 
    province, 
    COUNT(*) AS trainee_count 
FROM trainees 
GROUP BY province;

SELECT 
    province, 
    COUNT(*) AS trainee_count 
FROM trainees 
GROUP BY province 
HAVING COUNT(*) > 1;

SELECT * 
FROM enrolments 
ORDER BY enrolment_date DESC 
LIMIT 2 OFFSET 1;

SELECT * 
FROM trainees 
WHERE email LIKE '%.co.za';

SELECT 
    CONCAT(f.first_name, ' ', f.surname) AS facilitator_name,
    COUNT(c.course_id) AS courses_facilitated
FROM facilitators f
JOIN courses c ON f.facilitator_id = c.facilitator_id
GROUP BY f.facilitator_id, f.first_name, f.surname
HAVING COUNT(c.course_id) > 1;