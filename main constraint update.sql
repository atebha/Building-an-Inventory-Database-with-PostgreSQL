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