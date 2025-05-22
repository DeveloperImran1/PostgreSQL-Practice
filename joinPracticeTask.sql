-- Creating the employees table
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT REFERENCES departments (department_id),
    salary DECIMAL(10, 2),
    hire_date DATE
);

-- Creating the departments table
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50)
);

-- Inserting sample data into the departments table
INSERT INTO
    departments (department_name)
VALUES ('HR'),
    ('Marketing'),
    ('Finance'),
    ('IT'),
    ('Sales'),
    ('Engineering'),
    ('Customer Support'),
    ('Administration'),
    ('Research'),
    ('Quality Assurance');

-- Inserting sample data into the employees table with a foreign key constraint
INSERT INTO
    employees (
        employee_name,
        department_id,
        salary,
        hire_date
    )
VALUES (
        'John Doe',
        1,
        60000.00,
        '2022-01-10'
    ),
    (
        'Jane Smith',
        2,
        75000.50,
        '2021-05-22'
    ),
    (
        'Bob Johnson',
        3,
        80000.75,
        '2020-11-15'
    ),
    (
        'Alice Williams',
        4,
        90000.25,
        '2019-08-03'
    ),
    (
        'David Lee',
        5,
        65000.50,
        '2020-03-18'
    ),
    (
        'Sara Brown',
        6,
        70000.00,
        '2021-09-28'
    ),
    (
        'Mike Miller',
        7,
        55000.75,
        '2022-02-05'
    ),
    (
        'Emily Davis',
        8,
        95000.00,
        '2018-12-12'
    ),
    (
        'Chris Wilson',
        9,
        72000.50,
        '2020-06-30'
    ),
    (
        'Amy White',
        10,
        68000.25,
        '2021-11-09'
    ),
    (
        'John Johnson',
        1,
        62000.00,
        '2022-01-15'
    ),
    (
        'Jessica Thompson',
        2,
        78000.50,
        '2021-06-05'
    ),
    (
        'Michael Harris',
        3,
        85000.75,
        '2020-11-25'
    ),
    (
        'Emma Martinez',
        4,
        92000.25,
        '2019-09-15'
    ),
    (
        'James Taylor',
        5,
        67000.50,
        '2020-04-08'
    ),
    (
        'Sophia Anderson',
        6,
        72000.00,
        '2021-10-10'
    ),
    (
        'William Jackson',
        7,
        56000.75,
        '2022-02-10'
    ),
    (
        'Olivia Nelson',
        8,
        97000.00,
        '2018-12-20'
    ),
    (
        'Daniel White',
        9,
        73000.50,
        '2020-07-05'
    ),
    (
        'Ava Wilson',
        10,
        69000.25,
        '2021-11-15'
    ),
    (
        'Matthew Brown',
        1,
        63000.00,
        '2022-01-20'
    ),
    (
        'Emily Garcia',
        2,
        76000.50,
        '2021-06-15'
    ),
    (
        'Christopher Allen',
        3,
        86000.75,
        '2020-12-05'
    ),
    (
        'Madison Hall',
        4,
        93000.25,
        '2019-09-25'
    ),
    (
        'Andrew Cook',
        5,
        68000.50,
        '2020-04-18'
    ),
    (
        'Abigail Torres',
        6,
        73000.00,
        '2021-10-20'
    ),
    (
        'Ethan Murphy',
        7,
        57000.75,
        '2022-02-15'
    ),
    (
        'Ella King',
        8,
        98000.00,
        '2018-12-28'
    ),
    (
        'Nathan Rivera',
        9,
        74000.50,
        '2020-07-15'
    ),
    (
        'Mia Roberts',
        10,
        70000.25,
        '2021-11-20'
    );

SELECT * FROM departments;

SELECT * FROM employees;

-- Task 1: Inner Join to Retrieve Employee and Department Information
-- Way 1: Join er syntax holo:
-- SELECT *
-- FROM jei_table_er_sathe_add_korbo
--     JOIN jei_table_ke_add_korbo ON condition;

