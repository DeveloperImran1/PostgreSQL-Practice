CREATE TABLE employes (
    employe_id INT,
    employe_name VARCHAR(50),
    dept_id INT
)

CREATE TABLE depeartment (
    dept_id INT,
    dept_name VARCHAR(50)
)

-- Insert sample data
INSERT INTO employes VALUES (1, 'john doe', 101);

INSERT INTO employes VALUES (2, 'Jane Smith', 102);

INSERT INTO depeartment VALUES (101, 'Human resource');

INSERT INTO depeartment VALUES (102, 'Marketing');

SELECT * FROM employes;

SELECT * FROM depeartment;

-- CROS join
SELECT * FROM employes CROSS JOIN depeartment;

-- NATURAL join
SELECT * FROM employes NATURAL JOIN depeartment;