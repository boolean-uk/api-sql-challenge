-- Create Line table
CREATE TABLE Line (
    line_id INT PRIMARY KEY,
    line_name VARCHAR(50) NOT NULL
);

-- Create Station table
CREATE TABLE Station (
    station_id INT PRIMARY KEY,
    station_name VARCHAR(100) NOT NULL,
    is_closed BOOLEAN NOT NULL DEFAULT FALSE
);

-- Create Line_Station table
CREATE TABLE Line_Station (
    line_id INT NOT NULL,
    station_id INT NOT NULL,
    station_order INT NOT NULL,
    PRIMARY KEY (line_id, station_id),
    FOREIGN KEY (line_id) REFERENCES Line(line_id),
    FOREIGN KEY (station_id) REFERENCES Station(station_id)
);

-- Create Services table
CREATE TABLE Services (
    service_id INT PRIMARY KEY,
    service_name VARCHAR(100) NOT NULL
);

-- Create Station_Service table
CREATE TABLE Station_Service (
    station_id INT NOT NULL,
    service_id INT NOT NULL,
    PRIMARY KEY (station_id, service_id),
    FOREIGN KEY (station_id) REFERENCES Station(station_id),
    FOREIGN KEY (service_id) REFERENCES Services(service_id)
);

-- Insert into Line
INSERT INTO Line (line_id, line_name) VALUES
(1, 'Bakerloo Line'),
(2, 'Elizabeth Line');

-- Insert into Station
INSERT INTO Station (station_id, station_name) VALUES
(1, 'Harrow & Wealdstone'),
(2, 'Kenton'),
(3, 'South Kenton'),
(4, 'North Wembley'),
(5, 'Wembley Central'),
(6, 'Stonebridge Park'),
(7, 'Harlesden'),
(8, 'Willesden Junction'),
(9, 'Kensal Green'),
(10, 'Queens Park'),
(11, 'Kilburn Park'),
(12, 'Maida Vale'),
(13, 'Warwick Avenue'),
(14, 'Paddington'),
(15, 'Edgware Road'),
(16, 'Marylebone'),
(17, 'Baker Street'),
(18, 'Regents Park'),
(19, 'Oxford Circus'),
(20, 'Piccadilly Circus'),
(21, 'Charing Cross'),
(22, 'Embankment'),
(23, 'Waterloo'),
(24, 'Lambeth North'),
(25, 'Elephant & Castle');

-- Insert into Services
INSERT INTO Services (service_id, service_name) VALUES
(1, 'Network Rail'),
(2, 'Elizabeth Line');

-- Insert into LineStations
INSERT INTO Line_Station (line_id, station_id, station_order) VALUES
(1, 1, 1),
(1, 2, 2),
(1, 3, 3),
(1, 4, 4),
(1, 5, 5),
(1, 6, 6),
(1, 7, 7),
(1, 8, 8),
(1, 9, 9),
(1, 10, 10),
(1, 11, 11),
(1, 12, 12),
(1, 13, 13),
(1, 14, 14),
(1, 15, 15),
(1, 16, 16),
(1, 17, 17),
(1, 18, 18),
(1, 19, 19),
(1, 20, 20),
(1, 21, 21),
(1, 22, 22),
(1, 23, 23),
(1, 24, 24),
(1, 25, 25);

-- Stations with Network Rail services
INSERT INTO Station_Service (station_id, service_id) VALUES
(1, 1),  -- Harrow & Wealdstone
(5, 1),  -- Wembley Central
(8, 1),  -- Willesden Junction
(10, 1), -- Queens Park
(14, 1); -- Paddington

-- Stations with Elizabeth Line services
INSERT INTO Station_Service (station_id, service_id) VALUES
(14, 2); -- Paddington
