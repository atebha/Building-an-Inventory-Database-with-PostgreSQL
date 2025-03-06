-- step1
select * 
from parts 
limit 10;

-- step 2
ALTER TABLE parts
ALTER COLUMN code SET not null;

ALTER TABLE parts
ADD UNIQUE(code);