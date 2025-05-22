CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    department_name VARCHAR(50),
    sallary DECIMAL(10, 2),
    hire_date DATE
)

INSERT INTO
    employees (
        employee_name,
        department_name,
        sallary,
        hire_date
    )
VALUES (
        'Rahim Uddin',
        'Finance',
        55000.00,
        '2021-06-15'
    ),
    (
        'Karim Hossain',
        'HR',
        48000.00,
        '2022-03-10'
    ),
    (
        'Salma Akter',
        'Marketing',
        52000.00,
        '2023-01-05'
    ),
    (
        'Tanvir Ahmed',
        'IT',
        60000.00,
        '2020-11-25'
    ),
    (
        'Nazia Sultana',
        'Sales',
        45000.00,
        '2022-08-17'
    ),
    (
        'Afsana Rahman',
        'Support',
        40000.00,
        '2023-05-20'
    ),
    (
        'Shahriar Noman',
        'Finance',
        61000.00,
        '2021-12-01'
    ),
    (
        'Farzana Haque',
        'HR',
        47000.00,
        '2022-10-08'
    ),
    (
        'Raihan Kabir',
        'Marketing',
        53000.00,
        '2023-02-12'
    ),
    (
        'Mahmud Hasan',
        'IT',
        62000.00,
        '2020-09-14'
    ),
    (
        'Shamim Reza',
        'Sales',
        46000.00,
        '2021-07-19'
    ),
    (
        'Sabrina Islam',
        'Support',
        42000.00,
        '2022-04-21'
    ),
    (
        'Mehedi Hasan',
        'Finance',
        59000.00,
        '2023-06-09'
    ),
    (
        'Tanjila Akter',
        'HR',
        49000.00,
        '2021-03-16'
    ),
    (
        'Zahidul Islam',
        'Marketing',
        51000.00,
        '2022-11-29'
    ),
    (
        'Sumaiya Rahman',
        'IT',
        64000.00,
        '2020-10-02'
    ),
    (
        'Rumana Begum',
        'Sales',
        47000.00,
        '2023-01-25'
    ),
    (
        'Anisur Rahman',
        'Support',
        41000.00,
        '2022-06-13'
    ),
    (
        'Nilufa Yasmin',
        'Finance',
        58000.00,
        '2021-08-04'
    ),
    (
        'Jamil Hossain',
        'HR',
        50000.00,
        '2023-03-31'
    );

SELECT * FROM employees;
-- Retrive all empolyees whoes sallary is getter then the highest sallary of the HR department.  ---------->(aikhen 2ta part ase. 1st part: HR department er moddhe Highest sallary ber korte hobe. 2nd part: Oi highest sallary theke all employe er moddhe ar keke besi sallary pai, sei employe der ke ber korte hobe.)

-- 1st part:
SELECT MAX(sallary) FROM employees WHERE department_name = 'HR';

-- 2nd part:
SELECT * FROM employees WHERE sallary > 50000;

-- Aikhen amra highest sallary te heartcot vabe diasi. But HR er highest sallary te change oo hote pare. Aijonno uporer query ta 2nd part a bosate hobe. Thats mean nested query korte hobe. Jar jonno First bracket use () korte hobe. (er moddhe new query likhte parbo.)

-- Nested query:
SELECT *
FROM employees
WHERE
    sallary > (
        SELECT MAX(sallary)
        FROM employees
        WHERE
            department_name = 'HR'
    );

-- Sub query can
-- 1. Can return a single value
-- 2. can return multiples row
-- 3. Can return a single columns

-- ex1: aita error diba.
SELECT *, ( SELECT sallary FROM employees ) FROM employees;

-- ex2: aita right
SELECT *, ( SELECT sum(sallary) FROM employees ) FROM employees;
-- [Note: select query er moddhe jodi kono sub query likha hoi, seita sudho akta data return korte pare. akadhik row ba akadhik column return korte parbena. Sudho akta column er akta row er value return korte parbe. aijonnoi ex1 a error dissa. ]

-- ex 3:
SELECT department_name
FROM -- aita holo main query / outer query
    (
        SELECT department_name
        FROM employees
        GROUP BY
            department_name
    ) as sum_dep_sallary;
-- aita holo sub query

-- ex 4:
SELECT * FROM employees;

( SELECT MAX(sallary) FROM employees WHERE department_name = 'HR' );

-- ex 5:
-- aikhane 3ta part:
-- 1st part: SELECT department_name FROM employees WHERE department_name LIKE '%R%'
-- 2nd part: WHERE department_name in(value1, value2, value3 ,,,)
-- 3rd part: SELECT employee_name, sallary, department_name FROM employees

SELECT
    employee_name,
    sallary,
    department_name
FROM employees
WHERE
    department_name in (
        SELECT department_name
        FROM employees
        WHERE
            department_name LIKE '%R%'
    );