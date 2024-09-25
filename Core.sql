CREATE TABLE Line (
    LineID INT PRIMARY KEY,
    LineName VARCHAR(50)
);

CREATE TABLE Station (
    StationID INT PRIMARY KEY,
    StationName VARCHAR(50),
    LineID INT,
    IsOpen BOOLEAN,
    FOREIGN KEY (LineID) REFERENCES Line(LineID)
);

CREATE TABLE Services (
    ServiceID INT PRIMARY KEY,
    ServiceName VARCHAR(50)
);

CREATE TABLE StationServices (
    StationID INT,
    ServiceID INT,
    FOREIGN KEY (StationID) REFERENCES Station(StationID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);

INSERT INTO Line (LineID, LineName) VALUES (1, 'Bakerloo');

INSERT INTO Station (StationID, StationName, LineID, IsOpen) VALUES
(1, 'Harrow & Wealdstone', 1, TRUE),
(2, 'Kenton', 1, TRUE),
(3, 'South Kenton', 1, TRUE),
(4, 'North Wembley', 1, TRUE),
(5, 'Wembley Central', 1, TRUE),
(6, 'Stonebridge Park', 1, TRUE),
(7, 'Harlesden', 1, TRUE),
(8, 'Willesden Junction', 1, TRUE),
(9, 'Kensal Green', 1, TRUE),
(10, 'Queens Park', 1, TRUE),
(11, 'Kilburn Park', 1, TRUE),
(12, 'Maida Vale', 1, TRUE),
(13, 'Warwick Avenue', 1, TRUE),
(14, 'Paddington', 1, TRUE),
(15, 'Edgeware Road', 1, TRUE),
(16, 'Marylebone', 1, TRUE),
(17, 'Baker Street', 1, TRUE),
(18, 'Regents Park', 1, TRUE),
(19, 'Oxford Circus', 1, TRUE),
(20, 'Piccadilly Circus', 1, TRUE),
(21, 'Charing Cross', 1, TRUE),
(22, 'Embankment', 1, TRUE),
(23, 'Waterloo', 1, TRUE),
(24, 'Lambeth North', 1, TRUE),
(25, 'Elephant and Castle', 1, TRUE);

INSERT INTO Services (ServiceID, ServiceName) VALUES
(1, 'Network Rail'),
(2, 'Elizabeth Line');

INSERT INTO StationServices (StationID, ServiceID) VALUES
(1, 1), 
(14, 1), 
(14, 2); 

UPDATE Station SET IsOpen = FALSE WHERE StationName = 'Maida Vale';

SELECT StationName FROM Station WHERE IsOpen = TRUE;

SELECT StationName FROM Station WHERE StationID BETWEEN 16 AND 20 AND IsOpen = FALSE;

SELECT s.StationName FROM Station s
JOIN StationServices ss ON s.StationID = ss.StationID
JOIN Services sv ON ss.ServiceID = sv.ServiceID
WHERE sv.ServiceName = 'Network Rail' AND s.StationID BETWEEN 25 AND 1;

SELECT StationName FROM Station WHERE StationID BETWEEN 24 AND 9;

ALTER TABLE Station ADD COLUMN Zone INT;

UPDATE Station SET Zone = CASE
    WHEN StationName IN ('Harrow & Wealdstone', 'Kenton', 'South Kenton', 'North Wembley', 'Wembley Central', 'Stonebridge Park', 'Harlesden', 'Willesden Junction', 'Kensal Green') THEN 4
    WHEN StationName IN ('Queens Park', 'Kilburn Park', 'Maida Vale', 'Warwick Avenue', 'Paddington', 'Edgeware Road', 'Marylebone', 'Baker Street', 'Regents Park', 'Oxford Circus', 'Piccadilly Circus', 'Charing Cross', 'Embankment', 'Waterloo', 'Lambeth North', 'Elephant and Castle') THEN 1
    ELSE NULL
END;

CREATE OR REPLACE FUNCTION append_zone_to_name(station_name VARCHAR)
RETURNS VARCHAR AS $$
DECLARE
    zone INT;
    result VARCHAR;
BEGIN
    SELECT Zone INTO zone FROM Station WHERE StationName = station_name;
    IF zone IS NOT NULL THEN
        result := station_name || ' (Zone ' || zone || ')';
    ELSE
        result := station_name;
    END IF;
    RETURN result;
END;
$$ LANGUAGE plpgsql;

SELECT append_zone_to_name('Marylebone') AS Start, append_zone_to_name('Northfields') AS End;


CREATE TABLE JourneyTimes (
    StartStationID INT,
    EndStationID INT,
    JourneyTime INT,
    FOREIGN KEY (StartStationID) REFERENCES Station(StationID),
    FOREIGN KEY (EndStationID) REFERENCES Station(StationID)
);

INSERT INTO JourneyTimes (StartStationID, EndStationID, JourneyTime) VALUES
(16, 17, 2), 
(17, 18, 1), 
(18, 19, 2),
(19, 20, 1), 

;


CREATE OR REPLACE FUNCTION calculate_journey_time(start_station_id INT, end_station_id INT)
RETURNS INT AS $$
DECLARE
    journey_time INT;
BEGIN
    SELECT SUM(JourneyTime) INTO journey_time
    FROM JourneyTimes
    WHERE (StartStationID = start_station_id AND EndStationID <= end_station_id)
       OR (StartStationID >= start_station_id AND EndStationID = end_station_id);
    RETURN journey_time;
END;
$$ LANGUAGE plpgsql;

SELECT 
    s1.StationName AS Start, 
    s2.StationName AS End, 
    calculate_journey_time(s1.StationID, s2.StationID) AS "Journey Time"
FROM 
    Station s1, 
    Station s2
WHERE 
    s1.StationName = 'Marylebone' AND 
    s2.StationName = 'Baker Street';