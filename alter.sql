-- Active: 1747455384140@@localhost@5432@ph

------------------ SQL Commands er DDL ( CREATE, DROP, ALTER, TRUNCATE) korar system

-- user2 table er data gulo show hobe.
SELECT * FROM user2;

-- user2 table er moddhe email column add hobe. Jar default value hobe default@gmail.com and null hote parbena.
ALTER TABLE user2
ADD COLUMN email VARCHAR(25) NOT NULL DEFAULT 'default@gmail.com';

-- user2 table er moddhe new akta row insert hobe.
INSERT INTO user2 VALUES ( 8, 'Sabbir', 18, 'sabbir@gmail.com' );

-- user2 er email column k delete korbo.
ALTER TABLE user2 DROP COLUMN email;

-- user2 er age column age change hoia user_age hobe.
ALTER TABLE user2 RENAME COLUMN age to user_age;

-- user_name column er varchar er peramter er value 50 kore dibo.
ALTER TABLE user2 ALTER COLUMN user_name TYPE VARCHAR(50);

-- user2 table er user_age column a not null akta constraint set hobe.
ALTER TABLE user2 ALTER COLUMN user_age set NOT NULL;

-- user2 table er user_age column a not null constraint k remove korbe.
ALTER TABLE user2 ALTER COLUMN user_age DROP NOT NULL;

-- Alter er maddhome amra UNIQUE , primary key, foreign key, check constraint gulo vinno vabe use korte hobe.
ALTER TABLE user2
ADD constraint unique_user2_user_name UNIQUE (user_name);
-- ai command er maddhome user2 table a user_name column a unique constraint add kortesi. Aikhane unique_user2_user_name --> aitar dara bujhai: ki constraint add korbo, tableName, kon column a add korbo. Ai name gulo underscore dia add korte hobe. Tobe vul hose somossa nai. Aita bujhar jonno aivabe likhte hoi.

ALTER TABLE user2
ADD constraint pk_user2_user_age PRIMARY KEY (user_id);
-- Amra chaila aikhanew primary key add korte pari.

ALTER TABLE user2 DROP constraint unique_user2_user_name;
-- kono constraint k drop korte pari, aikhane unique_user2_user_name holo constraint create kora somoi jei name diasi, oi name. Ar manualy jodi ai constraint add na kori, tahole  edit table theke Index Name a automatic generate hioa thake, index name gulo.

-- ---------------TRUNCATE -------------------
-- user4 table ta drop hoia jabe, ba fully delete hoia jabe.
DROP TABLE user4;

-- user4 table er all content delete hobe. But table er structure, columns and constraint gulo same thakbe, delete hobena. Aitai holo DROP and TRUNCATE er moddhe difference.
TRUNCATE TABLE user2;