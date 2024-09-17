CREATE TABLE lines(
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL
);

CREATE TABLE stations(
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	status BOOLEAN NOT NULL,
	zoneNr INT,
	timeToNext INT,
	timeToPrevious INT
);

CREATE TABLE stationConnections(
	id SERIAL PRIMARY KEY,
	lineId INT REFERENCES lines(id),
	stationId INT REFERENCES stations(id),
	previousStation INT,
	nextStation INT
);

CREATE TABLE services(
	id SERIAL PRIMARY KEY,
	stationId INT REFERENCES stations(id),
	service TEXT NOT NULL
);

INSERT INTO lines(name)
VALUES ('Bakerloo Line');

INSERT INTO stations(name, status, zoneNr, timeToNext, timeToPrevious)
VALUES
	('Harrow & Wealdstone', true, 5, 0, 2),
	('Kenton', true, 4, 2, 2),
	('South Kenton', true, 4, 2, 2),
	('North Wembley', true, 4, 2, 2),
	('Wembley Central', true, 4, 2, 2),
	('Stonebridge Park', true, 3, 2, 3),
	('Harlesden', true, 3, 3, 2),
	('Willesden Junction', true, 3, 2, 3),
	('Kensel Green', true, 2, 3, 3),
	('Queens Park', true, 2, 3, 3),
	('Kilburn Park', true, 2, 3, 2),
	('Maida Vale', false, 2, 2, 2),
	('Warwick Avenue', true, 2, 2, 2),
	('Paddington', true, 1, 2, 2),
	('Edgeware Road', true, 1, 2, 1),
	('Marylebone', true, 1, 1, 1),
	('Baker Street', true, 1, 1, 2),
	('Regents Park', true, 1, 2, 2),
	('Oxford Circus', true, 1, 2, 2),
	('Piccadilly Circus', true, 1, 2, 2),
	('Charing Cross', true, 1, 2, 2),
	('Embankment', true, 1, 1, 1),
	('Waterloo', true, 1, 1, 2),
	('Lambeth North', true, 1, 2, 2),
	('Elephant and Castle', true, 1, 2, 0);

-- Maybe useful when several lines are added..? Can use the id of stationConnections to quickly figure out routes
INSERT INTO stationConnections(lineId, stationId, previousStation, nextStation)
VALUES
	(1, 1, null, 2),
	(1, 2, 1, 3),
	(1, 3, 2, 2),
	(1, 4, 3, 5),
	(1, 5, 4, 6),
	(1, 6, 5, 7),
	(1, 7, 6, 8),
	(1, 8, 7, 9),
	(1, 9, 8, 10),
	(1, 10, 9, 11),
	(1, 11, 10, 12),
	(1, 12, 11, 13),
	(1, 13, 12, 14),
	(1, 14, 13, 15),
	(1, 15, 14, 16),
	(1, 16, 15, 17),
	(1, 17, 16, 18),
	(1, 18, 17, 19),
	(1, 19, 18, 20),
	(1, 20, 19, 21),
	(1, 21, 20, 22),
	(1, 22, 21, 23),
	(1, 23, 22, 24),
	(1, 24, 23, 25),
	(1, 25, 24, null);
	
INSERT INTO services(stationId, service)
VALUES
	(1, 'Network Rail'),
	(5, 'Network Rail'),
	(8, 'Network Rail'),
	(10, 'Network Rail'),
	(14, 'Network Rail'),
	(16, 'Network Rail'),
	(21, 'Network Rail'),
	(23, 'Network Rail'),
	(25, 'Network Rail'),
	(14, 'Elizabeth Line');
