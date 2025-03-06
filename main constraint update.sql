-- step1
select * 
from parts 
limit 10;

-- step 2
ALTER TABLE parts
ALTER COLUMN code SET not null;

ALTER TABLE parts
ADD UNIQUE(code);

-- step 3
update parts
set description = 'none available'
where description is null;

-- step 4 
alter table parts 
alter column description set not null;

-- step 5
INSERT INTO parts (id, description, code, manufacturer_id) 
VALUES (54, 'Full-color LED SMD modules', 'V1-009', 9);

-- step 6
ALTER TABLE reorder_options
ALTER COLUMN price_usd SET NOT NULL,
ALTER COLUMN quantity SET NOT NULL;

-- step 7
ALTER TABLE reorder_options
ADD CHECK (price_usd > 0 AND quantity > 0);

-- step 8
ALTER TABLE reorder_options
ADD CHECK (price_usd/quantity > 0.02 AND price_usd/quantity < 25.00);

-- step 9
ALTER TABLE parts
ADD PRIMARY KEY (id);

ALTER TABLE reorder_options
ADD FOREIGN KEY (part_id) REFERENCES parts (id);

-- step 10 
ALTER TABLE locations 
ADD CHECK (qty > 0); 

-- step 11
ALTER TABLE locations
ADD UNIQUE (part_id, location);

-- step 12
ALTER TABLE locations
ADD FOREIGN KEY (part_id) REFERENCES parts (id);

-- step 13
ALTER TABLE parts
ADD FOREIGN KEY (manufacturer_id) REFERENCES manufacturers (id);

-- step 14
INSERT INTO manufacturers(name, id) 
VALUES ('Pip-NNC Industrial', 11);

-- step 15
UPDATE parts
SET manufacturer_id = 11
WHERE manufacturer_id IN (1, 2);