INSERT INTO lines (name) VALUES('piccadilly');


INSERT INTO stations (name, zone_id)
VALUES
	('Heathrow Terminal',2),
    ('Northfields', 2),
    ('South Ealing',2),
    ('Gøoucester Road', 2),
    ('South Kensington',1),
    ('Knightsbridge',1),
    ('Hyde Park Corner',1),
    ('Green Park',1),
    ('Covent Garden',1),
    ('Holborn',1),
    ('Russel Square',1);
    
    


INSERT INTO linestation (line_id, station_id, fromstart)
VALUES
	(2,26,0),
    (2,27,19),
    (2,28,19),
    (2,29,37),
    (2,30,38),
    (2,31,40),
    (2,32,42),
    (2,33,44),
    (2,20,45), -- Piccadilly circus
    (2,34,48),
    (2,35,49),
    (2,36,52);
    
-- Find the connecting station that shares the lines, this is where we hop off
CREATE OR REPLACE FUNCTION connectingstation(station1 int, station2 int)
returns INT
LANGUAGE plpgsql
AS $$
DECLARE
  result INT;
  toline INT;
BEGIN
	SELECT ls.line_id INTO toline
  FROM linestation ls
  WHERE ls.station_id = station2;

  SELECT ls1.station_id INTO result
  FROM linestation ls1
  INNER JOIN linestation ls2 ON true
  WHERE ls1.station_id = ls2.station_id
  AND ls1.line_id = toline;

  RETURN result;
END;
$$;

--Determines if the stations are on the same line or not
CREATE OR REPLACE FUNCTION sameline(station1 int, station2 int)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
DECLARE
  sameline BOOLEAN;
BEGIN

SELECT COUNT(*) > 0 INTO sameline
  FROM linestation ls1
  INNER JOIN linestation ls2 ON ls1.line_id = ls2.line_id
  WHERE ls1.station_id = station1
  AND ls2.station_id = station2;

  RETURN sameline;
END;
$$;

-- Calculates total journey time, checks first if we need to change line 

CREATE OR REPLACE FUNCTION journeytime(station1 INT, station2 INT)
RETURNS VARCHAR(20)
LANGUAGE plpgsql
AS $$
DECLARE
  connecting_station INT;
  total_time INT;
BEGIN
  IF sameline(station1, station2) THEN
    total_time := journeytimesame(station1, station2);
  ELSE
    connecting_station := connectingstation(station1, station2);
    total_time := journeytimesame(station1, connecting_station) +
                  journeytimesame(connecting_station, station2);
  END IF;
  RETURN CONCAT(total_time, ' minutes');
END;
$$;



-- Calculates the time between two stations in the same line
CREATE OR REPLACE FUNCTION journeytimesame(station1 int, station2 int)
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE
  from1 INT;
  from2 INT;
BEGIN

SELECT ls1.fromstart, ls2.fromstart INTO from1, from2
FROM linestation ls1
INNER JOIN linestation ls2 ON ls1.line_id = ls2.line_id
WHERE ls1.station_id = station1
  AND ls2.station_id = station2;

  RETURN ABS(from1 - from2);
END;
$$;


-- Checks time between marylebone (16) and northfields (27)
SELECT s1.name AS start, s2.name AS end, journeytime(s1.id, s2.id)
FROM stations s1
INNER JOIN stations s2 ON true
WHERE s1.id = 16 AND s2.id = 27