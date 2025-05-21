CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL
)

CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES "user" (id)
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

SELECT * FROM "user";

SELECT * FROM post;

-- Ai code er output a  aro akta table create kore, jei table er primary name post. Sei table a post tabe and user table. 2 ta table er all column er data add kore.
-- Aikhane JOIN "user" on post.user_id = "user".id --> ai part er mane holo: user table ke post table er sathe join korbe. but post.user_id er value er sathe user table er id er sathe match kore kore value gulo bosabe.
SELECT * FROM post JOIN "user" on post.user_id = "user".id

-- join kora new table, jar primary name post. Sei table theke title and user_name k get korbe.
SELECT title, user_name
FROM post
    JOIN "user" on post.user_id = "user".id

-- 2 ta column jokhon join er maddhome combind akta table create hoi. Tokhon 2 ta column thake id name a. So aikhane bole dita hobe user.id or post.id Otherwise bujhte partesena, kon table er id get korbo.
SELECT "user".id FROM post JOIN "user" on post.user_id = "user".id

-- [Note: Jeheto aikhane post table a jei jei user er id ase, sudho sei user er info nia new  join er akta table create kortese. so user table er sokol user er info nao thakte pare. Ai join ke inner join bole]

-- Aikhane user namer akta primary table create hobe. Jar 1st column user er id, 2nd column user_name, 3rd column post er id, 4th column post title and last column user_id. Tar mane holo user table er data gulo age thakbe, tarpor post table er data gulo add hobe.
SELECT * FROM "user" JOIN post on "user".id = post.id;

-- --------------- LEFT JOIN -------------------- --
SELECT * FROM post LEFT JOIN "user" on post.user_id = "user".id;

-- --------------- Right JOIN -------------------- --
SELECT * FROM post RIGHT JOIN "user" on post.user_id = "user".id;

-- --------------- Full JOIN -------------------- --
SELECT * FROM post FULL JOIN "user" on post.user_id = "user".id;