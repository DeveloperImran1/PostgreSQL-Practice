-- ✅ 1. CREATE Table
-- Task:
-- Create a table named products with the following columns:
-- product_id (INT, Primary Key)
-- product_name (VARCHAR 50, cannot be null)
-- price (DECIMAL, default 0.0)

------------- Solving:
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    price DECIMAL DEFAULT 0.0
)

-- ✅ 2. ALTER - Add Column
-- Task:
-- Add a column called stock (INT, cannot be null, default 0) to the products table.

------------- Solving:
ALTER TABLE products ADD COLUMN stock INT NOT NULL DEFAULT 0;

-- ✅ 3. INSERT INTO
-- Task:
-- Insert a new row into products:
-- product_id: 1
-- product_name: 'Laptop'
-- price: 999.99
-- stock: 20

------------- Solving:
INSERT INTO
    products (
        product_id,
        product_name,
        price,
        stock
    )
VALUES (1, 'Laptop', 999.99, 20);

-- ✅ 4. ALTER - Drop Column
-- Task:
-- Remove the stock column from the products table.

------------- Solving:
ALTER TABLE products DROP COLUMN stock;

-- ✅ 5. ALTER - Rename Column
-- Task:
-- Rename the column price to product_price in the products table.

------------- Solving:
ALTER TABLE products RENAME COLUMN price to product_price;

-- ✅ 6. ALTER - Change Data Type
-- Task:
-- Change the datatype of product_name from VARCHAR(50) to VARCHAR(100).

------------- Solving:
ALTER TABLE products ALTER COLUMN product_name type VARCHAR(100);

-- ✅ 7. ALTER - Add NOT NULL
-- Task:
-- Make sure that the product_price column cannot have null values.

------------- Solving:
ALTER TABLE products ALTER COLUMN product_price set NOT NULL;

-- ✅ 8. ALTER - Remove NOT NULL
-- Task:
-- Remove the NOT NULL constraint from the product_price column.

------------- Solving:
ALTER TABLE products ALTER COLUMN product_price DROP NOT NULL;

-- ✅ 9. ALTER - Add UNIQUE & PRIMARY KEY
-- Task:
-- Add a unique constraint to product_name and set product_id as the primary key (if not already).

------------- Solving:
ALTER TABLE products
ADD constraint unique_products_product_name UNIQUE (product_name);

ALTER TABLE products
ADD constraint pk_products_product_id PRIMARY KEY (product_id);

-- ✅ 10. ALTER - Drop Constraint
-- Task:
-- Drop the unique constraint from the product_name column.

------------- Solving:
ALTER TABLE products DROP constraint unique_products_product_name;

-- ✅ 11. DROP TABLE
-- Task:
-- Drop the products table completely.

------------- Solving:
DROP TABLE products;

-- ✅ 12. TRUNCATE TABLE
-- Task:
-- Create a table orders with some rows. Then write a command to remove all data from the orders table using TRUNCATE, keeping its structure intact.

------------- Solving:
TRUNCATE TABLE products;