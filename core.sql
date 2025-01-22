CREATE TABLE lines(
    id SERIAL PRIMARY KEY,
    name VARCHAR(40)
);

CREATE TABLE stations(
    id SERIAL PRIMARY KEY,
    name VARCHAR(40),
    open BOOLEAN DEFAULT true
);

CREATE TABLE services(
    id SERIAL PRIMARY KEY,
    name VARCHAR(40)
);



CREATE TABLE linestation(
    id SERIAL PRIMARY KEY,
    line_id INT NOT NULL REFERENCES lines,
    station_id INT NOT NULL REFERENCES stations
);

CREATE TABLE stationservice(
    id SERIAL PRIMARY KEY,
    station_id INT NOT NULL REFERENCES stations,
    service_id INT NOT NULL REFERENCES services
);



-- Populating stations

INSERT INTO stations (name)
VALUES
    ('Harrow & Wealdstone'),
    ('Kenton'),
    ('South Kenton'),
    ('North Wembely'),
    ('Wembely Central'),
    ('Stonebridge Park'),
    ('Harlesden'),
    ('Willesen Junction'),
    ('Kensel Green'),
    ('Queens Park'),
    ('Kilburn Park'),
    ('Maida Vale'),
    ('Warwick Avenue'),
    ('Paddington'),
    ('Edgeware Road'),
    ('Marylebone'),
    ('Baker Street'),
    ('Regents Park'),
    ('Oxford Circus'),
    ('Piccadilly Circus'),
    ('Charing Cross'),
    ('Embankment'),
    ('Waterloo'),
    ('Lambeth North'),
    ('Elephant and Castle');

INSERT INTO lines (name) VALUES ('Bakerloo');

INSERT INTO services(name) VALUES('Network Rail');

-- Connect the stations to the bakerloo line
INSERT INTO linestation(line_id, station_id)
VALUES
    (1,1),
    (1,2),
    (1,3),
    (1,4),
    (1,5),
    (1,6),
    (1,7),
    (1,8),
    (1,9),
    (1,10),
    (1,11),
    (1,12),
    (1,13),
    (1,14),
    (1,15),
    (1,16),
    (1,17),
    (1,18),
    (1,19),
    (1,20),
    (1,21),
    (1,22),
    (1,23),
    (1,24),
    (1,25);

-- Add network rail to the correct stations
INSERT INTO stationservice(service_id, station_id)
VALUES
    (1,1),
    (1,5),
    (1,8),
    (1,10),
    (1,14),
    (1,16),
    (1,21),
    (1,23),
    (1,25);

UPDATE stations s
SET open = FALSE
WHERE s.name = 'Maida Vale'

SELECT * FROM stations
WHERE open = TRUE


SELECT s.*
FROM stations s
INNER JOIN linestation ls ON ls.station_id = s.id
WHERE ls.line_id = 1 
AND ls.id >= 16 
AND ls.id <= 20 
AND s.open = FALSE


SELECT s.*, se.name AS service
FROM stations s
INNER JOIN linestation ls ON ls.station_id = s.id
INNER JOIN stationservice ss ON ss.station_id = s.id
INNER JOIN services se ON ss.service_id = se.id
WHERE ls.line_id = 1 
AND ls.id >= 1 
AND ls.id <= 25
AND se.name = 'Network Rail'


SELECT s.*
FROM stations s
INNER JOIN linestation ls ON ls.station_id = s.id
WHERE ls.line_id = 1 
AND ls.id >= 9 
AND ls.id <= 24 