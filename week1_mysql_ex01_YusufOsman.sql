CREATE DATABASE IF NOT EXISTS edutrack_sa;
USE edutrack_sa;

CREATE TABLE facilitators (
    facilitator_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20)
);

CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    duration_weeks INT NOT NULL,
    facilitator_id INT,
    FOREIGN KEY (facilitator_id) REFERENCES facilitators(facilitator_id)
);

CREATE TABLE trainees (
    trainee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    province VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE enrolments (
    enrolment_id INT AUTO_INCREMENT PRIMARY KEY,
    trainee_id INT,
    course_id INT,
    enrolment_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (trainee_id) REFERENCES trainees(trainee_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    CHECK (status IN ('Active', 'Completed', 'Withdrawn'))
);

INSERT INTO facilitators (first_name, last_name, email, phone) VALUES
('Thabo', 'Mbeki', 'thabo.m@edutrack.co.za', '0821234567'),
('Lerato', 'Moloi', 'lerato.m@edutrack.co.za', '0739876543'),
('Johan', 'van der Merwe', 'johan.v@edutrack.co.za', '0845551234'),
('Priya', 'Naidoo', 'priya.n@edutrack.co.za', '0612223333');

INSERT INTO courses (course_name, duration_weeks, facilitator_id) VALUES
('Backend Web Development', 12, 1),
('Frontend Frameworks', 10, 2),
('Database Administration', 8, 3),
('UI/UX Design Basics', 6, 4);

INSERT INTO trainees (first_name, last_name, email, province) VALUES
('Sipho', 'Nkosi', 'sipho.n@gmail.com', 'Gauteng'),
('Amina', 'Patel', 'amina.p@yahoo.com', 'Western Cape'),
('David', 'Smith', 'david.s@outlook.com', 'KwaZulu-Natal'),
('Zanele', 'Khumalo', 'zanele.k@gmail.com', 'Gauteng');

INSERT INTO enrolments (trainee_id, course_id, enrolment_date, status) VALUES
(1, 1, '2026-07-01', 'Active'),
(2, 2, '2026-06-15', 'Completed'),
(3, 3, '2026-07-10', 'Active'),
(4, 1, '2026-05-20', 'Withdrawn');

SELECT * FROM facilitators;
SELECT * FROM courses;
SELECT * FROM trainees;
SELECT * FROM enrolments;

SELECT CONCAT(first_name, ' ', last_name) AS full_name, province 
FROM trainees 
WHERE province = 'Gauteng';