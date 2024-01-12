-- 2. show total time of casting for each actor ( exclude non-rating movie )
SELECT 
    a.act_id AS actor_id,
    a.act_fname AS first_name,
    a.act_lname AS last_name,
    SUM(mbv.mov_time) AS "duration(min)"
FROM actor AS a
LEFT JOIN movie_base_view AS mbv ON a.act_id = mbv.act_id
WHERE mbv.rev_stars IS NOT NULL
GROUP BY a.act_id, a.act_fname, a.act_lname
ORDER BY a.act_id;
