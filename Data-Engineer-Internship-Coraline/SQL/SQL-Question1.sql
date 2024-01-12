-- 1. show highest director rating for each genres
WITH ranking_directors AS (
    SELECT 
        g.gen_id AS genre_id,
        g.gen_title AS genre_name,
        d.dir_fname AS first_name,
        d.dir_lname AS last_name,
        mbv.rev_stars,
        ROW_NUMBER() OVER (PARTITION BY g.gen_id ORDER BY mbv.rev_stars DESC) AS rn
    FROM genres AS g
    JOIN movie_base_view AS mbv ON mbv.gen_id = g.gen_id
    JOIN director AS d ON mbv.dir_id = d.dir_id
    WHERE  
        mbv.gen_id IS NOT NULL 
        AND mbv.rev_stars IS NOT NULL
)
SELECT
    rd.genre_id,
    rd.genre_name,
    rd.first_name,
    rd.last_name,
    rd.rev_stars AS rating
FROM ranking_directors AS rd
WHERE rn = 1;