-- -------------View syntax: --- -----------
-- CREATE VIEW viewName AS query;

-- -------------View er uses --- -----------
-- SELECT * FROM viewName;

CREATE VIEW dept_avg_sallary AS
SELECT department_name, avg(sallary)
FROM employees
GROUP BY
    department_name;

SELECT * FROM dept_avg_sallary;