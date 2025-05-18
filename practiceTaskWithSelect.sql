CREATE TABLE cseStudent (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT,
    grade CHAR(2),
    course VARCHAR(50),
    email VARCHAR(100),
    dob DATE,
    blood_group VARCHAR(5),
    country VARCHAR(50)
)

INSERT INTO
    cseStudent (
        first_name,
        last_name,
        age,
        grade,
        course,
        email,
        dob,
        blood_group,
        country
    )
VALUES (
        'Ayaan',
        'Khan',
        21,
        'A+',
        'Computer Science',
        'ayaan.khan@gmail.com',
        '2003-01-12',
        'B+',
        'Bangladesh'
    ),
    (
        'Zara',
        'Ali',
        20,
        'B',
        'Mathematics',
        'zara.ali@hotmail.com',
        '2004-08-21',
        'A+',
        'India'
    ),
    (
        'Noah',
        'Rahman',
        23,
        'C+',
        'Physics',
        'noah.rahman@gmail.com',
        '2002-05-14',
        'O-',
        'Nepal'
    ),
    (
        'Maya',
        'Chowdhury',
        22,
        'A',
        'English Literature',
        NULL,
        '2003-02-10',
        'AB+',
        'Bangladesh'
    ),
    (
        'Aditya',
        'Singh',
        25,
        'B-',
        'Economics',
        'aditya25@yahoo.com',
        '2000-07-05',
        'B-',
        'India'
    ),
    (
        'Fatima',
        'Noor',
        19,
        'A-',
        'Psychology',
        'fatima.noor@gmail.com',
        '2005-11-30',
        'A-',
        'Pakistan'
    ),
    (
        'Rayhan',
        'Hossain',
        24,
        'B+',
        'History',
        NULL,
        '2001-04-09',
        'O+',
        'Bangladesh'
    ),
    (
        'Lamia',
        'Akter',
        20,
        'A+',
        'Chemistry',
        'lamia.akter@gmail.com',
        '2005-09-18',
        'A+',
        'Bangladesh'
    ),
    (
        'Kabir',
        'Ahmed',
        23,
        'C',
        'Business Studies',
        'kabir.ahmed@gmail.com',
        '2002-03-22',
        'B+',
        'India'
    ),
    (
        'Sara',
        'Begum',
        21,
        'B+',
        'Political Science',
        'sara.begum@hotmail.com',
        '2003-12-15',
        'O-',
        'Nepal'
    );

-- ✅ 1. SELECT with specific columns and alias
-- Task: Show only the first_name and email of all students, but alias the email column as "Student Email".

-- --------- Solving
SELECT first_name, email as "Student Email" FROM csestudent;

-- ✅ 2. ORDER BY
-- Task: Show all students sorted by their dob (date of birth) in descending order.
-- --------- Solving
SELECT * FROM csestudent ORDER BY dob ASC;

-- ✅ 3. DISTINCT
-- Task: Get a list of all unique blood_group values from the student table.
-- --------- Solving
SELECT DISTINCT (blood_group) FROM csestudent;

-- ✅ 4. WHERE with AND/OR
-- Task: Show students who are from Nepal or India and whose age is greater than 21.
-- --------- Solving
SELECT *
FROM csestudent
WHERE (
        country = 'Nepal'
        OR country = 'India'
    )
    AND age > 21;

-- ✅ 5. Scalar Function
-- Task: Show the first_name of each student in uppercase, and also show the length of the last_name.

-- --------- Solving
SELECT upper(first_name), LENGTH(last_name) FROM csestudent;

-- ✅ 6. Aggregate Function
-- Task: What is the average age of students from Bangladesh?
-- --------- Solving
SELECT avg(age) FROM csestudent WHERE country = 'Bangladesh';

-- ✅ 7. NULL Handling
-- Task: Show the email of each student. If the email is NULL, show "No Email".
-- --------- Solving
SELECT COALESCE(email, 'No Email') FROM csestudent;

-- ✅ 8. IN Keyword
-- Task: Show students whose blood_group is in 'A+', 'B+', or 'O+'.

-- --------- Solving
SELECT * FROM csestudent WHERE blood_group IN ('A+', 'B+', 'O+');

-- ✅ 9. BETWEEN
-- Task: Show students whose dob is between '2003-01-01' and '2005-12-31'.

-- --------- Solving
SELECT *
FROM csestudent
WHERE
    dob BETWEEN '2003-01-01' AND '2005-12-31';

-- ✅ 10. LIKE / ILIKE
-- Task: Show students whose first_name starts with the letter "T", case insensitive.
-- --------- Solving
SELECT * FROM csestudent WHERE first_name ILIKE ('T%');

-- ✅ 11. LIMIT and OFFSET
-- Task: Show 3 students from Bangladesh, skipping the first 2 records.
-- --------- Solving
SELECT *
FROM csestudent
WHERE
    country = 'Bangladesh'
LIMIT 3
OFFSET
    2;

-- ✅ 12. DELETE
-- Task: Delete students who are from Pakistan.
-- --------- Solving
DELETE FROM csestudent WHERE country = 'Pakistan'

-- ✅ 13. UPDATE
-- Task: Update the grade of the student with student_id = 5 to 'B', and update their email to 'updated5@gmail.com'.
UPDATE csestudent
SET
    grade = 'B',
    email = 'updated5@gmail.com'
WHERE
    student_id = 5;