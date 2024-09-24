/* Insert into tables Line, Station, Services */
INSERT INTO 
	Lines (Name) 
VALUES
	('Bakerloo');

INSERT INTO 
	Stations (StationID, StationName, LineID) 
VALUES
	('Harrow & Wealdstone', 1),
	('Kenton', 1),
	('South Kenton', 1),
	('North Wembley', 1),
	('Wembley Central', 1),
	('Stonebridge Park', 1),
	('Harlesden', 1),
	('Willesden Junction', 1),
	('Kensal Green', 1),
	('Queens Park', 1),
	('Kilburn Park', 1),
	('Maida Vale', 1),
	('Warwick Avenue', 1),
	('Paddington', 1),
	('Edgeware Road', 1),
	('Marylebone', 1),
	('Baker Street', 1),
	('Regents Park', 1),
	('Oxford Circus', 1),
	('Piccadilly Circus', 1),
	('Charing Cross', 1),
	('Embankment', 1),
	('Waterloo', 1),
	('Lambeth North', 1),
	('Elephant and Castle', 1);

INSERT INTO 
	Services (Name) 
VALUES
	('Network Rail'),
	('Elizabeth Line');

INSERT INTO 
	StationService (StationID, ServiceID) 
VALUES
	(14, 2),
	(14, 1);