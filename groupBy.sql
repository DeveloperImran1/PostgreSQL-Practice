SELECT * FROM student;

-- Group by er maddhome, Kono akta column er uniqe jei value gulo ase, tader ke nia group create korbe. aikhane country ke group by koresi. Jar fole uniqe country gulo group hobe, and oi same country er under a jei row gulo ase. Tader ke groupd korbe. Ar amra aikhane sudho sei country gulo ke output a nisi and every country er under a koita kore data ace. Seita set koresi.
SELECT country, count(*) FROM student GROUP BY country;

-- grou by er maddhome uniqe country gulor group korese. Then avg method sei group gulote average ber kore every column er jonno output diase.
SELECT country, count(*), avg(age) FROM student GROUP BY country;

-- Kono akta group a aggregate korar jonno having method use hoi. Karon where use korte parbona oikha. Where use hoi every row te. Ar seikhae every group a filtering kortesi.
SELECT country, avg(age)
FROM student
GROUP BY
    country
HAVING
    avg(age) > 20;

-- Count students born in each year --> Every year a koijon kore student born korese. Seita count koro.
SELECT extract(
        year
        FROM dob
    ) as birth_year, count(*)
FROM student
GROUP BY
    birth_year;

-- AIkhane extract(year FROM dob) as birth_year --> ai part dia dob column er sudho year gulo ke extract kora hoiase. and column name k alias kore birth_year kora hoisa.

--  GROUP BY birth_year; ---> ai part a group by kora hoisa dob column ke. But dob na likha birth_year likha hoisa. Karon dob ke alias kora hosa. [NOTE: group by er pore sudho sei column kei group kora jabe, jei column gulo amra select keyword er por dia get korbo.]

-- count(*) ---> Ar jei data gulo get hoisa, tader count koresi count(*) method dia. Jeita every group k count kore result return korese. full table ke noi.