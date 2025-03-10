-- Query the data from the parts table
-- step1
SELECT * 
FROM parts 
LIMIT 10;

-- Set a unique value, no nulls, primary key, foreign key for parts and inserts/updates into parts
-- step 2
ALTER TABLE parts
ALTER COLUMN code SET NOT NULL,
ALTER COLUMN description SET NOT NULL,
ADD UNIQUE(code),
ADD PRIMARY KEY (id),
ADD FOREIGN KEY (manufacturer_id) REFERENCES manufacturers (id);

-- step 3
UPDATE parts
SET description = 'none available'
WHERE description IS NULL;

-- step 4 
UPDATE parts
SET manufacturer_id = 11
WHERE manufacturer_id IN (1, 2);

-- step 5
INSERT INTO parts (id, description, code, manufacturer_id) 
VALUES (54, '', 'V1-009', 9);

-- Set not nulls, add in checks and a foriegn key to the reorder_options table
-- step 6
ALTER TABLE reorder_options
ALTER COLUMN price_usd SET NOT NULL,
ALTER COLUMN quantity SET NOT NULL,
ADD CHECK (price_usd > 0 AND quantity > 0),
ADD CHECK (price_usd/quantity > 0.02 AND price_usd/quantity < 25.00),
ADD FOREIGN KEY (part_id) REFERENCES parts (id);

-- Add in a check for qty, unique value and foriegn key to the locations table
-- step 7 
ALTER TABLE locations 
ADD CHECK (qty > 0),
ADD UNIQUE (part_id, location),
ADD FOREIGN KEY (part_id) REFERENCES parts (id);

-- Insert into manufacturers table
-- step 8
INSERT INTO manufacturers(name, id) 
VALUES ('Pip-NNC Industrial', 11);