USE edutrack_sa;

SELECT 
    t.trainee_id,
    CONCAT(t.first_name, ' ', t.last_name) AS trainee_name,
    c.course_name,
    e.enrolment_date,
    e.status
FROM enrolments e
INNER JOIN trainees t ON e.trainee_id = t.trainee_id
INNER JOIN courses c ON e.course_id = c.course_id;

SELECT 
    c.course_id,
    c.course_name,
    c.duration_weeks,
    CONCAT(f.first_name, ' ', f.last_name) AS facilitator_name
FROM courses c
INNER JOIN facilitators f ON c.facilitator_id = f.facilitator_id;

SELECT 
    t.trainee_id,
    CONCAT(t.first_name, ' ', t.last_name) AS trainee_name,
    c.course_name,
    e.status
FROM trainees t
LEFT JOIN enrolments e ON t.trainee_id = e.trainee_id
LEFT JOIN courses c ON e.course_id = c.course_id;

SELECT 
    c.course_id,
    c.course_name,
    CONCAT(t.first_name, ' ', t.last_name) AS trainee_name,
    e.status
FROM enrolments e
INNER JOIN trainees t ON e.trainee_id = t.trainee_id
RIGHT JOIN courses c ON e.course_id = c.course_id;

UPDATE trainees
SET province = 'Western Cape'
WHERE trainee_id = 1;

UPDATE enrolments
SET status = 'Completed'
WHERE enrolment_id = 1;

DELETE FROM enrolments
WHERE status = 'Withdrawn'
ORDER BY enrolment_date ASC
LIMIT 1;

SELECT 
    c.course_name,
    COUNT(e.enrolment_id) AS active_enrolments
FROM courses c
INNER JOIN enrolments e ON c.course_id = e.course_id
WHERE e.status = 'Active'
GROUP BY c.course_id, c.course_name
HAVING COUNT(e.enrolment_id) >= 1
ORDER BY active_enrolments DESC;

SELECT 
    CONCAT(f.first_name, ' ', f.last_name) AS facilitator_name,
    COUNT(e.trainee_id) AS total_trainees
FROM facilitators f
JOIN courses c ON f.facilitator_id = c.facilitator_id
JOIN enrolments e ON c.course_id = e.course_id
GROUP BY f.facilitator_id, f.first_name, f.last_name
ORDER BY total_trainees DESC
LIMIT 1;

INSERT INTO facilitators (first_name, last_name, email, phone) 
VALUES ('Sipho', 'Dlamini', 'sipho.dlamini@edutrack.co.za', '0821234567');

SET @new_facilitator_id = LAST_INSERT_ID();

INSERT INTO courses (course_name, duration_weeks, facilitator_id) 
VALUES ('Cloud Computing Fundamentals', 8, @new_facilitator_id);

SET @new_course_id = LAST_INSERT_ID();

INSERT INTO enrolments (trainee_id, course_id, enrolment_date, status) 
VALUES 
    (1, @new_course_id, CURDATE(), 'Active'),
    (2, @new_course_id, CURDATE(), 'Active');

SELECT 
    t.trainee_id,
    CONCAT(t.first_name, ' ', t.last_name) AS trainee_name,
    COUNT(e.course_id) AS courses_enrolled
FROM trainees t
JOIN enrolments e ON t.trainee_id = e.trainee_id
GROUP BY t.trainee_id, t.first_name, t.last_name
HAVING COUNT(e.course_id) > 1;