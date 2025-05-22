-- Function syntax:
-- CREATE FUNCTION functionName()
-- RETURNS returnType or Void(if dont return)
-- LANGUAGE languageName or extentionName
-- as
-- $$
--     Full query statement.
-- $$;

-- Ex 1: sql function : return korle RETURNS type ta bole dita hobe.
CREATE FUNCTION emp_count()
RETURNS INT
LANGUAGE SQL
as 
$$
    SELECT count(*) FROM employees;
$$;

SELECT emp_count ();

--  Ex 2: sql function : return na korle RETURNS type hisabe void bole dita hobe.
CREATE FUNCTION delete_emp()
RETURNS void
LANGUAGE SQL
as 
$$
    DELETE FROM employees WHERE employee_id = 1;
$$;

SELECT delete_emp ()

-- Ex 3: SQL function with perameter
-- 1. aikhane perameter a perameter er name bole dita hobe and value type ta pase likhte hoi. Perameter er name ta meaninfull rakhar try korte hobe and same p letter ta add korte hobe. Jate bujha jai aita akta perameter.
-- 2. Call korar somoi sudho value ta pass korte hobe, type

CREATE FUNCTION delete_emp_by_id(p_emp_id INT)
RETURNS void
LANGUAGE SQL
as 
$$
    DELETE FROM employees WHERE employee_id = p_emp_id;
$$;

SELECT delete_emp_by_id (2);

-- [Note: Jodi delete_emp_by_id ai name a age theke kono function thake, tahole same name a another function create kora jabena. Tokhon take jodi replace kore new function create korte chai, tahole CREATE er por or Replace keyword ta add korte hobe.
-- Ex: CREATE or Replace FUNCTION delete_emp_by_id(p_emp_id INT) ]

-------------------------- Procedure -----------------------------
-- Function and procudure er moddhe main differece holo: function kono kiso return korte pare abar kono kiso nao return korte pare. But Procedure kiso return kortei parena. Thats mean procedure sudho vitore kaj kore, kono kiso return korena.

-- -------------------- Procedure Syntax ----------------

-- CREATE PROCEDURE procedureName()
-- LANGUAGE plpgsql
-- AS
-- $$
--     BEGIN

--     END
-- $$;
-- CALL procedureName();

-- [Note: aikhane language hisabe sql use korte pari. Abar akta extention plpgsql use korte pari, Jar fole amra aro bivinno functionality er kaj korte pari. Ai plpgsql amra jokhon PostgreSQL install diasi amader computer a. Tokhon ee install hoia gese.  Ar call korar somoi call keyword use korte hoi.]

-- Ex 1: Basic example
CREATE PROCEDURE remove_emp()
LANGUAGE plpgsql
AS
$$
    BEGIN
        DELETE FROM employees WHERE employee_id = 3;
    END
$$;

CALL remove_emp ();

-- Ex 2: with variable
CREATE PROCEDURE remove_emp_with_var()
LANGUAGE plpgsql
AS
$$ 
    DECLARE
    -- Jodi amra variable use korte chai, tahole declare keyword likha begin er upor porjonto bivinno variable declare korte pari. Tobe variable name er sathe type oo bole dita hobe. Ar variable ke use korar jonno into use korte hobe. 
    test_var INT;
    BEGIN
    SELECT employee_id INTO test_var FROM employees WHERE employee_id = 4 ;

    DELETE FROM employees WHERE employee_id = test_var;
    END
$$;

CALL remove_emp_with_var ();

-- Ex 3: with variable and function
CREATE PROCEDURE remove_emp_by_id(p_employe_id INT)
LANGUAGE plpgsql
AS
$$ 
    DECLARE
    test_var INT;
    BEGIN
    SELECT employee_id INTO test_var FROM employees WHERE employee_id = p_employe_id ;
    DELETE FROM employees WHERE employee_id = test_var;

    RAISE NOTICE'Employe deleted!';
    END
$$;

CALL remove_emp_by_id (5);