SELECT *
FROM employees
    JOIN departments ON employees.employee_id = departments.department_id;

-- Way 2: Join er syntax holo:
-- SELECT * FROM jei_table_er_sathe_join_korbo
-- JOIN jei_table_ke_join_korbo USING(jei_column_er_sathe_match_korbo);

SELECT * FROM employees JOIN departments USING (department_id);

-- [Way 2 er syntax age use korini. Age jei syntax gulo use kokresi, seigulo condtion dita vul hote pare. So using keyword dia easily condition ta add kora jai. 2ta table er moddhe jei column match korte chai. sudho sei column er name bole dita hoi.]

-- Task 2: Group By Department with Average Salary
-- Jeheto group by er maddhome department_name ke group koresi, so output hisabe sudho department_name ee get korte parbo. ar karon akta common department_name er under a onek gulo row thakte pare. Kinot group by sob gulo row ke, sudho akta row er maddhome output diba. Tai amra another kiso get korte parbona. Tobe aggregate function er maddhome oi each column er upor loop chalia akta output like: count, avg etc. output get korte pari.
SELECT department_name, round(avg(salary))
FROM departments
    JOIN employees ON departments.department_id = employees.employee_id
GROUP BY (department_name);

-- Task 3: Count Employees in Each Department (every department a koijon kore employe ase, count koro.)
SELECT department_name, count(employee_id)
FROM departments
    JOIN employees USING (department_id)
GROUP BY (department_name)

-- Task 4: Find the Department name with the Highest Average Salary
SELECT department_name, round(avg(salary))
FROM employees
    JOIN departments USING (department_id)
GROUP BY
    department_name
ORDER BY round DESC
LIMIT 1;

-- [Note: aikhane order by round. likhte hoisa. But round er jaigai salary likhar kotha silo. Because salary column ke order by kortesi. Kinto 1st line a round method dia averate salary ke round korar fole, oi column er name salary theke round hoia gese. Tai round name dia order korte hosse. So amra alias use korte pari.]

-- Task 5: Count Employees Hired Each Year
-- Way 1:
SELECT to_char(hire_date, 'yyyy'), count(to_char(hire_date, 'yyyy'))
FROM employees
GROUP BY
    to_char(hire_date, 'yyyy');

-- Way 2:
SELECT EXTRACT(
        YEAR
        FROM hire_date
    ), count(employee_id)
FROM employees
GROUP BY
    EXTRACT(
        YEAR
        FROM hire_date
    );

-- Way 3:
SELECT EXTRACT(
        YEAR
        FROM hire_date
    ) as hire_year, count(employee_id)
FROM employees
GROUP BY
    hire_year;

-------------------------- Here another 2 task with different table ---------------------

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

-- Inserting sample data into the orders table
INSERT INTO
    orders (
        customer_id,
        order_date,
        total_amount
    )
VALUES (1, '2022-01-05', 100.50),
    (2, '2022-01-07', 200.75),
    (1, '2022-01-08', 150.25),
    (3, '2022-01-10', 300.00),
    (2, '2022-01-15', 180.50),
    (3, '2022-01-20', 220.25),
    (1, '2022-01-25', 90.00),
    (2, '2022-01-28', 120.75),
    (3, '2022-02-01', 250.50),
    (1, '2022-02-05', 180.25);

-- Task 6: Find customers who have placed more than 2 orders and calculate the total amount spent by     each of these customers.
SELECT
    customer_id,
    count(customer_id) as Total_Order,
    sum(total_amount) as Total_amount
FROM orders
GROUP BY
    customer_id
HAVING
    COUNT(*) > 2;

-- [NOte: aikhane last line a having keyword use koresi. Karon where use hoi kono table er every row k call korte. Ar Having use hoi every group er all row ke call korte.]

SELECT * FROM orders

-- Task 7: Find the total amount of orders placed each month in the year 2022.
SELECT extract(
        MONTH
        FROM order_date
    ) as order_month, sum(total_amount)
FROM orders
WHERE
    extract(
        YEAR
        from order_date
    ) = 2022
GROUP BY
    order_month