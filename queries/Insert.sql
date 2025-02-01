


INSERT INTO zones
(zone_name)
VALUES
('Zone 1'),
('Zone 2')
;



INSERT INTO stations
(open_status, station_name, zone_id)
VALUES
(TRUE,	'Harrow & Wealdstone', 2), -- id 1
(TRUE,	'Kenton'             , 2),
(TRUE,	'South Kenton'       , 2),
(TRUE,	'North Wembley'      , 2),
(TRUE,	'Wembley Central'    , 2),
(TRUE,	'Stonebridge Park'   , 2),
(TRUE,	'Harlesden'          , 2),
(TRUE,	'Willesden Junction' , 2),
(TRUE,	'Kensel Green'       , 2),
(TRUE,	'Queens Park'        , 2),
(TRUE,	'Kilburn Park'       , 2),
(TRUE,	'Maida Vale'         , 2),
(TRUE,	'Warwick Avenue'     , 2),
(TRUE,	'Paddington'         , 1),
(TRUE,	'Edgeware Road'      , 1),
(TRUE,	'Marylebone'         , 1),
(TRUE,	'Baker Street'       , 1),
(TRUE,	'Regents Park'       , 1),
(TRUE,	'Oxford Circus'      , 1),
(TRUE,	'Piccadilly Circus'  , 1),
(TRUE,	'Charing Cross'      , 1),
(TRUE,	'Embankment'         , 1),
(TRUE,	'Waterloo'           , 1),
(TRUE,	'Lambeth North'      , 1),
(TRUE,	'Elephant and Castle', 1) -- id 25
;

UPDATE stations
SET open_status = False
WHERE (station_name = 'Maida Vale');


INSERT INTO services
(service_name)
VALUES
('Bakerloo Line'),
('London Overground'),
('National Rail'),
('Circle Line'),
('District Line'),
('Hammersmith & City Line'),
('Jubilee Line'),
('Metropolitan Line'),
('Victoria Line'),
('Piccadilly Line'),
('Northern Line'),
('Waterloo & City Line'),

('Network Rail')
;

INSERT INTO lines
(start_station, end_station, service_id)
VALUES
(1, 25, 1) -- id 1, (service_id[1] == Bakerloo Line)
;

INSERT INTO connections
(station_id, connected_station_id)
VALUES
(1,  2  ),
(2,  3  ),
(3,  4  ),
(4,  5  ),
(5,  6  ),
(6,  7  ),
(7,  8  ),
(8,  9  ),
(9,   10 ),
(10,  11  ),
(11,  12  ),
(12,  13  ),
(13,  14  ),
(14,  15  ),
(15,  16  ),
(16,  17  ),
(17,  18  ),
(18,  19  ),
(19,  20  ),
(20,  21  ),
(21,  22  ),
(22,  23  ),
(23,  24  ),
(24,  25  )
;

INSERT INTO connecting_lines
(duration_min, line_id, station_id, connecting_station_id)
VALUES
(15, 1, 1,  2  ),
(15, 1, 2,  3  ),
(15, 1, 3,  4  ),
(15, 1, 4,  5  ),
(15, 1, 5,  6  ),
(15, 1, 6,  7  ),
(15, 1, 7,  8  ),
(15, 1, 8,  9  ),
(15, 1, 9,   10 ),
(15, 1, 10,  11  ),
(15, 1, 11,  12  ),
(15, 1, 12,  13  ),
(15, 1, 13,  14  ),
(15, 1, 14,  15  ),
(15, 1, 15,  16  ),
(15, 1, 16,  17  ),
(15, 1, 17,  18  ),
(15, 1, 18,  19  ),
(15, 1, 19,  20  ),
(15, 1, 20,  21  ),
(15, 1, 21,  22  ),
(15, 1, 22,  23  ),
(15, 1, 23,  24  ),
(15, 1, 24,  25  )
-- (15, 1, 25,  25  ) -- id 1
;



CREATE FUNCTION addServicesByName(_station_name VARCHAR(128), _service_name VARCHAR(128))
RETURNS int
LANGUAGE plpgsql
AS
$$
DECLARE
   _found_station INT;
   _found_service INT;
BEGIN
   SELECT id
   INTO _found_station
   FROM stations s
   WHERE (_station_name = s.station_name);
   
   SELECT id
   INTO _found_service
   FROM services s
   WHERE (_service_name = s.service_name);
   
   INSERT INTO station_services
	(service_id, station_id)
	VALUES
	(_found_service, _found_station);
   return 0;
END;
$$;
drop function addServicesByName;


