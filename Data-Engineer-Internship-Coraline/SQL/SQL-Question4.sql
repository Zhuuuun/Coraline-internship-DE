-- 4. change datatype of column gen_title from char to int 
-- create new column with datatype int 
ALTER TABLE genres 
ADD COLUMN new_gen_title INT;

-- update value for new column based on column gen_id
UPDATE 
    genres AS g
JOIN (
        SELECT 
            gen_id, 
            ROW_NUMBER() OVER (ORDER BY gen_id) AS rn
        FROM genres
    ) AS nt 
ON g.gen_id = nt.gen_id
SET g.new_gen_title = nt.rn;

-- drop old gen_title column
ALTER TABLE genres 
DROP COLUMN gen_title;

-- rename to gen_title 
ALTER TABLE genres 
RENAME COLUMN new_gen_title TO gen_title;