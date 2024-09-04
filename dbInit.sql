CREATE TABLE lines(
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL
);

CREATE TABLE stations(
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	status BOOLEAN NOT NULL
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

INSERT INTO stations(name, status)
VALUES
	('Harrow & Wealdstone', true),
	('Kenton', true),
	('South Kenton', true),
	('North Wembley', true),
	('Wembley Central', true),
	('Stonebridge Park', true),
	('Harlesden', true),
	('Willesden Junction', true),
	('Kensel Green', true),
	('Queens Park', true),
	('Kilburn Park', true),
	('Maida Vale', false),
	('Warwick Avenue', true),
	('Paddington', true),
	('Edgeware Road', true),
	('Marylebone', true),
	('Baker Street', true),
	('Regents Park', true),
	('Oxford Circus', true),
	('Piccadilly Circus', true),
	('Charing Cross', true),
	('Embankment', true),
	('Waterloo', true),
	('Lambeth North', true),
	('Elephant and Castle', true);
	
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
