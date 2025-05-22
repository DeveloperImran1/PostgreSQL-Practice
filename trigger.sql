--------------------- Trigger Syntax ---------------------

-- CREATE TRIGGER triggerName
-- {BEFORE | AFTER | INSTEAD OF} {INSERT | UPDATE | DELETE | TRUNCATE}
-- ON tableName
-- for each row
-- EXECUTE FUNCTION functionName();

--  Ex 1: Basic example
CREATE TRIGGER TR 
BEFORE DELETE
for each row  
EXECUTE FUNCTION functionName();

-- Ex 2: my_user table er kono akta user create hower age, akta

CREATE TABLE my_user (
    "user_name" VARCHAR(50),
    email VARCHAR(50)
);

INSERT INTO
    my_user (user_name, email)
VALUES ('Imran', 'imran@gmail.com'),
    (
        'Mezba vai',
        'mezba@gmail.com,'
    );

CREATE TABLE deleted_users_audit (
    deleted_user_name VARCHAR(50),
    deletedAt TIMESTAMP
);

-- Trigger function:- Jei function trigger a call hobe, sei function er return type hisabe TRIGGER bosbe.
CREATE FUNCTION save_deleted_user()
RETURNS TRIGGER
LANGUAGE plpgsql 
AS
$$
    BEGIN
        -- Kono user delete korar age, oi user name ke deleted_user_audit table a add korbo
        INSERT INTO deleted_users_audit VALUES(OLD.user_name, now()); -- aikhe OLD namer perameter a oi user er info pabo. Karon user ta delete hole old hoia jabe. Tai OLD perameter a passi. 
        RETURN OLD;   -- OLD perameter ke return kore dewa convention. 
    END
$$;

CREATE TRIGGER save_deleted_user_trigger
BEFORE DELETE 
ON my_user 
FOR EACH ROW
EXECUTE FUNCTION save_deleted_user();

DELETE FROM my_user WHERE user_name = 'Imran';

-------------------------------- Summary of Trigger ------------------------------
-- Target: my_user table er kono akta user k delete korar age, oi user er data gulo deleted_users_audit namer table er moddhe store kore, then delete korbe.

-- Step 1: 1st a my_user table create and data insert koresi.

-- Step 2: Then my_user table theke akta user k delete korbo. Tar age save_deleted_user_trigger namer akta trigger create korbo. Jeita Before Delete typer hobe. Mane delete hower age exicute hobe.

-- Step 3: Oi trigger er maddhome save_deleted_user namer function k call kore dibo. save_deleted_user er moddhe OLD name a akta perameter a jei user delete hobe, sei user er info get korbe. Then oi user er data nia save_deleted_user function ta deleted_users_audit table a insert korbe, jei user delete hobe.

-- Step 4: Last a finaly delete korar statement exicute hobe.