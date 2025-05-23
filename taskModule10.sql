CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    score NUMERIC,
    department_id INT REFERENCES departments (id)
);

INSERT INTO
    students (
        name,
        age,
        score,
        department_id
    )
VALUES ('Rafiul Islam', 21, 87.5, 1),
    ('Nusrat Jahan', 22, 91.0, 2),
    ('Tanvir Ahmed', 20, 78.3, 3),
    ('Sanjida Haque', 23, 85.2, 4),
    ('Fahim Hasan', 19, 88.9, 5),
    ('Mou Sultana', 22, 82.0, 6),
    ('Shahriar Noman', 21, 89.5, 7),
    ('Sabrina Rahman', 20, 84.7, 8),
    ('Mahmud Hasan', 24, 90.2, 9),
    ('Farzana Haque', 23, 86.6, 10),
    ('Afsana Akter', 21, 77.3, 11),
    ('Ratul Hossain', 22, 80.5, 12),
    ('Lamia Akter', 20, 83.0, 13),
    ('Kawsar Ahmed', 23, 79.4, 14),
    ('Rakibul Islam', 21, 88.1, 15),
    (
        'Ayesha Siddique',
        22,
        91.3,
        16
    ),
    (
        'Anika Chowdhury',
        20,
        87.9,
        17
    ),
    ('Zahidul Karim', 23, 76.8, 18),
    ('Tania Akter', 19, 84.2, 19),
    ('Nasim Reza', 21, 85.6, 20);

CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO
    departments (name)
VALUES ('Computer Science'),
    ('Mathematics'),
    ('Physics'),
    ('Chemistry'),
    ('Biology'),
    ('Economics'),
    ('Statistics'),
    ('English'),
    ('History'),
    ('Philosophy'),
    ('Business Administration'),
    ('Sociology'),
    ('Psychology'),
    ('Political Science'),
    ('Law'),
    ('Education'),
    ('Geography'),
    ('Environmental Science'),
    ('Anthropology'),
    ('Linguistics');

CREATE TABLE course_enrollments (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students (id),
    course_title TEXT,
    enrolled_now DATE
);

INSERT INTO
    course_enrollments (
        student_id,
        course_title,
        enrolled_now
    )
VALUES (
        1,
        'Data Structures',
        '2025-01-10'
    ),
    (
        2,
        'Linear Algebra',
        '2025-02-14'
    ),
    (
        3,
        'Quantum Mechanics',
        '2025-03-05'
    ),
    (
        4,
        'Organic Chemistry',
        '2025-01-22'
    ),
    (5, 'Genetics', '2025-03-15'),
    (
        6,
        'Macroeconomics',
        '2025-02-01'
    ),
    (
        7,
        'Probability Theory',
        '2025-01-30'
    ),
    (
        8,
        'Shakespearean Drama',
        '2025-02-10'
    ),
    (
        9,
        'World History',
        '2025-03-25'
    ),
    (
        10,
        'Modern Philosophy',
        '2025-02-27'
    ),
    (
        11,
        'Marketing 101',
        '2025-03-03'
    ),
    (
        12,
        'Social Behavior',
        '2025-01-18'
    ),
    (
        13,
        'Cognitive Psychology',
        '2025-03-07'
    ),
    (
        14,
        'Political Theories',
        '2025-02-20'
    ),
    (
        15,
        'Introduction to Law',
        '2025-03-12'
    ),
    (
        16,
        'Educational Psychology',
        '2025-02-28'
    ),
    (
        17,
        'Geographical Systems',
        '2025-01-25'
    ),
    (
        18,
        'Climate Change',
        '2025-03-22'
    ),
    (
        19,
        'Cultural Anthropology',
        '2025-02-05'
    ),
    (
        20,
        'Phonetics and Phonology',
        '2025-01-14'
    );

-- Task 1: Retrieve all students who scored higher than the average score.
SELECT *
FROM students
WHERE
    score > (
        SELECT avg(score)
        FROM students
    );

