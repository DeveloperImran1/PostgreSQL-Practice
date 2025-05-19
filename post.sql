-- aikhane table name double cottation er moddhe rakha hiosa, karon user hosse sql er akta reserve keyword.
CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL
)

CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL, -- text er length jodi unlimited hoi, tahole type hisabe text use korte pari.
    user_id INTEGER REFERENCES "user" (id) ON DELETE SET DEFAULT DEFAULT 2
)

INSERT INTO
    "user" (user_name)
VALUES ('Akash'),
    ('Batash'),
    ('Nodi'),
    ('sagor');

INSERT INTO
    post (title, user_id)
VALUES (
        'Getting Started with PostgreSQL',
        1
    ),
    (
        '10 Tips for Writing Clean JavaScript Code',
        2
    ),
    (
        'Why Learning SQL is Essential for Developers',
        3
    ),
    (
        'A Beginner’s Guide to React Hooks',
        4
    );

-- But amra user id na dia null value insert korte pari. Because constraint hisabe null value dewa jabena. Ai constraint add kora hoini.

-- post table er user_id collumn a not null constraint add korbe.
ALTER TABLE post alter COLUMN user_id set NOT NULL;

-- post table a new data insert korbe, jar user_id er value null.
INSERT INTO post (title, user_id) VALUES ('Hiii this is test', NULL);

SELECT * FROM "user";

SELECT * FROM post;

-- Jeheto post table a user id er refference ase. So oi id gulo sara onno kono id post table a insert or update hote parbena.

-------------------------   DELETE ----------------------------
-- Aikhane user er id post table er sathe connection hoia ase. Akhon jodi kono user k delete kora hoi. Tahole post table a oi user er id (foregen key) gulo 4 ta obostha hote pare:

DROP TABLE "user";

DROP TABLE post;

-- 1. Age oi user er all post delete korte hobe, tarpor oi user ke delete korte parbe. (Default vabe aita apply hoi)
DELETE FROM "user" WHERE id = 4;

-- 2. Jei user k delte korbe, sei user er all post delete hoia jabe. --> table jokhon create korbo, tokhon foregn key ta create korar somoi constraint hisabe add korte hobe: ON DELETE CASCADE
-- ex: user_id INTEGER REFERENCES "user" (id) ON DELETE CASCADE

-- 3. Jei user delete hobe, sei user er id te NULL set korte pari. ---> table jokhon create korbo, tokhon foregn key ta create korar somoi constraint hisabe add korte hobe: ON DELETE SET NULL
-- ex: user_id INTEGER REFERENCES "user" (id) ON DELETE SET NULL

-- 4. Foregen key te default kono value set korte pari.  ---> table jokhon create korbo, tokhon foregn key ta create korar somoi constraint hisabe add korte hobe: ON DELETE SET DEFAULT DEFAULT anotherUserId
-- ex: user_id INTEGER REFERENCES "user" (id) ON DELETE SET DEFAULT DEFAULT 2