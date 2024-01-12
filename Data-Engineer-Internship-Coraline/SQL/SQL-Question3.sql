-- 3. show top 5 actor for each director ( rank is based on total cooperative time )
WITH actor_director_counts AS (
    SELECT 
        mbv.dir_id,
        mbv.act_id,
        COUNT(*) AS collaboration_time,
	ROW_NUMBER() OVER (PARTITION BY mbv.dir_id ORDER BY COUNT(*) DESC) AS rn
    FROM movie_base_view AS mbv
    GROUP BY mbv.dir_id, mbv.act_id
)

SELECT 
    d.dir_id AS director_id,
    d.dir_fname AS director_firstname,
    d.dir_lname AS director_lastname,
    a.act_fname AS actress_firstname,
    a.act_lname AS actress_lastname,
    adc.collaboration_time,
    adc.rn AS ranking
FROM actor_director_counts AS adc
JOIN actor AS a ON adc.act_id = a.act_id
JOIN director AS d ON adc.dir_id = d.dir_id
WHERE 
    a.act_gender = 'F' AND
    adc.rn <= 5 
ORDER BY adc.dir_id;
