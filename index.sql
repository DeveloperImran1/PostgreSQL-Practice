-- Kono akta data get hote, kemon time lagtese. Ta dekhar jonno Explain Analyse use kora hoi.
EXPLAIN ANALYSE SELECT * FROM employees WHERE sallary > 40000;

-- employees table er sallary column a index create kora hoisa. Jei index er name holo idx_tableName_columnName
CREATE INDEX idx_employees_sallary ON employees (sallary);

-- Computer er kono directory te amar data gulo store hosse, ta dekhar jonno ai command use hoi.
SHOW data_directory;
--Output: C:/Program Files/PostgreSQL/17/data

-- **Indexing 4 type er hoi:**
-- 1. B-TREE (Default)
-- 2. HASH
-- 3. GIN
-- 4. GIST
CREATE INDEX idx_employees_sallary ON employees USING HASH (sallary);