-- Task 2: Find students whose age is greater than the average age of all students.
SELECT *
FROM students
WHERE
    age > (
        SELECT avg(age)
        FROM students
    );

-- Task 3: Get names of students who are enrolled in any course (use IN with subquery).
-- Way 1:
SELECT students.name
FROM
    students
    JOIN course_enrollments ON students.id = course_enrollments.student_id;

-- Way 2:
SELECT name
FROM students
WHERE
    id IN (
        SELECT student_id
        FROM course_enrollments
    )

-- Task 4: Retrieve departments with at least one student scoring above 90 (use EXISTS).
-- Way 1:
SELECT *
FROM departments
WHERE
    id IN (
        SELECT department_id
        FROM students
        WHERE
            score > 90
        GROUP BY
            department_id
    );

--  Way 2:
SELECT *
FROM departments
WHERE
    EXISTS (
        SELECT *
        FROM students
        WHERE
            students.department_id = departments.id
            AND students.score > 90
    );

-- Task 5: Create a view to show each student’s name, department, and score.

CREATE VIEW student_about AS
SELECT
    students.name as Student_Name,
    students.age as student_age,
    departments.name as department_name
FROM students
    JOIN departments ON students.department_id = departments.id;

-- Task 6: Create a view that lists all students enrolled in any course with the enrollment date.
CREATE VIEW enrolled_students AS
SELECT students.name, course_enrollments.course_title, course_enrollments.enrolled_now
FROM
    students
    JOIN course_enrollments ON students.id = course_enrollments.student_id;

-- Task 7: Query from your created views to verify the data.
SELECT * FROM student_about;

SELECT * FROM enrolled_students;

-- Task 8: Create a function that takes a student's score and returns a grade (e.g., A, B, C, F).
CREATE Function get_grade_with_score(p_score INT)
RETURNS VARCHAR
LANGUAGE plpgsql
AS
$$
    DECLARE

    grade VARCHAR;

    BEGIN

    IF p_score >= 90 THEN
        grade := 'A';
    ELSEIF p_score >=80 THEN
        grade := 'B';
    ELSEIF p_score >= 70 THEN
        grade := 'C';
    ELSEIF p_score >= 60 THEN
        grade := 'D';
    ELSE 
        grade := 'F';
    END IF;
    RETURN grade; 



    END 
$$;

SELECT * FROM get_grade_with_score (70);

-- Task 9: Create a function that returns the full name and department of a student by ID.
CREATE OR REPLACE FUNCTION get_name_and_department_by_id(p_id INT)
RETURNS TABLE (
    student_name VARCHAR,
    department_name VARCHAR
)
LANGUAGE PLPGSQL
AS
$$
    BEGIN
        RETURN QUERY
        SELECT
        students.name as student_name,
        departments.name as department_name
        FROM students
        JOIN departments ON students.department_id = departments.id
        WHERE students.id = p_id;
    END
$$;

-- aita bracket er moddhe value gulo output diba. ex: ("Nusrat Jahan",Mathematics)
SELECT get_name_and_department_by_id (2);

-- atia table output diba.
SELECT * FROM get_name_and_department_by_id (2);

-- Task 9: Write a stored procedure to update a student's department.
CREATE PROCEDURE department_update()
LANGUAGE PLPGSQL
as
$$
    BEGIN
        UPDATE students 
        SET department_id = 3
        WHERE id = 2;
    END;
$$;

CALL department_update ();

-- Task 9: Write a procedure to delete students who haven't enrolled in any course.
CREATE PROCEDURE delete_no_enrolled_student()
LANGUAGE PLPGSQL
AS
$$
    BEGIN
        DELETE FROM students
        WHERE id NOT IN(SELECT student_id FROM course_enrollments);

    END;
$$;

CALL delete_no_enrolled_student ();

SELECT * FROM students;

SELECT * FROM departments;

SELECT * FROM course_enrollments;