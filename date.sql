SHOW timezone;
-- Output: Asia/Dhaka

SELECT now();
-- Output: 2025-05-19 17:55:21.609159+06

SELECT now()::time;
--Output: 17:55:21.609159

SELECT now()::date;
--Output: 2025-05-19

SELECT to_char(now(), 'dd-mm-yyyy') --Output: 19-05-2025   --> aikhane jeirokom format dibo, sei format a output diba.

SELECT to_char(now(), 'MONTH');
--Output: MAY  --> sudho month na, year, time, minute bivinno kiso newa jai.
SELECT to_char(now(), 'Month');
--Output: May

SELECT CURRENT_DATE - INTERVAL '1 month';
--Output: 2025-04-19 00:00:00  --> 1 month previous er date show korbe. Aikhane amra year, day, minute etc dita pri. Ex: 1 year

SELECT age ( CURRENT_DATE, '2020-04-18 23:59:00' );
--Output: {"years":5,"months":1,"minutes":1}  --> Second perameter a jei date dibo, current time theke sei time er distance ta output diba.

SELECT age (CURRENT_DATE, dob), * FROM student;

SELECT extract( day FROM '2003-02-03'::date );
-- Ai time theke sudho day ke extract kore nia asbe.
SELECT extract( month FROM '2003-02-03'::date );

-- Type casting
SELECT '1'::BOOLEAN;
--Output: true --> aikhane 1 er alternative y, yes dilao true return korbe.
SELECT '0'::BOOLEAN;
--Output: false --> aikhane 0 er alternative n, no, No,  dilao false return korbe.
SELECT 'imran'::BOOLEAN;
--Output: error --> aikhane select er por string ke jodi boolean a convert korte na pare, tahole sita error diba.

CREATE TABLE timeZ (
    ts TIMESTAMP without TIME zone,
    tsz TIMESTAMP with TIME zone
);

INSERT INTO
    timez
VALUES (
        '2002-10-10 10:45:00',
        '2002-10-10 10:45:00'
    );

SELECT * FROM timez;
--Output a 1st column ts er value hobe Year and time. Ar 2nd column tsz er value hobe year, time and time zone. Because 2nd column a type hisabe timestamp with time zone dewa hoiase.