DROP TABLE IF EXISTS services;
DROP TABLE IF EXISTS stations;
DROP TABLE IF EXISTS lines;

CREATE TABLE IF NOT EXISTS lines (
  id SERIAL PRIMARY KEY,
  name TEXT,
  start_time TIME
);

CREATE TABLE IF NOT EXISTS stations (
  id SERIAL PRIMARY KEY,
  name TEXT,
  line_id INTEGER REFERENCES lines(id),
  number INTEGER,
  open BOOLEAN,
  zone TEXT,
  delta_time INTEGER
);

-- this is really more of a service-station relationship. should maybe have separate tables
CREATE TABLE IF NOT EXISTS services (
  id SERIAL PRIMARY KEY,
  name TEXT,
  station_id INTEGER REFERENCES stations(id)
);

INSERT INTO lines
	(name, start_time)
VALUES
	('Bakerloo', '07:16');

INSERT INTO stations
	(name, line_id, number, open, zone, delta_time)
VALUES
  ('Harrow & Wealdstone', 1, 25, true, 'Zone 5', 2),
  ('Kenton', 1, 24, true, 'Zone 4', 2),
  ('South Kenton', 1, 23, true, 'Zone 4', 2),
  ('North Wembley', 1, 22, true, 'Zone 4', 2),
  ('Wembley Central', 1, 21, true, 'Zone 4', 2),
  ('Stonebridge Park', 1, 20, true, 'Zone 3', 3),
  ('Harlesden', 1, 19, true, 'Zone 3', 2),
  ('Willesden Junction', 1, 18, true, 'Zone 3', 3),
  ('Kensal Green', 1, 17, true, 'Zone 2', 3),
  ('Queens Park', 1, 16, true, 'Zone 2', 3),
  ('Kilburn Park', 1, 15, true, 'Zone 2', 2),
  ('Maida Vale', 1, 14, true, 'Zone 2', 2),
  ('Warwick Avenue', 1, 13, true, 'Zone 2', 2),
  ('Paddington', 1, 12, true, 'Zone 1', 2),
  ('Edgeware Road', 1, 11, true, 'Zone 1', 1),
  ('Marylebone', 1, 10, true, 'Zone 1', 1),
  ('Baker Street', 1, 9, true, 'Zone 1', 2),
  ('Regents Park', 1, 8, true, 'Zone 1', 2),
  ('Oxford Circus', 1, 7, true, 'Zone 1', 2),
  ('Piccadilly Circus', 1, 6, true, 'Zone 1', 2),
  ('Charing Cross', 1, 5, true, 'Zone 1', 1),
  ('Embankment', 1, 4, true, 'Zone 1', 1),
  ('Waterloo', 1, 3, true, 'Zone 1', 2),
  ('Lambeth North', 1, 2, true, 'Zone 1', 2),
  ('Elephant & Castle', 1, 1, true, 'Zone 1', 0)
;

INSERT INTO services
	(name, station_id)
VALUES
	('Network Rail', 1),
  ('Network Rail', 5),
  ('Network Rail', 8),
  ('Network Rail', 10),
  ('Network Rail', 14),
  ('Network Rail', 16),
  ('Network Rail', 22),
  ('Network Rail', 23),
  ('Network Rail', 25)
;

UPDATE stations
SET open = false
WHERE name = 'Maida Vale';

SELECT * FROM stations
WHERE open = true;

-- SELECT number FROM stations WHERE name = 'Marylebone';

-- SELECT GREATEST((SELECT number FROM stations WHERE name = 'Marylebone'), (SELECT number FROM stations WHERE name = 'Piccadilly Circus')) > 1 AND true;

SELECT * FROM stations
WHERE
	open = false
	AND number <= (SELECT GREATEST((SELECT number FROM stations WHERE name = 'Marylebone'), (SELECT number FROM stations WHERE name = 'Piccadilly Circus')))
  AND number >= (SELECT LEAST((SELECT number FROM stations WHERE name = 'Marylebone'), (SELECT number FROM stations WHERE name = 'Piccadilly Circus')))
;

SELECT * FROM stations
INNER JOIN services ON stations.id = station_id
WHERE
	number <= (SELECT GREATEST((SELECT number FROM stations WHERE name = 'Elephant & Castle'), (SELECT number FROM stations WHERE name = 'Harrow & Wealdstone')))
  AND number >= (SELECT LEAST((SELECT number FROM stations WHERE name = 'Elephant & Castle'), (SELECT number FROM stations WHERE name = 'Harrow & Wealdstone')))
;

SELECT * FROM stations
WHERE
	number <= (SELECT GREATEST((SELECT number FROM stations WHERE name = 'Lambeth North'), (SELECT number FROM stations WHERE name = 'Kensal Green')))
  AND number >= (SELECT LEAST((SELECT number FROM stations WHERE name = 'Lambeth North'), (SELECT number FROM stations WHERE name = 'Kensal Green')))
;

SELECT 3;




CREATE OR REPLACE FUNCTION  -- line_id, station_id
  get_zone_name(INTEGER, INTEGER) RETURNS TEXT LANGUAGE plpgsql AS
  	$$
    DECLARE
    	name_zone TEXT;
    BEGIN
      SELECT (SELECT name FROM stations WHERE stations.id = $2)
      || ' (' || (SELECT zone FROM stations WHERE stations.id = $2) || ')' INTO name_zone;
      RETURN name_zone;
    END;
    $$
;


SELECT * FROM get_zone_name(1, 2);

SELECT get_zone_name(1, id) FROM stations
WHERE
	number <= (SELECT GREATEST((SELECT number FROM stations WHERE name = 'Lambeth North'), (SELECT number FROM stations WHERE name = 'Kensal Green')))
  AND number >= (SELECT LEAST((SELECT number FROM stations WHERE name = 'Lambeth North'), (SELECT number FROM stations WHERE name = 'Kensal Green')))
;


-- NOTE: time_between(A, B) != time_between(B, A) (assumes going to the final stop and back around)
CREATE OR REPLACE FUNCTION time_between(INTEGER, INTEGER) RETURNS INTERVAL LANGUAGE plpgsql AS
	$$
  DECLARE
  	total_time INTEGER;
    fstparam_nr INTEGER;
    sndparam_nr INTEGER;
  BEGIN
		SELECT number FROM stations WHERE id = $1 INTO fstparam_nr;
    SELECT number FROM stations WHERE id = $2 INTO sndparam_nr;
  	IF fstparam_nr > sndparam_nr THEN
    	SELECT 2 * (SELECT SUM(stations.delta_time) FROM stations WHERE stations.number > fstparam_nr) +
      	(SELECT SUM(stations.delta_time) FROM stations WHERE stations.number <= fstparam_nr AND stations.number > sndparam_nr)
    	INTO total_time;
    ELSE
    	SELECT SUM(stations.delta_time) FROM stations WHERE (stations.number > fstparam_nr AND stations.number <= sndparam_nr)
      INTO total_time;
    END IF;
    RETURN total_time;
  END;
	$$
;


SELECT time_between(16, 17);