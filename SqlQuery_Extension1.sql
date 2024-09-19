--Extension 1
-- Create Zone table
CREATE TABLE Zone (
    zone_id INT PRIMARY KEY,
    zone_name VARCHAR(10) NOT NULL
);

-- Create Station_Zone table
CREATE TABLE Station_Zone (
    station_id INT NOT NULL,
    zone_id INT NOT NULL,
    PRIMARY KEY (station_id, zone_id),
    FOREIGN KEY (station_id) REFERENCES Station(station_id),
    FOREIGN KEY (zone_id) REFERENCES Zone(zone_id)
);

--Insert Data into Zone
INSERT INTO Zone (zone_id, zone_name) VALUES
(1, 'Zone 1'),
(2, 'Zone 2'),
(3, 'Zone 3'),
(4, 'Zone 4'),
(5, 'Zone 5'),
(6, 'Zone 6');

--Insert Data into Station_Zone
INSERT INTO Station_Zone (station_id, zone_id) VALUES
(1, 5),   -- Harrow & Wealdstone (Zone 5)
(2, 4),   -- Kenton (Zone 4)
(3, 4),   -- South Kenton (Zone 4)
(4, 4),   -- North Wembley (Zone 4)
(5, 4),   -- Wembley Central (Zone 4)
(6, 3),   -- Stonebridge Park (Zone 3)
(7, 3),   -- Harlesden (Zone 3)
(8, 3),   -- Willesden Junction (Zone 3)
(9, 2),   -- Kensal Green (Zone 2)
(10, 2),  -- Queens Park (Zone 2)
(11, 2),  -- Kilburn Park (Zone 2)
(12, 2),  -- Maida Vale (Zone 2)
(13, 2),  -- Warwick Avenue (Zone 2)
(14, 1),  -- Paddington (Zone 1)
(15, 1),  -- Edgware Road (Zone 1)
(16, 1),  -- Marylebone (Zone 1)
(17, 1),  -- Baker Street (Zone 1)
(18, 1),  -- Regents Park (Zone 1)
(19, 1),  -- Oxford Circus (Zone 1)
(20, 1),  -- Piccadilly Circus (Zone 1)
(21, 1),  -- Charing Cross (Zone 1)
(22, 1),  -- Embankment (Zone 1)
(23, 1),  -- Waterloo (Zone 1)
(24, 1),  -- Lambeth North (Zone 1)
(25, 1);  -- Elephant & Castle (Zone 1)


--PostgreSQL Function to Append Zone to Station Name
CREATE OR REPLACE FUNCTION get_station_name_with_zone(p_station_id INT)
RETURNS VARCHAR AS $$
DECLARE
    v_station_name VARCHAR(50);
    zones TEXT;
BEGIN
    -- Get the station name
    SELECT station_name INTO v_station_name
    FROM Station
    WHERE station_id = p_station_id;

    -- Get all zones for the station
    SELECT STRING_AGG(zone_name, '/') INTO zones
    FROM Zone z
    JOIN Station_Zone sz ON z.zone_id = sz.zone_id
    WHERE sz.station_id = p_station_id;

    -- Return the station name with zones appended
    RETURN v_station_name || ' (Zone ' || zones || ')';
END;
$$ LANGUAGE plpgsql;


-- Example of use
SELECT get_station_name_with_zone(16) AS station_with_zone;

