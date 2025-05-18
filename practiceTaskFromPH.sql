CREATE TABLE diploma_student (
    id SERIAL PRIMARY KEY,
    roll INT UNIQUE,
    name VARCHAR(50),
    age INT,
    department VARCHAR(50),
    score FLOAT,
    status VARCHAR(10),
    last_login DATE
)

INSERT INTO
    diploma_student (
        roll,
        name,
        age,
        department,
        score,
        status,
        last_login
    )
VALUES (
        '2023001',
        'Rafiul Islam',
        21,
        'CSE',
        85.50,
        'passed',
        '2025-05-10'
    ),
    (
        '2023002',
        'Nusrat Jahan',
        20,
        'EEE',
        78.00,
        'passed',
        '2025-05-11'
    ),
    (
        '2023003',
        'Tanvir Ahmed',
        22,
        'CSE',
        62.30,
        'passed',
        '2025-05-09'
    ),
    (
        '2023004',
        'Sadia Hossain',
        19,
        'CIVIL',
        55.40,
        'failed',
        '2025-04-28'
    ),
    (
        '2023005',
        'Rakib Hasan',
        23,
        'ME',
        90.00,
        'passed',
        '2025-05-12'
    ),
    (
        '2023006',
        'Farzana Rahman',
        21,
        'CSE',
        47.20,
        'failed',
        '2025-04-30'
    ),
    (
        '2023007',
        'Jamil Uddin',
        20,
        'EEE',
        69.80,
        'passed',
        '2025-05-08'
    ),
    (
        '2023008',
        'Lamia Akter',
        22,
        'CIVIL',
        72.10,
        'passed',
        '2025-05-06'
    ),
    (
        '2023009',
        'Tarek Mahmud',
        24,
        'ME',
        51.60,
        'failed',
        '2025-05-07'
    ),
    (
        '2023010',
        'Mahiya Islam',
        20,
        'CSE',
        88.75,
        'passed',
        '2025-05-13'
    );

SELECT * FROM diploma_student;

-- 1. Add a column email (VARCHAR) to the existing students table.
ALTER TABLE diploma_student ADD COLUMN email VARCHAR(100);

-- 2. Rename the column email to student_email.
ALTER TABLE diploma_student RENAME COLUMN email TO student_email;

-- 3. Add a UNIQUE constraint to student_email.
ALTER TABLE diploma_student
ADD constraint unique_diplomastudent_student_email UNIQUE (student_email);

-- 4. Add a PRIMARY KEY to a new table named courses.
CREATE TABLE courses (
    course_id INT UNIQUE NOT NULL,
    course_name VARCHAR(100)
)

INSERT INTO
    courses (course_id, course_name)
VALUES (101, 'Web development'),
    (102, 'Python Programming');

ALTER TABLE courses
ADD constraint pk_courses_course_id PRIMARY KEY (course_id);

-- 5. Drop a column from any existing table.
ALTER TABLE courses DROP COLUMN course_id;

--  Filtering & Logical Operations (Based on 8-5, 8-7, 8-8)
-- 6. Write a query to find all students who have a score greater than 80 and not null.
SELECT *
FROM diploma_student
WHERE
    score > 80
    AND NOT score IS NULL

-- 7. Use the NOT operator to exclude students from a specific department.
SELECT * FROM diploma_student WHERE NOT department = 'CSE';

-- 8. Fetch students whose names start with ‘A’ using LIKE and ILIKE.
SELECT * FROM diploma_student WHERE name ILIKE ('A%');

-- 9. Select all students whose age is between 18 and 25.
SELECT * FROM diploma_student WHERE age >= 18 AND age <= 25;

-- 10 Retrieve rows using IN for a specific set of roll numbers.

-- Aggregate Functions (Based on 8-6)
-- 11. Count how many students exist in the students table.
SELECT count(*) FROM diploma_student;

-- 12. Find the average score of students in a specific department.
SELECT avg(score) FROM diploma_student WHERE department = 'CSE';

-- 13. Get the maximum and minimum age of all students.
SELECT max(age) FROM diploma_student;

SELECT min(age) FROM diploma_student;

-- Update & Delete Operations (Based on 8-9, 8-10)
-- 14. Update the status of students who scored less than 50 to 'failed'.
UPDATE diploma_student SET status = 'failed' WHERE score < 50;
-- 15. Delete students who have not logged in since last year.
DELETE FROM diploma_student
WHERE
    last_login BETWEEN '2000-01-01' AND '2025-01-01';
-- 16. Use LIMIT and OFFSET to fetch the second page of results (5 per page).
SELECT * FROM diploma_student LIMIT 5 OFFSET 5;