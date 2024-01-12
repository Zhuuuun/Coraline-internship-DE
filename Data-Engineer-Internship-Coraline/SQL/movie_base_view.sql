-- create view to join movie table with all bridge table
CREATE VIEW movie_base_view AS (
    SELECT 
        m.mov_id,
        m.mov_time,
        mc.act_id,
        md.dir_id,
        mg.gen_id,
        r.rev_id,
        r.rev_stars 
FROM movie AS m
LEFT JOIN movie_cast AS mc ON m.mov_id = mc.mov_id
LEFT JOIN movie_direction AS md ON m.mov_id = md.mov_id
LEFT JOIN movie_genres AS mg ON m.mov_id = mg.mov_id
LEFT JOIN rating AS r ON m.mov_id = r.mov_id
);