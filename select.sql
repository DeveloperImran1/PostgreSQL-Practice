CREATE TABLE student (
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
    student (
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
        'Rafi',
        'Hasan',
        22,
        'A+',
        'Computer Science',
        'rafi22@gmail.com',
        '2003-06-12',
        'O+',
        'Bangladesh'
    ),
    (
        'Nusrat',
        'Jahan',
        21,
        'A',
        'Business Studies',
        'nusratjahan21@yahoo.com',
        '2004-01-23',
        'A-',
        'Bangladesh'
    ),
    (
        'Tarek',
        'Rahman',
        23,
        'B+',
        'Physics',
        'tarek.r@gmail.com',
        '2002-03-15',
        'B+',
        'Bangladesh'
    ),
    (
        'Mitu',
        'Akter',
        20,
        'A-',
        'English Literature',
        'mitu.akter@gmail.com',
        '2005-07-09',
        'AB+',
        'India'
    ),
    (
        'Sohan',
        'Ali',
        24,
        'C+',
        'Economics',
        'sohan.ali24@gmail.com',
        '2001-09-25',
        'O-',
        'Bangladesh'
    ),
    (
        'Farzana',
        'Khan',
        22,
        'A',
        'Chemistry',
        'farzana.khan@gmail.com',
        '2003-12-11',
        'B-',
        'Pakistan'
    ),
    (
        'Jamal',
        'Uddin',
        25,
        'B-',
        'Mathematics',
        'jamal.u@gmail.com',
        '2000-04-18',
        'A+',
        'Bangladesh'
    ),
    (
        'Mariya',
        'Islam',
        21,
        'A+',
        'History',
        'mariya.islam@hotmail.com',
        '2004-05-22',
        'O+',
        'Nepal'
    ),
    (
        'Tanvir',
        'Hossain',
        23,
        'B',
        'Political Science',
        'tanvir.hossain@gmail.com',
        '2002-11-30',
        'AB-',
        'Bangladesh'
    ),
    (
        'Anika',
        'Sultana',
        20,
        'A-',
        'Psychology',
        'anika.sultana@gmail.com',
        '2005-03-08',
        'B+',
        'Bangladesh'
    )

SELECT * FROM student;
-- Table er all column er data show hobe.

SELECT first_name FROM student;
-- sudho firse_name column er data show hobe.

SELECT email, age FROM student;
-- sudho email and age column er data show hobe.

SELECT email as "Student Email" FROM student;
-- student er email gulo show hobe. But Column er name hisabe show hobe Student Email.  actual name silo emal k alias korese. Aikhane amra double cottation use koresi. Karon SQL a column name k all time double couteation dia use kora hoi. Ar string ke single cottation dia use kora hoi.

SELECT * FROM student ORDER BY first_name ASC;
-- order by er maddhome kono column er value ke ascending or descending a filter kora jai.
SELECT * FROM student ORDER BY first_name DESC;

SELECT * FROM student ORDER BY dob ASC;

-- kono attribute or column er unique data gulo show korbe
SELECT DISTINCT country FROM student;
-- aikhane country er poriborte jekono attribute dita pari.

-- Data filtering test

SELECT * FROM student;

-- 1. Select student form Bangladesh
SELECT * FROM student WHERE country = 'Bangladesh';

-- 2. Select student with 'B+' grade in Physics
SELECT * FROM student WHERE course = 'Physics' AND grade = 'B+'

-- 3. Select student with specific bloog group ('A+')
SELECT * FROM student WHERE blood_group = 'A+';

-- 4. Select student from the India or Pakistan
SELECT *
FROM student
WHERE
    country = 'India'
    OR country = 'Pakistan';

-- 5. Select student from the India or Nepal and the age is 20
SELECT *
FROM student
WHERE (
        country = 'India'
        OR country = 'Nepal'
    )
    AND age = 20;

-- 6. Select student with a grade of 'A' or 'B' in Business Studies or Physics.
SELECT *
FROM student
WHERE (
        grade = 'A'
        OR grade = 'B'
    )
    AND (
        course = 'Business Studies'
        OR course = 'Physics'
    );

--7. select student, whose age getter then 20 and course 'Physics'
SELECT * FROM student WHERE age > 20 AND course = 'Physics';

-- Select student whose age is not equal to 20
SELECT * FROM student WHERE age != 20;

SELECT * FROM student WHERE age <> 20;
-- Not Equal ke <> ai symboll diaw likhte pari.

SELECT * FROM student WHERE NOT age = 20;
-- NOT keyword er maddhome !== kei mean kore.

-- -------------------- SQL er Scalar function ---------
SELECT upper(first_name) FROM student;
-- first_name column sudho get hobe and all name upper case a hobe.
SELECT upper(first_name) as first_name_in_upper_case FROM student;
-- aitao same kaj ee hobe, but column name ta alias hoia first_name_in_upper_case name show korbe.

SELECT concat(first_name, ' ', last_name) FROM student;
-- 2 ta column er value ke concat kore.

SELECT length(first_name) FROM student;
-- every row er first_name er length ta show hobe.

-- -------------------- SQL er Aggregate function ---------
SELECT avg(age) from student;

SELECT max(age) FROM student;

SELECT min(age) FROM student;

SELECT count(age) FROM student;
-- koita row te age column er value ase.
SELECT count(*) FROM student;
-- koita row ase total.

SELECT max(length(first_name)) FROM student;
-- kon first_name er length besi. Seita return korbe.

----------------- NULL data type ----------------

SELECT *
FROM student
    -- WHERE email = 'null'; --- aivabe kaj hobena. Karon null er sathe email equal korle, true or false output dibana. Null output a asbe.
WHERE
    email IS NULL;
-- IS Keyword use kore hobe. Jar maddhome, bolte pari email holo null.

-- Jodi kono attribute er value null pawa jai, tader ke akta default value dia front-end a pathabo. tahole amra COALESCE() method use korte pari.
SELECT COALESCE(NULL, 5);
-- Output: 5
SELECT COALESCE(NULL, NULL, 5);
-- Output: 5
SELECT COALESCE( NULL, 'Email', NULL, NULL, '10' );
-- Output: Email  --> Thats mean: Coalesce er maddhome tar perameter a jodi null kono value ase, seita ke skip kore porer value ta output a dei.

SELECT email FROM student;
-->
SELECT COALESCE(email, 'Email nai') FROM student;
--> ai code er maddhome, every row er email field er value gulo output a asbe. Jodi kono email er value null hoi. Tahole oi value skip kore porer value 'Email nai' aita show hobe. Jeita default value er moto kaj kore.

---- ------- IN Keyword useing -------------
SELECT * FROM student;

-- Ai code a every condition a country attribute er name ta likhte hosse. Aita easy korar jonno IN keyword use hoi.
SELECT *
FROM student
WHERE
    country = 'India'
    OR country = 'Nepal'
    OR country = 'Pakistan';

-- IN keyword er perameter a jei value gulo niase, seigulo jei jei row er country er value hisabe ase. Tader ke find koro.
SELECT *
FROM student
WHERE
    country IN ('India', 'Nepal', 'Pakistan');

--'India', 'Nepal', 'Pakistan' country gulo bade all country gulo query hobe.
SELECT *
FROM student
WHERE
    country NOT IN ('India', 'Nepal', 'Pakistan');

-- --------------- BETWEEN keyword er using ----------------------

-- 20 theke 23 er moddhe age er jei student ase, tader ke query korbe.
SELECT * FROM student WHERE age BETWEEN 20 AND 23;

-- Uporer kajtai korbe, But serialy show hobe.
SELECT * FROM student where age BETWEEN 20 AND 23 ORDER BY age;

-- Date of birtth ke query korbo
SELECT *
FROM student
WHERE
    dob BETWEEN '2002-01-01' AND '2004-01-01'
ORDER BY dob;

-- --------------- LIKE and ILIKE keyword er using ----------------------

-- Like operator er maddhome, first_name er jei jei value gulo M letter dia suro hoisa. But last a ja issa, tai thakuk somossa nai. Taderke query korbe.
SELECT * FROM student WHERE first_name LIKE ('M%')

-- Like operator er maddhome, first_name er jei jei value gulo 'a' letter dia ses hoisa. But samne ja issa, tai thakuk somossa nai. Taderke query korbe.  Tar mane '%' symboll dia mean kortese,, Je kono dhoroner letter jotoguo issa thakte pare.
SELECT * FROM student WHERE first_name LIKE ('%a');

-- 1 ta underscore(_) dia bujhai, akta letter por, 2 ta underscore dia bujha 2 ta charrecter por. ar '%' dia bujhai jekon letter hote pare. so ai code er mane holo: 2 ta letter por 're' letter thakbe and last a jekono kiso thakte pare.
SELECT * FROM student WHERE first_name LIKE ('__re%');

-- LIKE and ILIKE er kaj same to same. But LIKE holo case sencitive. Ar ILIKE holo case In sencitive.
SELECT * FROM student WHERE first_name ILike ('m%');

--  ------------- LIMIT and OFFSET --------------------

-- LIMIT 5 mane: SELECT * FROM student; jei data return korto, tar theke 1st 5 ta data get korbe.
SELECT * FROM student LIMIT 5;

-- Bangladesh coutry er jotogulo data ase, tader moddhe 1st 5 ta data query korbe.
SELECT * FROM student WHERE country IN ('Bangladesh') LIMIT 5;

-- OFFSET 2 mane: SELECT * FROM student; jei data return korto, tar theke 1st 2 ta data bad dia porer 5 ta data get korbe.
SELECT * FROM student LIMIT 5 OFFSET 2;

-- Bangladesh coutry er jotogulo data ase, tader moddhe 1st 3 ta data bad dia porer 3 ta data query korbe.
SELECT *
FROM student
WHERE
    country IN ('Bangladesh')
LIMIT 3
OFFSET
    3;

--  ------------- DELETE Operator --------------------
-- student table er all row er data delete korbe. So, it danger
DELETE FROM student;

-- Jader age 20 tader k delete kobe. Aikhane jekono condition dia delete korte pari.
DELETE FROM student WHERE age = 20;

--  ------------- UPDATE Operator --------------------
SELECT * FROM student;

-- Aita korle, all row er email er value change hoia default email set hoia jabe. so specific kore condition dia bole dita hobe.
UPDATE student SET email = 'default@gmail.com';

-- specific akta row er email update koorbo, condition dia.
UPDATE student
SET
    email = 'default@gmail.com'
WHERE
    student_id = 36;

-- specific akta row er akadhik attribute update korte pari, condition dia.
UPDATE student
SET
    email = 'default@gmail.com',
    age = 19,
    course = 'History'
WHERE
    student_id = 36;