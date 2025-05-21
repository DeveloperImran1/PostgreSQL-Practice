CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    department_id INT REFERENCES departments (id) ON DELETE set NULL,
    last_login DATE
);

INSERT INTO
    students (
        name,
        department_id,
        last_login
    )
VALUES (
        'Rafiul Islam',
        6,
        '2025-04-05'
    ),
    (
        'Sanjida Khatun',
        8,
        '2025-02-17'
    ),
    (
        'Abdullah Al Mamun',
        9,
        '2025-03-30'
    ),
    (
        'Farzana Haque',
        10,
        '2025-01-10'
    ),
    (
        'Shahriar Noman',
        7,
        '2025-04-22'
    ),
    (
        'Mou Sultana',
        1,
        '2025-05-11'
    ),
    (
        'Tanvir Ahmed',
        2,
        '2025-02-26'
    ),
    (
        'Sabrina Rahman',
        3,
        '2025-04-15'
    ),
    (
        'Mahmud Hasan',
        4,
        '2025-03-01'
    ),
    (
        'Afsana Akter',
        5,
        '2025-05-18'
    );

CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
)

INSERT INTO
    departments (name)
VALUES ('Civil Engineering'),
    ('Physics'),
    ('Law'),
    ('Psychology'),
    ('Sociology'),
    ('Political Science'),
    ('Finance'),
    ('Pharmacy'),
    ('Environmental Science'),
    ('Journalism');

CREATE TABLE course ( id SERIAL PRIMARY KEY, title TEXT );

INSERT INTO
    course (title)
VALUES ('Thermodynamics'),
    ('Quantum Mechanics'),
    ('Criminal Law Basics'),
    ('Cognitive Psychology'),
    ('Social Research Methods'),
    ('Public Administration'),
    ('Financial Accounting'),
    ('Pharmaceutical Chemistry'),
    (
        'Climate Change and Sustainability'
    ),
    ('Media Ethics');

SELECT * FROM students;

SELECT * FROM departments;

SELECT * FROM course;

-- Task 1: Retrieve students who have logged in within the last 30 days.
SELECT *
FROM students
WHERE
    last_login > CURRENT_DATE - INTERVAL '1 month';

-- Task 2: Extract the login month from the last_login and group students by month.
SELECT
    to_char(last_login, 'Month') as monthly_loged_student,
    sum(id) as total_student
FROM students
GROUP BY
    monthly_loged_student;

-- Task 3: Count how many students logged in per month and show only those months where login count is more than 3.
SELECT
    to_char(last_login, 'Month') as monthly_loged_student,
    sum(id) as total_student
FROM students
GROUP BY
    monthly_loged_student
HAVING
    sum(id) > 3;

-- Task 4: Create a foreign key constraint on department_id in the students table referencing departments(id).

-- Task 5: Try inserting a student with a department_id that doesn’t exist and observe the behavior.

-- Task 6: Delete a department and see how students are affected using ON DELETE CASCADE and ON DELETE SET NULL.
SELECT * FROM departments;

SELECT * FROM students;

DELETE FROM departments WHERE id = 2;

DELETE FROM students WHERE department_id = 1;

DROP TABLE departments;

DROP TABLE students;

-- Task 7: Join students and departments using INNER JOIN to display each student's department name.
SELECT
    students.name as Student_name,
    departments.name as Department_name
FROM students
    INNER JOIN departments ON students.department_id = departments.id;

-- Task 8: Use a LEFT JOIN to show all students including those without a department.
SELECT *
FROM students
    LEFT JOIN departments ON students.department_id = departments.id;

-- Task 9: Use a RIGHT JOIN to show all departments including those without students.

SELECT * FROM departments

SELECT *
FROM students
    RIGHT JOIN departments ON students.department_id = departments.id;

-- Task 10: Perform a FULL JOIN to get all records from both students and departments.
SELECT *
FROM students
    FULL JOIN departments ON students.department_id = departments.id;

-- Task 11: Create a cross-product of all students and courses using CROSS JOIN.
SELECT * FROM students CROSS JOIN course;

-- Task 12: Use NATURAL JOIN between tables that have a shared column like department_id.
SELECT * FROM students NATURAL JOIN departments;