SELECT addServicesByName('Harrow & Wealdstone' , 'Bakerloo Line');
SELECT addServicesByName('Harrow & Wealdstone' , 'London Overground');
SELECT addServicesByName('Harrow & Wealdstone' , 'National Rail');
SELECT addServicesByName('Kenton'              , 'Bakerloo Line');
SELECT addServicesByName('Kenton'              , 'London Overground');
SELECT addServicesByName('South Kenton'        , 'Bakerloo Line');
SELECT addServicesByName('South Kenton'        , 'London Overground');
SELECT addServicesByName('North Wembley'       , 'Bakerloo Line');
SELECT addServicesByName('North Wembley'       , 'London Overground');
SELECT addServicesByName('Wembley Central'     , 'Bakerloo Line');
SELECT addServicesByName('Wembley Central'     , 'London Overground');
SELECT addServicesByName('Wembley Central'     , 'National Rail');
SELECT addServicesByName('Stonebridge Park'    , 'Bakerloo Line');
SELECT addServicesByName('Stonebridge Park'    , 'London Overground');
SELECT addServicesByName('Harlesden'           , 'Bakerloo Line');
SELECT addServicesByName('Harlesden'           , 'London Overground');
SELECT addServicesByName('Willesden Junction'  , 'Bakerloo Line');
SELECT addServicesByName('Willesden Junction'  , 'London Overground');
SELECT addServicesByName('Kensel Green'        , 'Bakerloo Line');
SELECT addServicesByName('Kensel Green'        , 'London Overground');
SELECT addServicesByName('Queens Park'         , 'Bakerloo Line');
SELECT addServicesByName('Queens Park'         , 'London Overground');
SELECT addServicesByName('Kilburn Park'        , 'Bakerloo Line');
SELECT addServicesByName('Maida Vale'          , 'Bakerloo Line');
SELECT addServicesByName('Warwick Avenue'      , 'Bakerloo Line');
SELECT addServicesByName('Paddington'          , 'Bakerloo Line');
SELECT addServicesByName('Paddington'          , 'Circle Line');
SELECT addServicesByName('Paddington'          , 'District Line');
SELECT addServicesByName('Paddington'          , 'Hammersmith & City Line');
SELECT addServicesByName('Paddington'          , 'National Rail');
SELECT addServicesByName('Edgeware Road'       , 'Bakerloo Line');
SELECT addServicesByName('Edgeware Road'       , 'Circle Line');
SELECT addServicesByName('Edgeware Road'       , 'District Line');
SELECT addServicesByName('Edgeware Road'       , 'Hammersmith & City Line');
SELECT addServicesByName('Marylebone'          , 'Bakerloo Line');
SELECT addServicesByName('Marylebone'          , 'National Rail');
SELECT addServicesByName('Baker Street'        , 'Bakerloo Line');
SELECT addServicesByName('Baker Street'        , 'Circle Line');
SELECT addServicesByName('Baker Street'        , 'Hammersmith & City Line');
SELECT addServicesByName('Baker Street'        , 'Jubilee Line');
SELECT addServicesByName('Baker Street'        , 'Metropolitan Line');
SELECT addServicesByName('Regents Park'        , 'Bakerloo Line');
SELECT addServicesByName('Oxford Circus'       , 'Bakerloo Line');
SELECT addServicesByName('Oxford Circus'       , 'Central Line');
SELECT addServicesByName('Oxford Circus'       , 'Victoria Line');
SELECT addServicesByName('Piccadilly Circus'   , 'Bakerloo Line');
SELECT addServicesByName('Piccadilly Circus'   , 'Piccadilly Line');
SELECT addServicesByName('Charing Cross'       , 'Bakerloo Line');
SELECT addServicesByName('Charing Cross'       , 'Northern Line');
SELECT addServicesByName('Charing Cross'       , 'National Rail');
SELECT addServicesByName('Embankment'          , 'Bakerloo Line');
SELECT addServicesByName('Embankment'          , 'Circle Line');
SELECT addServicesByName('Embankment'          , 'District Line');
SELECT addServicesByName('Embankment'          , 'Northern Line');
SELECT addServicesByName('Waterloo'            , 'Bakerloo Line');
SELECT addServicesByName('Waterloo'            , 'Jubilee Line');
SELECT addServicesByName('Waterloo'            , 'Northern Line');
SELECT addServicesByName('Waterloo'            , 'Waterloo & City Line');
SELECT addServicesByName('Waterloo'            , 'National Rail');
SELECT addServicesByName('Lambeth North'       , 'Bakerloo Line');
SELECT addServicesByName('Elephant and Castle' , 'Bakerloo Line');
SELECT addServicesByName('Elephant and Castle' , 'Northern Line');
SELECT addServicesByName('Elephant and Castle' , 'National Rail');






