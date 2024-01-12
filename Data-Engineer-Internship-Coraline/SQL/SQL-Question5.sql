-- 5. update gender of actor that start with 'em' or 'char', end with 'dy','sy','lia' to female 
UPDATE actor
SET act_gender = 'F'
WHERE 
    REGEXP_LIKE(act_fname, '^(em|char)|dy$|sy$|lia$', 'i')
    AND act_gender <> 'F';