ALTER TABLE linestation
    ADD COLUMN fromStart INTEGER;




-- Works with one line only
CREATE FUNCTION journeytime(station1 int, station2 int)
RETURNS VARCHAR(10)
LANGUAGE plpgsql
AS $$
DECLARE
  from1 INT;
  from2 INT;
BEGIN

  SELECT fromstart INTO from1
  FROM linestation
  WHERE station_id = station1;
  
  SELECT fromstart INTO from2
  FROM linestation
  WHERE station_id = station2;
  
  RETURN CONCAT(ABS(from1 - from2), ' minutes');
END;
$$;


SELECT s1.name AS start, s2.name AS end, journeytime(s1.id, s2.id)
FROM stations s1
INNER JOIN stations s2 ON true -- Dont know about this one, but sure it worked
WHERE s1.id = 1 AND s2.id = 23;